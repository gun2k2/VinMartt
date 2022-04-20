package VinMart.Controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import VinMart.entities.Paginates;
import VinMart.service.User.CategoryService;
import VinMart.service.User.PaginatesService;

@Controller
public class CategoryController  extends BaseController {
	@Autowired
	 private CategoryService cateService;
	
	@Autowired
	private PaginatesService paginatesService;
	
	private int totalProductsPage = 8; // bien dung chung
	
	@RequestMapping(value = "/san-pham/{category_id}")
	public ModelAndView Product(@PathVariable String category_id) {
		
		_mvShare.setViewName("customer/product");
		_mvShare.addObject("cate",_cate.listAll()); // load du lieu header		
		int totalData = cateService.GetAllByID(Integer.parseInt(category_id)).size();
		Paginates paginataInfo = paginatesService.GetInfoPaginates(totalData, totalProductsPage, 1);
		_mvShare.addObject("paginataInfo",paginataInfo); // load du lieu san pham theo id danh muc
		_mvShare.addObject("id",category_id); 
		_mvShare.addObject("name",_pro.GetCateName(Integer.parseInt(category_id)).getCategory_name()); 
		_mvShare.addObject("ProductsPaginate",cateService.GetDataProductsPaginate(Integer.parseInt(category_id), paginataInfo.getStart(), totalProductsPage));
		//_mvShare.addObject("AllProductsById",cateService.GetAllByID(Integer.parseInt(category_id))); // load du lieu san pham theo id danh muc

		return _mvShare;
	}
	
	@RequestMapping(value = "/san-pham/{category_id}/{currentPage}")
	public ModelAndView Product(@PathVariable String category_id, @PathVariable String currentPage ) {
		_mvShare.setViewName("customer/product");
		_mvShare.addObject("cate",_cate.listAll()); // load du lieu header		
		int totalData = cateService.GetAllByID(Integer.parseInt(category_id)).size();
		Paginates paginataInfo = paginatesService.GetInfoPaginates(totalData, totalProductsPage, Integer.parseInt(currentPage));
		_mvShare.addObject("paginataInfo",paginataInfo); // load du lieu san pham theo id danh muc
		_mvShare.addObject("id",category_id); 
		_mvShare.addObject("ProductsPaginate",cateService.GetDataProductsPaginate(Integer.parseInt(category_id), paginataInfo.getStart(), totalProductsPage));

		return _mvShare;
	}
	
}
