package VinMart.Controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;

@Controller
public class HomieController extends BaseController {
	
	//Vào giao diện ICON
	@RequestMapping(value ="/List-Icon", method= RequestMethod.GET)
	public ModelAndView Admincharts() {

		_mvShare.setViewName("admin/icons");
	return _mvShare;
	}
	
	
	//Vào giao diện Lô hàng
		@RequestMapping(value ="/List-lo-hang", method= RequestMethod.GET)
		public ModelAndView LohangList() {
	
		_mvShare.addObject("lohang", _lo.listLoHang());
		_mvShare.addObject("pro", _pro.listAllPro());
		_mvShare.setViewName("admin/lohang/ListLohang");
		return _mvShare;
		}
	
	
	
	
	
	
}
