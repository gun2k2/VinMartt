package VinMart.Controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.dao.CT_DonhangDao;
import VinMart.dao.ProductDao;
import VinMart.entities.CT_DonHang;
import VinMart.entities.CT_Phieunhap;
import VinMart.entities.ConnectionToDB;
import VinMart.entities.Donhang;
import VinMart.entities.Products;
import VinMart.service.Admin.AccountServiceAdmin;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class donhangController extends BaseController {
	@Autowired
	private AccountServiceAdmin _accountService;

	// Vào giao diện LIST DON HANG
	@RequestMapping(value = "/List-Donhang")
	public ModelAndView ListDonHang() {

		_mvShare.addObject("Listdh", _dh.listDhID1()); // load du lieu list don hang co trang thai =1
		_mvShare.addObject("view_customers", _accountService.GetAllCustomers());
		_mvShare.addObject("view_employees", _accountService.GetAllEmployees());
		_mvShare.setViewName("admin/donhang/donhang");
		return _mvShare;
	}

	@RequestMapping(value = "/xac-nhan-hang", method = RequestMethod.POST)
	public ModelAndView Xacnhanhang() {

		_mvShare.addObject("Listdh", _dh.listDhID1()); // load du lieu list don hang co trang thai =1
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
		return _mvShare;
	}

	@RequestMapping(value = "/cho-xuat-hang", method = RequestMethod.POST)
	public ModelAndView Choxuathang() {

		_mvShare.addObject("Listdh", _dh.listDhID2()); // load du lieu list don hang co trang thai =2
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
		return _mvShare;
	}

	@RequestMapping(value = "/dang-giao-hang", method = RequestMethod.POST)
	public ModelAndView Danggiaohang() {

		_mvShare.addObject("Listdh", _dh.listDhID3()); // load du lieu list don hang co trang thai =3
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
		return _mvShare;
	}

	@RequestMapping(value = "/giao-thanh-cong", method = RequestMethod.POST)
	public ModelAndView Giaothanhcong() {

		_mvShare.addObject("Listdh", _dh.listDhID4()); // load du lieu list don hang co trang thai =4
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
		return _mvShare;
	}

	@RequestMapping(value = "/huy-giao-hang", method = RequestMethod.POST)
	public ModelAndView HuyGiaoHang() {

		_mvShare.addObject("Listdh", _dh.listDhID0()); // load du lieu list don hang co trang thai =4
		_mvShare.setViewName("admin/donhang/donhangtrangthai");
		return _mvShare;
	}

	// THUC HIEN UPDATE DONHANG
	@RequestMapping(value = "/update-trangthai/{donhang_id}", method = RequestMethod.POST)
	public String doEditcate(@PathVariable int donhang_id, @RequestParam("donhang_trangthai") int donhang_trangthai,
			@RequestParam("nhanvien_id") int nhanvien_id,HttpSession session) {
		
		Donhang dh = new Donhang();
		dh.setDonhang_ngaygiao(null);
		if (donhang_trangthai == 4) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date currentDate = new Date();
			String hientai = simpleDateFormat.format(currentDate); // hien tai
			System.out.println("hientai =" + hientai);
			dh.setDonhang_ngaygiao(hientai);

		}
		ConnectionToDB con = new ConnectionToDB();

		dh.setDonhang_id(donhang_id);
		dh.setDonhang_trangthai(donhang_trangthai);
		dh.setNhanvien_id(nhanvien_id);
		//lo hang
				
				try {
					CT_DonHang ct_dh = new CT_DonhangDao().listCtdh(donhang_id);
					
					for(int i = 0; i < ct_dh.getProduct_id().length; i++) {
						
						int soluongsanphammua = Integer.parseInt(ct_dh.getSoLuong()[i]);
						while(soluongsanphammua >0) {
							System.out.println("soluongsanphammua = " + soluongsanphammua);
					ResultSet lohang = con.selectData("select top (1) * from lohang where product_id = " + ct_dh.getProduct_id()[i] + " and trangthai=1 order by hansudung ASC");
					lohang.next();
					int soluongnhapcuadb = lohang.getInt("soluongnhap"); // lấy từ db
					if(soluongnhapcuadb   <= soluongsanphammua) // nếu lo hàng thứ nhất sp 1 có số lượng < so luong của sản phẩm mua thì chạy dòng if
						{
							soluongsanphammua = soluongsanphammua - soluongnhapcuadb;
							soluongnhapcuadb = soluongsanphammua - soluongnhapcuadb;
							new ConnectionToDB().excuteSql("update lohang set soluongnhap = 0 ,trangthai  =  2 where product_id =" + ct_dh.getProduct_id()[i] +" and malo = " +lohang.getInt("malo") );
						}
					else { 
						int kq = soluongnhapcuadb - soluongsanphammua;
						new ConnectionToDB().excuteSql("update lohang set soluongnhap = "+ kq + "where product_id = " + ct_dh.getProduct_id()[i] +" and malo = " +lohang.getInt("malo"));
						soluongsanphammua =0;
							}
												}
																		}
					} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	
		//end lo hang
				
		_dh.update(dh);
		session.setAttribute("canceluser", "true");
		return "redirect:/List-Donhang";
	}

	// Vào giao diện LIST CTDON HANG
	@RequestMapping(value = "/ct-don-hang/{donhang_id}", method = RequestMethod.POST)
	public ModelAndView ListCTDonHang(@RequestParam(value = "donhang_id", required = false) int donhang_id) {
		System.out.println("donhang_id = " + donhang_id);
		_mvShare.setViewName("admin/donhang/ctdonhang");
		return _mvShare;
	}

	// Vào giao diện HUY DONHANG tu trang nguoi dung
	@RequestMapping(value = "/view-huy/{donhang_id}", method = RequestMethod.GET)
	public ModelAndView Editcate(@PathVariable int donhang_id) {

		System.out.println("donhang_id = " + donhang_id);

		_mvShare.setViewName("customer/lichsumuahang");
		return _mvShare;
	}

	// THUC HIEN HUY DONHANG tu trang nguoi dung
	@RequestMapping(value = "/huy-don-hang", method = RequestMethod.POST)
	public String doCancel(@RequestParam("donhang_id") int donhang_id,
			@RequestParam("donhang_trangthai") int donhang_trangthai, @RequestParam("nguoimua_id") int nguoimua_id,
			@RequestParam(required = false, name = "check_1") String check_1,
			@RequestParam(required = false, name = "check_2") String check_2,
			@RequestParam(required = false, name = "check_3") String check_3,
			@RequestParam(required = false, name = "check_4") String check_4, HttpServletRequest request) {
		Donhang dh = new Donhang();

		HttpSession session = request.getSession();
		
		String donhang_dahuy = check_1 + " " + check_2 + " " + check_3 + " " + check_4;
		dh.setDonhang_id(donhang_id);
		dh.setDonhang_trangthai(donhang_trangthai);
		dh.setDonhang_dahuy(donhang_dahuy);
		
		//Trước khi huỷ thì trả số lượng về sản phẩm tồn kho
		CT_DonHang ct_dh = new CT_DonhangDao().listCtdh(donhang_id);
		System.out.println(ct_dh);
		for(int i = 0; i < ct_dh.getProduct_id().length; i++) {
			System.out.println("product_id: " + ct_dh.getProduct_id()[i]);
			System.out.println("soluong: " +Integer.parseInt(ct_dh.getSoLuong()[i]));
			
			Products product = _pro.GetProductByID((long) Integer.parseInt(ct_dh.getProduct_id()[i]));
			System.out.println("truoc khi huy: "  + product.getProduct_soluongtonkho());
			
			
			try {
				//product
				product.setProduct_soluongtonkho( product.getProduct_soluongtonkho() + Integer.parseInt(ct_dh.getSoLuong()[i]) );	
				product.setProduct_purchased(product.getProduct_purchased() - Integer.parseInt(ct_dh.getSoLuong()[i]));
				System.out.println("sau khi huy: " + product.getProduct_soluongtonkho());
				new ProductDao().updateSLTK(product);
				_dh.cancel(dh);
				session.setAttribute("canceluser", "true");
			} catch (Exception e) {
				session.setAttribute("CartFail", "true");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "redirect:/lich-su-mua-hang/" + nguoimua_id;
	}
	
	// THUC HIEN HUY DONHANG tu trang admin
		@RequestMapping(value = "/huy-don-hang-admin/{donhang_id}", method = RequestMethod.POST)
		public String doCancel(@PathVariable("donhang_id") int donhang_id,
				@RequestParam("donhang_trangthai") int donhang_trangthai, @RequestParam("nhanvien_id") int nhanvien_id,
				 HttpServletRequest request) {
			Donhang dh = new Donhang();

			HttpSession session = request.getSession();
			
			
			dh.setDonhang_id(donhang_id);
			dh.setDonhang_trangthai(donhang_trangthai);
			dh.setNhanvien_id(nhanvien_id);
		
			//Trước khi huỷ thì trả số lượng về sản phẩm tồn kho
			CT_DonHang ct_dh = new CT_DonhangDao().listCtdh(donhang_id);
			System.out.println(ct_dh);
			for(int i = 0; i < ct_dh.getProduct_id().length; i++) {
				System.out.println("product_id: " + ct_dh.getProduct_id()[i]);
				System.out.println("soluong: " +Integer.parseInt(ct_dh.getSoLuong()[i]));
				
				Products product = _pro.GetProductByID((long) Integer.parseInt(ct_dh.getProduct_id()[i]));
				System.out.println("truoc khi huy: "  + product.getProduct_soluongtonkho());
				
				
				try {
					
					//product
					product.setProduct_soluongtonkho( product.getProduct_soluongtonkho() + Integer.parseInt(ct_dh.getSoLuong()[i]) );	
					product.setProduct_purchased(product.getProduct_purchased() - Integer.parseInt(ct_dh.getSoLuong()[i]));
					System.out.println("sau khi huy: " + product.getProduct_soluongtonkho());
					new ProductDao().updateSLTK(product);
					_dh.update(dh);
					session.setAttribute("canceluser", "true");
				} catch (Exception e) {
					session.setAttribute("CartFail", "true");
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return "redirect:/List-Donhang";
		}

	@RequestMapping(value = "getListSpCtdh/{product_id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody Products getSPDH(@PathVariable int product_id) throws Exception {
		ConnectionToDB con = new ConnectionToDB();
		ResultSet sp;
		try {
			sp = con.selectData("select * from product where product_id =  " + product_id);
			while (sp.next()) {
				String product_name = sp.getString("product_name");
				int product_price = sp.getInt("product_price");
				int product_discount = sp.getInt("product_discount");
				System.out.println("oke ");
				Products sanpham = new Products(product_name, product_price, product_discount);
				return sanpham;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "getListCtDH/{donhang_id}", method = RequestMethod.GET, produces = "application/json")
	public @ResponseBody CT_DonHang getListCtPN(@PathVariable Integer donhang_id) {

		return new CT_DonhangDao().listCtdh(donhang_id);

	}

}
