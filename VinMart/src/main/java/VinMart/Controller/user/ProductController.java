package VinMart.Controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import VinMart.dao.LohangDao;
import VinMart.dao.ProductDao;
import VinMart.dao.UserDao;
import VinMart.dao.cartDao;
import VinMart.entities.CT_DonHang;
import VinMart.entities.Donhang;
import VinMart.entities.Products;
import VinMart.service.User.CategoryService;

@Controller
public class ProductController extends BaseController {
	
	@Autowired
	 private CategoryService cateService;
	@RequestMapping(value ={"/chi-tiet-san-pham/{product_id}"}, method= RequestMethod.GET)
	public ModelAndView Index(@PathVariable long product_id,HttpServletRequest request,HttpServletResponse response) throws Exception {
		int pro = (int) product_id;
		int check = _pro.getSLTK(pro);
			System.out.println("check 2 ="  +check); 
			if(check ==0)
 		{	
				System.out.println("oke da vao" ); 
 			_pro.updateTrangThaiBangHai(pro);// chuyen trang thai  =2 cua san pham
 			 return new ModelAndView( "redirect:/trang-chu");
 		}
		HttpSession session = request.getSession(true);
		if(session.isNew()==false) {
			 
			
			//lay han su dung
			 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
             
           	String start = _lo.GetDateOfLoByID(pro).getNgaysanxuat();
            System.out.println("ngaysx ="  +start);
           
           	Date hsd = null;
         	String endDate = _lo.GetDateOfLoByID(pro).getHansudung();
         	System.out.println("hansd ="  +endDate);
         	hsd = simpleDateFormat.parse(endDate);
         	
         	long getdays =0;
         	
         	// hàm để update lại số lượng nếu hết hạn
         	Date date = new Date();
         	String getnow = simpleDateFormat.format(date);// format lai ngay hien tai 
         	Date ngayhientai = simpleDateFormat.parse(getnow); 
         	
         	System.out.println("hsx.getTime() ="  +hsd.getTime());   
         	System.out.println("ngayhientai.getTime() ="  +ngayhientai.getTime());  
         	if(hsd.getTime()<=ngayhientai.getTime()) // nếu hsd nhỏ hơn ngày hiện tại
         	{	
         		int soluongnhap = new LohangDao().getSoLuongNhap(pro,endDate,start); // lay so luong nhap de trừ ra số lượng tồn kho trong table san pham
         		System.out.println("soluongnhap ="  +soluongnhap);   
         		       		
         			_lo.updateTrangthaiLo(pro,endDate,start,soluongnhap); // chuyen trang thai  =2 cua lo
         			_pro.updateSLTK(pro,soluongnhap);
         			
             		getdays = ngayhientai.getTime() - hsd.getTime();
         		
         		
         		
         	}
         	else {// nếu hsd lớn hơn ngày hiện tại
         		 getdays = hsd.getTime() - ngayhientai.getTime();
         	}
         	
         	
         	int day = (int) TimeUnit.MILLISECONDS.toDays(getdays);
         	
         	_mvShare.addObject("day",day);
			//end lay han su dung
         	
			ArrayList<Products> dsGioHang = new ArrayList<Products>();
         	dsGioHang = cartDao.getGioHang();
         	int idcart = 0;
         	int sltk = 0;
         	for(int i=0;i<dsGioHang.size();i++)
         	{
         		if(dsGioHang.get(i).getProduct_id()==pro)
         		{
         			 idcart = dsGioHang.get(i).getProduct_id();
         			 sltk = dsGioHang.get(i).getProduct_soluongtonkho();
         		}
         		
         	}
			 System.out.println("id cart ="  +idcart);
			 System.out.println("sltk ="  +sltk);
			 
			 _mvShare.addObject("idcart",idcart);
			 _mvShare.addObject("sltk",sltk);
			new ProductDao().updateView(pro);
			_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header tu function 	
			_mvShare.addObject("pro",_pro.GetProductByID(product_id)); // load du lieu san pham theo id danh muc
			_mvShare.addObject("Byid",_pro.GetProductByID(product_id).getProduct_danhmuc()); // load du lieu de lay id cho link
			_mvShare.addObject("ByName",_pro.GetCateName(_pro.GetProductByID(product_id).getProduct_danhmuc()).getCategory_name()); // load du lieu de lay names cho link
			int i= _pro.GetProductByID(product_id).getProduct_danhmuc(); 
			
			_mvShare.addObject("AllProductsById",cateService.GetSpLienquanByID(i)); 
			
			_mvShare.addObject("Spbanchay",_pro.GetSpBanChay()); // load du lieu san pham ban chay
	
			//_mvShare.addObject("getNamecate",cateService.GetNameByID(i)); 
			//System.out.print("getNamecate: "+ cateService.GetNameByID(i));
		}
		_mvShare.setViewName("customer/product_details");
	return _mvShare;
	}
	 
	@RequestMapping(value ="/Thanhtoan", method= RequestMethod.POST)
	public void thanhToan(HttpServletRequest request,  HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		HttpSession session = request.getSession();
		cartDao cart = new cartDao();
		String[] product_id = request.getParameterValues("product_id[]");		
		String[] soLuong = request.getParameterValues("soLuong[]");
		
		//doi sang int[]
		int size_id = product_id.length;
		int size_sl = soLuong.length;
	    int [] arr_id = new int [size_id];
	    int [] arr_sl = new int [size_sl];
	    for(int i=0; i<size_id; i++) {
	    	arr_id[i] = Integer.parseInt(product_id[i]);
	    }
	    for(int i=0; i<size_sl; i++) {
	    	arr_sl[i] = Integer.parseInt(soLuong[i]);
	    }
	    if(cart.checkSLmua(arr_id,arr_sl)==true) {
	    	int nguoimua_id = Integer.parseInt(request.getParameter("nguoimua_id"));
			Date donhang_ngaydat = new Date();
			int donhang_trangthai = Integer.parseInt("1"); // vừa vô mua mặc định là 1 là đang chờ duyệt
			
			String donhang_dahuy = request.getParameter("NULL"); // chua huy
			Donhang dh = new Donhang();	
			dh.setNguoimua_id(nguoimua_id);
			dh.setDonhang_ngaydat(donhang_ngaydat);
			dh.setDonhang_trangthai(donhang_trangthai);
			
			dh.setDonhang_dahuy(donhang_dahuy);
			new cartDao().adddh(dh);
			
			
			
			String[] thanhtien = request.getParameterValues("thanhtien[]");
			String diachi = request.getParameter("diachi");
			String province = request.getParameter("province_id");		
			String district = request.getParameter("district");	
			String ward = request.getParameter("ward"); 	
			CT_DonHang ct_dh = new 	CT_DonHang();
			ct_dh.setProduct_id(product_id);
			ct_dh.setSoLuong(soLuong);
			ct_dh.setThanhtien(thanhtien);
			ct_dh.setDiachi(diachi);	
			ct_dh.setProvince(province);
			ct_dh.setDistrict(district);
			ct_dh.setWard(ward);
			
			new cartDao().addctdh(ct_dh);
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			new UserDao().sendMailThanhToan(email,name);
			
		   
		    session.setAttribute("checkouts", "true");
	    }
	    else {
	    	session.setAttribute("Thanhtoanfail", "true");
	    }
	    
	    String[] product_idDel  = request.getParameterValues("product_idDel[]");
		int size = product_idDel.length;
	    int [] arr = new int [size];
	    for(int i=0; i<size; i++) {
	         arr[i] = Integer.parseInt(product_idDel[i]);
	    }
	    System.out.println(Arrays.toString(arr));
	    new cartDao().xoa(arr);
		
	    response.sendRedirect("gio-hang");
	}
	
	//Vào THUC HIEN XOA san pham khoi gio hang
	@RequestMapping(value ="/del-product-cart", method= RequestMethod.POST)
	public String xoaCate(@RequestParam("product_id") int product_id) {

		new cartDao().xoaSanPhamRakhoiGioHang(product_id);
	
		return "redirect:/gio-hang";
	}
	
	
	@RequestMapping(value ="/Xoatatca", method= RequestMethod.POST)
	public void xoaTatCa(HttpServletRequest request,  HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");	
		HttpSession session = request.getSession();
		String[] product_idDel  = request.getParameterValues("product_idDel[]");
		int size = product_idDel.length;
	    int [] arr = new int [size];
	    for(int i=0; i<size; i++) {
	         arr[i] = Integer.parseInt(product_idDel[i]);
	    }
	    System.out.println(Arrays.toString(arr));
	    new cartDao().xoa(arr);
	    session.setAttribute("xoaThanhCong", "true");
	    response.sendRedirect("gio-hang");
	}
	
	
	@RequestMapping(value ="/lich-su-mua-hang/{id}", method= RequestMethod.GET)
	public ModelAndView lichSuMuaHang(@PathVariable int id,HttpSession session) {
		_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header  tu function
		session.setAttribute("idKhachHang", id);
		_mvShare.setViewName("customer/lichsumuahang");
	return _mvShare;
	}
}
