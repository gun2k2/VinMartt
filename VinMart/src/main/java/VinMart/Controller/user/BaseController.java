package VinMart.Controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import VinMart.service.Admin.CT_DonhangService;
import VinMart.service.Admin.DonhangService;
import VinMart.service.Admin.LohangService;
import VinMart.service.Admin.PhieunhapService;
import VinMart.service.User.AccountService;
import VinMart.service.User.CategoryService;
import VinMart.service.User.ProductService;

@Controller
public class BaseController {
	
	
	@Autowired
	public CategoryService _cate;
	@Autowired
	public ProductService _pro;
	
	@Autowired
	public LohangService _lo;
	@Autowired
	public DonhangService _dh;
	@Autowired
	public CT_DonhangService _ct_dh;
	@Autowired
	public AccountService _acc;
	@Autowired
	public PhieunhapService _phieunhap;
	public ModelAndView _mvShare = new ModelAndView();
	
	
}
