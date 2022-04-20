package VinMart.Controller.admin;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import VinMart.Controller.user.BaseController;
import VinMart.dao.LohangDao;
import VinMart.dao.ProductDao;
import VinMart.dao.phieunhapDao;
import VinMart.entities.ConnectionToDB;
import VinMart.entities.Lohang;
import VinMart.entities.NhaCungCap;
import VinMart.entities.Products;
import VinMart.entities.Users;

@Controller
public class proController extends BaseController {

	// Vào giao diện LIST Product
	@RequestMapping(value = "/List-Product")
	public ModelAndView ListProduct(ModelMap model, HttpSession session) {
		List<Products> listSP = new ArrayList<Products>();
		listSP = _pro.listAllPro();
		model.addAttribute("pro", listSP); // load du lieu tu function
		
		
		_mvShare.addObject("nsx", LocalDate.now()); // ngày sản xuất
		_mvShare.addObject("hsd", LocalDate.now().plusDays(1)); // hạn sử dụng

		_mvShare.addObject("listSPkodcxoa", getListSPkodcxoa()); // Ds sản phẩm không được xoá

		_mvShare.addObject("listCate", _cate.listAll()); // Ds Danh mục

		_mvShare.setViewName("admin/product/Listproduct");

		_mvShare.addObject("newId", getNewId());

		return _mvShare;
	}

	public List<Integer> getListSPkodcxoa() {
		String sql_ctDH = "select distinct product_id from CT_DonHang";
		String sql_ctPN = "select distinct product_id from CHITIETPN";
		List<Integer> listSPkodcxoa = new ArrayList<Integer>();
		ResultSet rs;
		try {
			// hiển thị xoá hoặc khoá
			rs = new ConnectionToDB().selectData(sql_ctDH);

			while (rs.next()) {
				listSPkodcxoa.add(rs.getInt("product_id"));
			}

			rs = new ConnectionToDB().selectData(sql_ctPN);
			while (rs.next()) {
				listSPkodcxoa.add(rs.getInt("product_id"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return listSPkodcxoa;
	}

	public Integer getNewId() {
		ResultSet rs;
		int kq = 0;
		try {
			rs = new ConnectionToDB().selectData("SELECT MAX(product_id) as id FROM product");
			rs.next();
			kq = rs.getInt("id") + 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kq;
	}

	@ModelAttribute("listNcc")
	public List<NhaCungCap> getListNcc() throws Exception {
		List<NhaCungCap> listNcc = new ArrayList<NhaCungCap>();
		ResultSet rs = new ConnectionToDB().selectData("SELECT * FROM NHACUNGCAP");
		while (rs.next()) {
			NhaCungCap ncc = new NhaCungCap(rs.getInt("maNCC"), rs.getString("TenNCC"), rs.getString("DiaChi"),
					rs.getString("Email"), rs.getString("SDT"));
			listNcc.add(ncc);
		}
		return listNcc;
	}

	// Thêm hoặc Sửa sản phẩm
	@RequestMapping(value = "/List-Product", method = RequestMethod.POST)
	public RedirectView saveOrUpdate(@ModelAttribute("product") @Valid Products product, BindingResult result,
			@RequestParam("image") MultipartFile image, @RequestParam("action") String action,
			HttpServletRequest request, RedirectAttributes model) {
		System.out.println(product);
		if (result.hasErrors() || (image.isEmpty() && action.equals("insert"))) {
			model.addFlashAttribute("thaotacFail", true);
			return new RedirectView("List-Product");
		}

		if (image.isEmpty() == false)
			product.setProduct_image(getFileName(image, request));

		product.setProduct_discount(product.getProduct_discount() > 0 ? product.getProduct_discount() : 0);

		
		if (action.equals("update")) {
			System.out.println("chinh sua sp");
			model.addFlashAttribute("updated", _pro.update(product));
			
		} else {
			System.out.println("them ne");
			String ngaysanxuat = request.getParameter("product_nsx"); 
			String hansudung = request.getParameter("product_hsd"); 
			model.addFlashAttribute("inserted", _pro.save(product));
			new phieunhapDao().themVaoPhieuNhap(product);
			Lohang lo = new Lohang();
			
			lo.setProduct_id(product.getProduct_id());
			lo.setSoluongnhap(product.getProduct_soluongtonkho());
			lo.setNgaysanxuat(ngaysanxuat);
			lo.setHansudung(hansudung);
			int trangthai =0;
			lo.setTrangthai(trangthai);
			System.out.println(lo);
			new LohangDao().save(lo);
			
		}

		return new RedirectView("List-Product");
	}

	public String getFileName(MultipartFile file, HttpServletRequest request) {
		String fileName = file.getOriginalFilename();
		String path = request.getServletContext().getRealPath("") + "assets" + File.separator + "images"
				+ File.separator + fileName;
		System.out.println(path);
		try {
			file.transferTo(new File(path));
		} catch (IllegalStateException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		}
		return fileName;
	}

	@RequestMapping(value = "import-excel", method = RequestMethod.POST)
	public RedirectView importExcell(@RequestParam("file") MultipartFile input, HttpSession session,
			RedirectAttributes model) throws IOException {
		if (!input.getContentType().toString()
				.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
			model.addFlashAttribute("thaotacFail", true);
			return new RedirectView("List-Product");
		}
		XSSFWorkbook workbook = new XSSFWorkbook(input.getInputStream());
		XSSFSheet sheet = workbook.getSheetAt(0);
		Row row;
		Users nhanvien = (Users) session.getAttribute("LoginInfo");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		boolean kq = true;
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			row = (Row) sheet.getRow(i);
			Products product = new Products();
			
			product.setProduct_id(getNewId());
			product.setNhanvien_id(nhanvien.getUsers_id());
			product.setProduct_name(row.getCell(0).toString());
			product.setProduct_price((int) row.getCell(1).getNumericCellValue() );
			product.setProduct_discount((int) row.getCell(2).getNumericCellValue());
			product.setProduct_danhmuc((int) row.getCell(3).getNumericCellValue());
			product.setProduct_image(row.getCell(4).toString());
			product.setProduct_soluongtonkho((int) row.getCell(5).getNumericCellValue());
			product.setProduct_thuonghieu(row.getCell(6).toString());
			product.setProduct_sanxuat(row.getCell(7).toString());
			product.setProduct_thanhphan(row.getCell(8).toString());
			product.setProduct_thetich(row.getCell(9).toString());
			product.setProduct_baoquan(row.getCell(10).toString());
			product.setProduct_sudung(row.getCell(11).toString());
			String nsx =row.getCell(12).getLocalDateTimeCellValue().format(formatter).toString();
			String hsd =row.getCell(13).getLocalDateTimeCellValue().format(formatter).toString();
			
			product.setMaNCC((int) Double.parseDouble(row.getCell(14).toString()));
			product.setProduct_content(row.getCell(15).toString());
			kq = _pro.save(product);
			
			Lohang lo = new Lohang();
			
			lo.setProduct_id(product.getProduct_id());
			lo.setSoluongnhap(product.getProduct_soluongtonkho());
			lo.setNgaysanxuat(nsx);
			lo.setHansudung(hsd);
			int trangthai =0;
			lo.setTrangthai(trangthai);
			
			new LohangDao().save(lo);
			if (kq) new phieunhapDao().themVaoPhieuNhap(product);
			else break;
		}
		model.addFlashAttribute("inserted", kq);
		return new RedirectView("List-Product");
	}

	// Vào giao diện ADD NCC
	@RequestMapping(value = "/add-ncc", method = RequestMethod.GET)
	public ModelAndView AddNcc() {
		_mvShare.setViewName("admin/product/Addncc");
		return _mvShare;
	}

	// Thực hiện ADD của NCC
	@RequestMapping(value = "/ncc-add", method = RequestMethod.POST)
	public String doAddncc(@RequestParam("TenNCC") String TenNCC, @RequestParam("DiaChi") String DiaChi,
			@RequestParam("Email") String Email, @RequestParam("Sdt") String Sdt) {

		NhaCungCap ncc = new NhaCungCap();

		ncc.setTenNCC(TenNCC);
		ncc.setDiaChi(DiaChi);
		ncc.setEmail(Email);
		ncc.setSdt(Sdt);

		_pro.savencc(ncc);

		return "redirect:/List-Product";
	}

	// Thực hiện ADD product old
	@RequestMapping(value = "/add-productOld", method = RequestMethod.POST)
	public RedirectView doAddproductOld(@RequestParam("product_id") int product_id,
			@RequestParam("product_soluongtonkho") int product_soluongtonkho, HttpServletRequest request,
			HttpSession session,@RequestParam("product_nsx") String ngaysanxuat,
			@RequestParam("product_hsd") String hansudung) {
		Products product = _pro.GetProductAddOld(product_id);
		product.setProduct_soluongtonkho(product_soluongtonkho);

		boolean check = new ProductDao().checkIDProDuct(product_id);
		if (check == true) {
			phieunhapDao phieunhap = new phieunhapDao();
			phieunhap.themVaoPhieuNhap(product);
			ArrayList<Products> dsPhieuNhap = new ArrayList<Products>();
			dsPhieuNhap = phieunhapDao.getPhieuNhap();
			session.setAttribute("cart", dsPhieuNhap);

			//_pro.addproductOld(product);
			
			//lô hàng
			Lohang lo = new Lohang();
			lo.setProduct_id(product_id);
			lo.setSoluongnhap(product_soluongtonkho);
			lo.setNgaysanxuat(ngaysanxuat);
			lo.setHansudung(hansudung);
			int trangthai =0;
			lo.setTrangthai(trangthai);
			System.out.println(lo);
			new LohangDao().save(lo);
			session.setAttribute("thaotacSuccess", "true");

		} else {
			session.setAttribute("thaotacFail", "true");

		}

		return new RedirectView("List-Product");

	}

	// Vào THUC HIEN XOA San Pham
	@RequestMapping(value = "/del-product/{product_id}", method = RequestMethod.POST)
	public String xoaProduct(@PathVariable int product_id, ModelMap model, HttpSession session) {

		System.out.println("test: " + product_id);
		phieunhapDao phieunhap = new phieunhapDao();
		phieunhap.xoaSanPhamRakhoiPhieuNhap(product_id);
		_lo.delete(product_id);	
		session.setAttribute("deleted", _pro.delete(product_id));
		return "redirect:/List-Product";
	}

}