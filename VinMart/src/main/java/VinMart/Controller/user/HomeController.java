package VinMart.Controller.user;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.dao.LohangDao;
import VinMart.dao.ProductDao;
import VinMart.entities.Paginates;
import VinMart.service.User.CategoryService;
import VinMart.service.User.PaginatesService;




@Controller
public class HomeController extends BaseController {
 

	@RequestMapping(value ={"/","/trang-chu"}, method= RequestMethod.GET)
	public ModelAndView Index() throws Exception {
		
		//format
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//lay ngay hien tai
		Date date = new Date();
     	String getnow = simpleDateFormat.format(date);// format lai ngay hien tai 
     	Date ngayhientai = simpleDateFormat.parse(getnow); 
     	
		List<String> listHsd = new LohangDao().getHsdforCheck();
		
		for (int i = 0; i <listHsd.size(); i++) {
			Date checkNSX  = simpleDateFormat.parse(listHsd.get(i)); 
			if(checkNSX.getTime()<=ngayhientai.getTime())
			{
				List<String>  listId= new LohangDao().getId(listHsd.get(i));
				List<String>  listSl= new LohangDao().getSl(listHsd.get(i),listId.get(i));
				new LohangDao().UpdateTTLo(listHsd.get(i),Integer.parseInt(listId.get(i)),Integer.parseInt(listSl.get(i))); // chuyen trang thai cua lo hang het han thanh 2
				_pro.updateSLTK(Integer.parseInt(listId.get(i)),Integer.parseInt(listSl.get(i)));
				int soluongtonkho = _pro.getSLTK(Integer.parseInt(listId.get(i)));
				if(soluongtonkho ==0)
		 		{	
					
		 			_pro.updateTrangThaiBangHai(Integer.parseInt(listId.get(i)));// chuyen trang thai  =2 cua san pham
		 			 return new ModelAndView( "redirect:/trang-chu");
		 		}

				
			}
			
			
		}
		
		_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header  tu function 
		_mvShare.addObject("cateTop8",_cate.listtop8()); // load du lieu thanh nav  tu function
		_mvShare.addObject("pro",_pro.listAll()); // load du lieu tu function 
		_mvShare.addObject("proKm",_pro.listAllkm()); // load du lieu tu function 
		_mvShare.addObject("Spbanchay",_pro.GetSpBanChay()); // load du lieu san pham ban chay
		
		_mvShare.setViewName("customer/index");
	return _mvShare;
	}
	
	@RequestMapping(value ="/gio-hang", method= RequestMethod.GET)
	public ModelAndView Cart() {
	
		_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header  tu function 
		System.out.print("hello: ");
		_mvShare.setViewName("customer/cart");
	return _mvShare;
	}
	
	@RequestMapping(value ="/check-outs", method= RequestMethod.GET)
	public ModelAndView Checkouts() {

		
			_mvShare.setViewName("customer/checkouts");
	return _mvShare;
	}
	
	@RequestMapping(value ="/district", method= RequestMethod.POST)
	public ModelAndView Districts() {

		_mvShare.setViewName("customer/district");
	return _mvShare;
	}
	
	@RequestMapping(value ="/ward", method= RequestMethod.POST)
	public ModelAndView Wards() {

		_mvShare.setViewName("customer/ward");
	return _mvShare;
	}
	
	@RequestMapping(value ="/tim-kiem", method= RequestMethod.GET)
	public ModelAndView Timkiems() {
		_mvShare.addObject("cate",_cate.listAll()); // load du lieu Header  tu function
		_mvShare.setViewName("customer/search");
	return _mvShare;
	}
	
	@RequestMapping(value ="/Loads", method= RequestMethod.GET)
	public ModelAndView Loads(@RequestParam("amount") String amount) {
		System.out.println("amount" + amount);
		_mvShare.addObject("pro",_pro.listAll(Integer.parseInt(amount))); // load du lieu tu function 
		_mvShare.setViewName("customer/loadproduct");
	return _mvShare;
	}
	
	@RequestMapping(value ="/LoadsTraiCay", method= RequestMethod.GET)
	public ModelAndView LoadsTraiCay(@RequestParam("amount") String amount) {
		System.out.println("amount" + amount);
		_mvShare.addObject("proKm",_pro.listAllkm(Integer.parseInt(amount))); // load du lieu tu function 
		_mvShare.setViewName("customer/loadnuocuongtraicay");
	return _mvShare;
	}
	
	@RequestMapping(value ="/khuyenmai", method= RequestMethod.GET)
	public ModelAndView Khuyenmai() {

		_mvShare.setViewName("customer/sapxep/khuyenmai");
	return _mvShare;
	}
	@Autowired
	 private CategoryService cateService;
	
	@Autowired
	private PaginatesService paginatesService;
	
	private int totalProductsPage = 8; // bien dung chung
	
	//Sap xep tang dan
	@RequestMapping(value ="/tangdan", method= RequestMethod.POST)
	public ModelAndView Tangdan(HttpServletRequest rq) {
		String category_id = rq.getParameter("category_id");
		System.out.println("category_id =" + category_id);
		int totalData = cateService.GetAllByID(Integer.parseInt(category_id)).size();
		Paginates paginataInfo = paginatesService.GetInfoPaginates(totalData, totalProductsPage, 1);
		
		_mvShare.addObject("id",category_id); 
		_mvShare.addObject("ProductsPaginate",cateService.GetDataProductsPaginatetangdan(Integer.parseInt(category_id), paginataInfo.getStart(), totalProductsPage));
		_mvShare.setViewName("customer/sapxep/sapxep");
	return _mvShare;
	}
	
	//Sap xep giam dan
	@RequestMapping(value ="/giamdan", method= RequestMethod.POST)
	public ModelAndView Giamdan(HttpServletRequest rq) {
		String category_id = rq.getParameter("category_id");
		System.out.println("category_id =" + category_id);
		int totalData = cateService.GetAllByID(Integer.parseInt(category_id)).size();
		Paginates paginataInfo = paginatesService.GetInfoPaginates(totalData, totalProductsPage, 1);
		
		_mvShare.addObject("id",category_id); 
		_mvShare.addObject("ProductsPaginate",cateService.GetDataProductsPaginategiamdan(Integer.parseInt(category_id), paginataInfo.getStart(), totalProductsPage));
		_mvShare.setViewName("customer/sapxep/sapxep");
	return _mvShare;
	}
	
	//Sap xep Khuyen mai
		@RequestMapping(value ="/khuyenmai", method= RequestMethod.POST)
		public ModelAndView Khuyenmai(HttpServletRequest rq) {
			String category_id = rq.getParameter("category_id");
			System.out.println("category_id =" + category_id);
			int totalData = cateService.GetAllByID(Integer.parseInt(category_id)).size();
			Paginates paginataInfo = paginatesService.GetInfoPaginates(totalData, totalProductsPage, 1);
			
			_mvShare.addObject("id",category_id); 
			_mvShare.addObject("ProductsPaginate",cateService.GetDataProductsPaginatekhuyenmai(Integer.parseInt(category_id), paginataInfo.getStart(), totalProductsPage));
			_mvShare.setViewName("customer/sapxep/sapxep");
		return _mvShare;
		}
		
		//Sap xep Ban chay
				@RequestMapping(value ="/banchay", method= RequestMethod.POST)
				public ModelAndView Banchay(HttpServletRequest rq) {
					String category_id = rq.getParameter("category_id");
					System.out.println("category_id =" + category_id);
					int totalData = cateService.GetAllByID(Integer.parseInt(category_id)).size();
					Paginates paginataInfo = paginatesService.GetInfoPaginates(totalData, totalProductsPage, 1);
					
					_mvShare.addObject("id",category_id); 
					_mvShare.addObject("ProductsPaginate",cateService.GetDataProductsPaginatebanchay(Integer.parseInt(category_id), paginataInfo.getStart(), totalProductsPage));
					_mvShare.setViewName("customer/sapxep/sapxep");
				return _mvShare;
				}
	//Sap xep giam dan
		@RequestMapping(value ="/sapxepspmoi", method= RequestMethod.POST)
		public ModelAndView spMoi(HttpServletRequest rq) {
		String category_id = rq.getParameter("category_id");
		System.out.println("category_id =" + category_id);
		int totalData = cateService.GetAllByID(Integer.parseInt(category_id)).size();
		Paginates paginataInfo = paginatesService.GetInfoPaginates(totalData, totalProductsPage, 1);
		_mvShare.addObject("id",category_id); 
		_mvShare.addObject("ProductsPaginate",cateService.GetDataProductsPaginatenew(Integer.parseInt(category_id), paginataInfo.getStart(), totalProductsPage));
		_mvShare.setViewName("customer/sapxep/sapxep");
		return _mvShare;
		} 

		@RequestMapping(value ="/admin-page", method= RequestMethod.GET)
		public ModelAndView Adminpages() {
			
			_mvShare.setViewName("admin/index");
		return _mvShare;
		}
	
}
