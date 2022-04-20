package VinMart.Controller.admin;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.Controller.user.BaseController;
import VinMart.entities.Customers;
import VinMart.entities.Employees;
import VinMart.entities.Users;
import VinMart.service.Admin.AccountServiceAdmin;
import VinMart.service.User.AccountService;

@Controller
public class adminController extends BaseController {
	@Autowired
	private AccountServiceAdmin _accountService;
	@Autowired
	AccountService accountService = new AccountService();
	
	@ModelAttribute("cusedit")
	public Customers getCusEdit() {
		return new Customers();
	}
	
	@ModelAttribute("empedit")
	public Employees getEmpEdit() {
		return new Employees();
	}
	
	// Vào giao diện LIST ADMIN
	@RequestMapping(value = "/List-Admin", method = RequestMethod.GET)
	public ModelAndView Admincharts() {

		_mvShare.setViewName("admin/admin/Listadmin");
		_mvShare.addObject("view_account", _accountService.GetAllAccount());
		
		_mvShare.addObject("view_customers", _accountService.GetAllCustomers());
		_mvShare.addObject("view_employees", _accountService.GetAllEmployees());
		_mvShare.addObject("view_employees_leave", _accountService.GetAllEmployeesLeave());
		return _mvShare;
	}

	
	@RequestMapping(value = "/addEmployee")
	public String AddEmployee(@RequestParam("users_email") String email,
			@RequestParam("users_password") String password, @RequestParam("role_id") int role_id,
			@RequestParam("name") String name, @RequestParam("sdt") String sdt,
			@RequestParam("gioitinh") boolean gioitinh, @ModelAttribute("User") Users user,
			@ModelAttribute("Employee") Employees employee, ModelMap model,HttpSession session) {
		
		 String regex = "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";		 
         Pattern pattern = Pattern.compile(regex);
         Matcher matcher = pattern.matcher(user.getUsers_email());
         
         String regex_sdt = "^[\\+]?\\d{2,}?[(]?\\d{2,}[)]?[-\\s\\.]?\\d{2,}?[-\\s\\.]?\\d{2,}[-\\s\\.]?\\d{0,9}$";
         Pattern pattern_sdt = Pattern.compile(regex_sdt);
         Matcher matcher_sdt = pattern_sdt.matcher(employee.getSdt());
         if (!matcher.matches() || !matcher_sdt.matches()) {
        	 session.setAttribute("emailFail", "true");
         }
         else {
        	//table users
     		user.setUsers_email(email);
     		user.setUsers_password(password);
     		user.setRole_id(role_id);
     		//table nhan vien
     		employee.setName(name);
     		String _name = employee.getName();
     		System.out.println("_name = "  + _name);
     		_name = _name.trim();
     		_name = _name.replaceAll("\\s+", " "); // xoa bo khoang cach
     		
     		 String temp[] = _name.split(" ");
     		 _name = "";
     		 for (int i = 0; i < temp.length; i++) {
     			 _name += String.valueOf(temp[i].charAt(0)).toUpperCase() + temp[i].substring(1);
     	            if (i < temp.length - 1) 
     	            	_name += " ";	
     	        }
     		 
     		employee.setName(_name);
     		employee.setSdt(sdt);
     		employee.setGioitinh(gioitinh);
     		int check = _accountService.AddEmployee(user, employee);
     	
     		if (check > 0) {
     			
     			session.setAttribute("addNV", "true");
     		} else {
     			session.setAttribute("addNVFail", "true");
     		}
         }
		
		return "redirect:/List-Admin";
		
	}
	
	
		@RequestMapping(value = "/addCustomer",method = RequestMethod.POST)
		public String AddCustomer(@RequestParam("users_email") String email,
				@RequestParam("users_password") String password, @RequestParam("name") String name,
				@RequestParam("sdt") String sdt, @RequestParam("gioitinh") boolean gioitinh,
				@ModelAttribute("User") Users user, @ModelAttribute("Customer") Customers customer, ModelMap model,
				HttpSession session) {
			
			
			 String regex = "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";		 
	         Pattern pattern = Pattern.compile(regex);
	         Matcher matcher = pattern.matcher(user.getUsers_email());
	         
	         String regex_sdt = "^[\\+]?\\d{2,}?[(]?\\d{2,}[)]?[-\\s\\.]?\\d{2,}?[-\\s\\.]?\\d{2,}[-\\s\\.]?\\d{0,9}$";
	         Pattern pattern_sdt = Pattern.compile(regex_sdt);
	         Matcher matcher_sdt = pattern_sdt.matcher(customer.getSdt());
	         if (!matcher.matches() || !matcher_sdt.matches()) {
	        	 session.setAttribute("emailFail", "true");
	         }
	         else {
	        	//table users
	 			user.setUsers_email(email);
	 			user.setUsers_password(password);
	 			
	 			
	 			//table khachhang
	 			customer.setName(name);
	 			String _name = customer.getName();
	 			System.out.println("_name = "  + _name);
	 			_name = _name.trim();
	 			_name = _name.replaceAll("\\s+", " "); // xoa bo khoang cach
	 			
	 			 String temp[] = _name.split(" ");
	 			 _name = "";
	 			 for (int i = 0; i < temp.length; i++) {
	 				 _name += String.valueOf(temp[i].charAt(0)).toUpperCase() + temp[i].substring(1);
	 		            if (i < temp.length - 1) 
	 		            	_name += " ";	
	 		        }
	 			 
	 			customer.setName(_name);
	 			customer.setSdt(sdt);
	 			customer.setGioitinh(gioitinh);
	 			int check = accountService.AddAccount(user, customer);
	 			System.out.println("check = " + check);
	 			if (check > 0) {
	 				
	 				session.setAttribute("addNV", "true");
	 			} else {
	 				session.setAttribute("addNVFail", "true");
	 			}
	         }
	         
			
			
			return "redirect:/List-Admin";
		}

	// Vào giao diện EDIT ADMIN
	@RequestMapping(value = "/edit-admin/{id}")
	public String Editadmin(@PathVariable int id, Model model) {
		Users user = _accountService.GetUserById(id);
		model.addAttribute("userid", user);
		return "admin/admin/modalAndajax";
	}

	@RequestMapping("/editadmin")
	public String updateUser(@RequestParam("users_id") int id, @RequestParam("users_password") String password,
			@RequestParam("role_id") int role_id,
			@ModelAttribute("User") Users user) {
		
		user.setUsers_id(id);
		user.setUsers_password(password);
		user.setRole_id(role_id);
		 _accountService.checkEdit(user);
		
		 return "redirect:/List-Admin";
	}

		@RequestMapping(value = "/editcustomer", method = RequestMethod.POST)
		public String updateCustomer( @ModelAttribute("cusedit") Customers customers,HttpSession session) {
			
			 String regex_sdt = "^[\\+]?\\d{2,}?[(]?\\d{2,}[)]?[-\\s\\.]?\\d{2,}?[-\\s\\.]?\\d{2,}[-\\s\\.]?\\d{0,9}$";
	         Pattern pattern_sdt = Pattern.compile(regex_sdt);
	         Matcher matcher_sdt = pattern_sdt.matcher(customers.getSdt());
	         if ( !matcher_sdt.matches()) {
	        	 session.setAttribute("emailFail", "true");
	         }
	         else {
	        	String _name = customers.getName();
	 			System.out.println("_name = "  + _name);
	 			_name = _name.trim();
	 			_name = _name.replaceAll("\\s+", " "); // xoa bo khoang cach
	 			
	 			 String temp[] = _name.split(" ");
	 			 _name = "";
	 			 for (int i = 0; i < temp.length; i++) {
	 				 _name += String.valueOf(temp[i].charAt(0)).toUpperCase() + temp[i].substring(1);
	 		            if (i < temp.length - 1) 
	 		            	_name += " ";	
	 		        }
	 			 
	 			customers.setName(_name);
	 			
	 			session.setAttribute("updated", _accountService.checkEditCustomer(customers));
	         }
	         
			
			return "redirect:/List-Admin";
		}

		@RequestMapping("/editemployee")
		public String updateEmployee(@ModelAttribute("empedit") Employees employees,HttpSession session) {
			
			String regex_sdt = "^[\\+]?\\d{2,}?[(]?\\d{2,}[)]?[-\\s\\.]?\\d{2,}?[-\\s\\.]?\\d{2,}[-\\s\\.]?\\d{0,9}$";
	         Pattern pattern_sdt = Pattern.compile(regex_sdt);
	         Matcher matcher_sdt = pattern_sdt.matcher(employees.getSdt());
	         if ( !matcher_sdt.matches()) {
	        	 session.setAttribute("emailFail", "true");
	         }
	         else {
	        	String _name = employees.getName();
	 			System.out.println("_name = "  + _name);
	 			_name = _name.trim();
	 			_name = _name.replaceAll("\\s+", " "); // xoa bo khoang cach
	 			
	 			 String temp[] = _name.split(" ");
	 			 _name = "";
	 			 for (int i = 0; i < temp.length; i++) {
	 				 _name += String.valueOf(temp[i].charAt(0)).toUpperCase() + temp[i].substring(1);
	 		            if (i < temp.length - 1) 
	 		            	_name += " ";	
	 		        }
	 			 employees.setName(_name);
	 			 session.setAttribute("updated",  _accountService.checkEditEmployee(employees));
	         }
			
			
			 return "redirect:/List-Admin";
		}

		
		@RequestMapping(value = "/del-employee")
		public String delEmployee(@RequestParam("id") int id,HttpSession session) {
			session.setAttribute("deleted", _accountService.delEmployee(id));		
			 
			 return "redirect:/List-Admin";
		}

		
		@RequestMapping(value = "/del-customer")
		public String delCustomer(@RequestParam("id") int id,HttpSession session) {
			session.setAttribute("deleted", _accountService.delCUstomer(id));
			if(_accountService.delCUstomer(id)) {
				_accountService.delete(id);
			}
			
			 return "redirect:/List-Admin";
		}
}
