package VinMart.Controller.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.dao.ProductDao;
import VinMart.dao.phieunhapDao;
import VinMart.entities.CT_Phieunhap;
import VinMart.entities.ConnectionToDB;
import VinMart.entities.Phieunhap;
import VinMart.entities.Products;

@RestController
public class phieunhapController extends BaseController {

	// Vào giao diện LIST Phieu nhap
	@RequestMapping(value = "/List-Phieu-Nhap", method = RequestMethod.GET)
	public ModelAndView listPhieuNhap() {

		_mvShare.setViewName("admin/phieunhap/Listphieunhap");

		return _mvShare;
	}

	// VAO giao dien LIST CHI TIET PHIEU NHAP
	@RequestMapping(value = "/chi-tiet-phieu-nhap/{MaPn}", method = RequestMethod.POST)
	public ModelAndView listCTPhieuNhap(@PathVariable int MaPn) {

		_mvShare.setViewName("admin/phieunhap/ListCTphieunhap");

		return _mvShare;
	}

	// Vào THUC HIEN XOA Phieu Nhap
	@RequestMapping(value = "/xoa-phieu-nhap/{product_id}", method = RequestMethod.POST)
	public ModelAndView xoaPhieuNhap(@PathVariable int product_id,@RequestParam("product_soluongtonkho") int product_soluongtonkho,HttpSession session) {
		
		
			Products pro = new Products();
			pro.setProduct_id(product_id);
			pro.setProduct_soluongtonkho(product_soluongtonkho);
			phieunhapDao phieunhap = new phieunhapDao();
			phieunhap.xoaSanPhamRakhoiPhieuNhap(product_id);
			
			
			if (phieunhap.kiemTraSanPhamConTrongDBChua(product_id, product_soluongtonkho) == true) {
				session.setAttribute("thaotacSuccess", _lo.delete(product_id));
							
			} else {
				
				_lo.delete(product_id);				
				session.setAttribute("thaotacSuccess", _pro.delete(product_id));
			}
		
			return new ModelAndView("redirect: ../List-Product");
	}

	// tao phieu nhap
	@RequestMapping(value = "/creat-phieu-nhap", method = RequestMethod.POST)
	public void creatPhieuNhap(HttpServletRequest request, HttpServletResponse response) throws IOException {

		Phieunhap pn = new Phieunhap();
		new phieunhapDao().addPN(pn);
		String[] product_id = request.getParameterValues("product_id[]");
		String[] Soluongnhap = request.getParameterValues("Soluongnhap[]");
		String[] Dongianhap = request.getParameterValues("Dongianhap[]");

		CT_Phieunhap ct_pn = new CT_Phieunhap();
		ct_pn.setProduct_id(product_id);
		ct_pn.setDongianhap(Dongianhap);
		ct_pn.setSoluongnhap(Soluongnhap);

		new phieunhapDao().addCTPN(ct_pn);

		// xoa phieu nhap
		int size = product_id.length;
		int[] arr = new int[size];
		for (int i = 0; i < size; i++) {
			arr[i] = Integer.parseInt(product_id[i]);
		}

		new phieunhapDao().xoa(arr);

		response.sendRedirect("List-Phieu-Nhap");
	}
	@RequestMapping(value = "getListSpCtPN/{product_id}" , method = RequestMethod.GET, produces="application/json")
	public @ResponseBody Products getSPPN(@PathVariable int product_id ) throws Exception  {
		ConnectionToDB con = new ConnectionToDB();
		ResultSet sp;		
		try {
			sp= con.selectData("select * from product where product_id =  " + product_id);
			while(sp.next()) {
				String product_name = sp.getString("product_name");
				int product_discount =sp.getInt("product_discount");
				System.out.println("oke " );
				Products sanpham = new Products(product_name,product_discount);
				return sanpham;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;	
	}
	@RequestMapping(value = "getListCtPN/{MaPN}" , method = RequestMethod.GET, produces="application/json")
	public @ResponseBody CT_Phieunhap getListCtPN(@PathVariable Integer MaPN,HttpSession session) {

		ConnectionToDB con = new ConnectionToDB();
		List<String> product_ids = new ArrayList<String>();
		List<String> don_gias = new ArrayList<String>();
		List<String> so_luongs = new ArrayList<String>();		
		ResultSet rs;
		System.out.println("MaPN" + MaPN);
		try {
			rs = con.selectData("select * from CHITIETPN where MaPN =  " + MaPN);
			while (rs.next()) {
				
				product_ids.add(rs.getString("product_id"));
				don_gias.add(rs.getString("Dongianhap"));
				so_luongs.add(rs.getString("Soluongnhap"));
				
			}

		} catch (Exception e) {
			// TODO: handle exception

		}
	
		return new CT_Phieunhap(MaPN, product_ids.toArray(new String[0]), don_gias.toArray(new String[0]),
				 so_luongs.toArray(new String[0]) );
	}

}
