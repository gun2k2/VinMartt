package VinMart.Controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.dao.CategoryDao;
import VinMart.entities.Categorys;

@Controller
public class cateController extends BaseController {

	@ModelAttribute("cate2add")
	public Categorys getCate2add() {
		return new Categorys();
	}
	@ModelAttribute("cate2edit")
	public Categorys getCate2edit() {
		return new Categorys();
	}
	
	// Vào giao diện LIST Category
	@RequestMapping(value = "/List-Category")
	public ModelAndView Admincharts(ModelMap model) {

		_mvShare.addObject("cate", _cate.listAll()); // load du lieu Header tu function
		_mvShare.addObject("listCatekodcxoa", new CategoryDao().getDskodcxoa());
		_mvShare.setViewName("admin/category/Listcategory");

		return _mvShare;
	}
	

	// Thực hiện ADD của cate
	@RequestMapping(value = "/category-add", method = RequestMethod.POST)
	public String doAddcate(@ModelAttribute("cate2add") Categorys cate,
			HttpSession session) {
		System.out.println("cate = " + cate);
		session.setAttribute("inserted", _cate.save(cate));

		return "redirect:/List-Category";
	}

	// THUC HIEN EDIT Category
	@RequestMapping(value = "/category-edit", method = RequestMethod.POST)
	public String doEditcate(@ModelAttribute("cate2edit") Categorys cate, HttpSession session) {
		System.out.println("kq = " + _cate.update(cate));
		session.setAttribute("updated", _cate.update(cate));
		

		return "redirect:/List-Category";
	}

	// Vào THUC HIEN XOA Category
	@RequestMapping(value = "/del-category", method = RequestMethod.POST)
	public String xoaCate(@RequestParam("category_id") int category_id, HttpSession session) {
		session.setAttribute("deleted", _cate.delete(category_id));
		

		return "redirect:/List-Category";
	}

}