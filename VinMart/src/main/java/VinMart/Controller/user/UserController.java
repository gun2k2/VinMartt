package VinMart.Controller.user;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import VinMart.dao.UserDao;
import VinMart.entities.Customers;
import VinMart.entities.Employees;
import VinMart.entities.Users;
import VinMart.service.User.AccountService;

import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController extends BaseController {
	@Autowired
	AccountService accountService = new AccountService();
	@Autowired
	UserDao userDao = new UserDao();
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView Register() {
		_mvShare.setViewName("customer/register");
		_mvShare.addObject("user", new Users());
		_mvShare.addObject("customer", new Customers());
		return _mvShare;
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String CreateAccount(@ModelAttribute("user") Users user, @ModelAttribute("customer") Customers customer,HttpSession session) {
		String name = customer.getName();
		name = name.trim();
		name = name.replaceAll("\\s+", " "); // xoa bo khoang cach
		
		 String temp[] = name.split(" ");
		 name = "";
		 for (int i = 0; i < temp.length; i++) {
			 name += String.valueOf(temp[i].charAt(0)).toUpperCase() + temp[i].substring(1);
	            if (i < temp.length - 1) 
	            	name += " ";	
	        }
		 
		 customer.setName(name);
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
        	int count = accountService.AddAccount(user, customer);
     		System.out.println("count = " + count);
     		if (count > 0) {
     			
     			session.setAttribute("resThanhCong", "true");
     		} else {
     			session.setAttribute("resThatBai", "true");
     		}
         }
		
		return "redirect:/register";
		
	}
	/* 
	 * 
	 *  String email = user.getUsers_email();
		 boolean check = accountService.checkEmail(email);
		
		if (check == false) {
			accountService.AddAccount(user, customer);
			session.setAttribute("resThanhCong", "true");
		} else {
			session.setAttribute("resThatBai", "true");
		}*/

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView Login() {
		_mvShare.setViewName("customer/login");
		_mvShare.addObject("user", new Users());
		return _mvShare;
	}

	@RequestMapping(value = "/do-login")
	public String LoginAccount(HttpSession session, @ModelAttribute("user") Users user) {
		
		user = accountService.CheckAccountLogin(user);
		System.out.println("user = " + user);
		
		if (user != null) { // trùng email và trùng password
			int id_nv = user.getUsers_id();
			int check = accountService.getIdNv(id_nv);//kiem tra xem cái thằng đăng nhập có thuộc table NHANVIEN hay không.
			if(user.getUsers_id()==check)  // là table nhân vien
			{
				//nếu là table nhân viên thì kiểm tra tiếp xem status còn làm việc hay không 
				boolean check_status = accountService.checkStatusById(id_nv);
				if(check_status==true)
				{
					session.setAttribute("LoginInfo", user);
					session.setAttribute("login", "true");
					return "redirect:/trang-chu";
				}
				else {
					System.out.println("tai khoan da bi khoa");
					session.setAttribute("loginBlock", "true");
					return "redirect:/login";
				}
			}
			else { // không là table nhân viên
				session.setAttribute("LoginInfo", user);
				session.setAttribute("login", "true");
				return "redirect:/trang-chu";
			}
			
		} else {
			System.out.println("khong thanh cong dang nhap");
			session.setAttribute("loginFail", "true");
			return "redirect:/login";
		}
		
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String LoginAccount(HttpSession session, HttpServletRequest request) {
		session.removeAttribute("LoginInfo");
		return "redirect:" + request.getHeader("Referer");
	}
	
	// vao giao dien quên mật khẩu 
	@RequestMapping(value = "/forgot-password", method = RequestMethod.GET)
	public ModelAndView forgotPassword() {
		
		_mvShare.setViewName("customer/forgotpassword");
		
		return _mvShare;
	}
	// vao giao dien quên mật khẩu 
	@RequestMapping(value = "/do-forgot-password/{code}/{email}", method = RequestMethod.GET)
	public ModelAndView forgotPassWORD(@PathVariable String code,@PathVariable String email, HttpSession session ) {
		_mvShare.setViewName("customer/doforgotpassword");
		System.out.println("code = " + code);
		System.out.println("email = " + email+".com");
		session.setAttribute("code", code);
		session.setAttribute("email", email+".com");
		
		return _mvShare;
	}
	//xu ly gui mail thay doi mat khau
	@RequestMapping(value = "/change-password", method = RequestMethod.POST)
	public void changePassword(HttpSession session, HttpServletRequest request,HttpServletResponse response,ModelMap model) throws IOException {
		
		
		String action = request.getParameter("action");
		UserDao user = new UserDao();
		String code = user.getRandom();
		if(action.equals("guimail")) {
			String email = request.getParameter("users_email");
			boolean success = user.sendEmail(email, code);
			boolean check = new UserDao().checkEmail(email);
			if( check==true) {
				if (success) 
				{
					session.setAttribute("guimail", "true");
					
		            session.setAttribute("authcode", code);            
		            response.sendRedirect("forgot-password");
				}
				
			}
			else 
			{
				session.setAttribute("guimailFail", "true");
				
				response.sendRedirect("forgot-password");
			}
			
					
		}
		else if (action.equals("xacthuc")) {
			
				String authcode = (String) session.getAttribute("authcode");	
				String users_email =  request.getParameter("users_email");			
				String users_password = request.getParameter("password");
				String repassword = request.getParameter("repassword");
				System.out.println("code" + authcode);
			
				if(users_password.equals(repassword)) 
				{
					Users u = new Users();
					u.setUsers_email(users_email);
					u.setUsers_password(users_password);	
					accountService.checkPassword(u);
					session.setAttribute("xacthuc", "true");
					session.removeAttribute("authcode");
					response.sendRedirect("login");
				}
				else {
					session.setAttribute("xacthucFail", "true");
					response.sendRedirect("do-forgot-password/"+authcode+"/"+users_email );
				}
			
					
		} 
		
	}
	
	// chinh sua thong tin profile 
	
	@RequestMapping(value = "/update-profile", method = RequestMethod.POST)
	public String doUpdateProfile(
			@RequestParam("users_id") int users_id,			
			@RequestParam("users_email") String email,
			@RequestParam("users_password") String password, 
			@RequestParam("name") String name, 
			@RequestParam("gioitinh") boolean gioitinh, HttpSession session,HttpServletRequest request) {
		
		 String regex = "^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$";		 
         Pattern pattern = Pattern.compile(regex);
         Matcher matcher = pattern.matcher(email);
         if (!matcher.matches() ) {
        	 session.setAttribute("emailFail", "true");
         }
         else {
        	 
        	 name = name.trim();
     		name = name.replaceAll("\\s+", " "); // xoa bo khoang cach
     		
     		 String temp[] = name.split(" ");
     		 name = "";
     		 for (int i = 0; i < temp.length; i++) {
     			 name += String.valueOf(temp[i].charAt(0)).toUpperCase() + temp[i].substring(1);
     	            if (i < temp.length - 1) 
     	            	name += " ";	
     	        }
     		Users user= new Users();
     		user.setUsers_id(users_id);
     		user.setUsers_email(email);
     		user.setUsers_password(password);
     		
     		boolean idCustomers = userDao.GetCustomerById_1(users_id);
     		boolean idNV = userDao.GetEmployeeById_1(users_id);
     		
     		if(idCustomers==true) {
     			System.out.println("khach hang ! "  );
     			Customers cus = new Customers();

     			cus.setId(users_id);
     			cus.setName(name);
     			cus.setGioitinh(gioitinh);
     			//String emailDBuser = userDao.getEmailDBKH(users_id).toString();
     			String emailcheck = user.getUsers_email();
     			String emailDB = userDao.getEmailDB(users_id);
     			String passwordcheck = user.getUsers_password();
     			String passwordDB = userDao.getPasswordDB(users_id);
     			
     			if(passwordcheck.compareTo(passwordDB) ==0)
     			{
     				
     				userDao.UpdateKhachHangProfile(cus);
     				
     				userDao.UpdateUserProfile(user);
     				session.setAttribute("LoginInfo", user);
     				session.setAttribute("updateSuccess", "true");
     				
     				return "redirect:/lich-su-mua-hang/"+users_id;
     			}
     			else {
     					if(emailcheck.equals(emailDB))
     					{
     						user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
     						System.out.println("pass1 = " + user.getUsers_password() );
     						userDao.UpdateKhachHangProfile(cus);
     						
     						userDao.UpdateUserProfile(user);
     						
     						session.setAttribute("updateSuccess", "true");
     						session.setAttribute("LoginInfo", user);
     						return "redirect:/lich-su-mua-hang/"+users_id;
     					}else {
     						boolean check = accountService.CheckEmailTonTai(user,email);
     						
     						if (check == false) {
     							user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
     							
     							userDao.UpdateKhachHangProfile(cus);
     							
     							userDao.UpdateUserProfile(user);
     							
     							session.setAttribute("updateSuccess", "true");
     							session.setAttribute("LoginInfo", user);
     							return "redirect:/lich-su-mua-hang/"+users_id;
     						}
     						else {
     							session.setAttribute("updateFail", "true");
     							return "redirect:/lich-su-mua-hang/"+users_id;
     						}
     					}
     			}
     			
     		}
     		if(idNV==true) {
     			System.out.println("nhanvien ! "  );
     			Employees nv = new Employees();

     			nv.setId(users_id);
     			nv.setName(name);
     			nv.setGioitinh(gioitinh);
     			//String emailDBuser = userDao.getEmailDBKH(users_id).toString();
     			String emailcheck = user.getUsers_email();
     			String emailDB = userDao.getEmailDB(users_id);
     			String passwordcheck = user.getUsers_password();
     			String passwordDB = userDao.getPasswordDB(users_id);
     			
     			if(passwordcheck.compareTo(passwordDB) ==0)
     			{
     				
     				userDao.UpdateNhanVienProfile(nv);
     				
     				userDao.UpdateUserProfile(user);
     				session.setAttribute("LoginInfo", user);
     				session.setAttribute("updateSuccess", "true");
     				
     				return "redirect:/lich-su-mua-hang/"+users_id;
     			}
     			else {
     					if(emailcheck.equals(emailDB))
     					{
     						user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
     						
     						userDao.UpdateNhanVienProfile(nv);
     						
     						userDao.UpdateUserProfile(user);
     						session.setAttribute("LoginInfo", user);
     						session.setAttribute("updateSuccess", "true");
     						
     						return "redirect:/lich-su-mua-hang/"+users_id;
     					}else {
     						boolean check = accountService.CheckEmailTonTai(user,email);
     						
     						if (check == false) {
     							user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
     							System.out.println("pass1 = " + user.getUsers_password() );
     							userDao.UpdateNhanVienProfile(nv);
     							
     							userDao.UpdateUserProfile(user);
     							session.setAttribute("LoginInfo", user);
     							session.setAttribute("updateSuccess", "true");
     							
     							return "redirect:/lich-su-mua-hang/"+users_id;
     						}
     						else {
     							session.setAttribute("updateFail", "true");
     							return "redirect:/lich-su-mua-hang/"+users_id;
     						}
     					}
     			}
     			
     		}
     		session.setAttribute("updateFail", "true");
         }
		
		return "redirect:/lich-su-mua-hang/"+users_id;
				
	}
	
	@RequestMapping(value = "/do-login-mxh")
	public String loginMXH(HttpSession session,
			@RequestParam("action") String action,
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("email") String users_email) throws Exception {
		
		Users user = new Users();
		Customers cus = new Customers();
		if(id.equals("undefined")) // cancel
		{
			return "redirect:/login";
		}
		else { //submit
			if(action.equals("Face"))
			{
				boolean checkEmail = new UserDao().checkEmail(users_email);
				if(checkEmail==true) // co tồn tại email trong database
				{
					
					user.setUsers_email(users_email);
					List<Users> taikhoan = new UserDao().getUser(user);
					user.setUsers_id(taikhoan.get(0).getUsers_id());
					user.setUsers_email(taikhoan.get(0).getUsers_email());
					user.setUsers_password(taikhoan.get(0).getUsers_password());
					user.setRole_id(taikhoan.get(0).getRole_id());
					
						if (BCrypt.checkpw(id, user.getUsers_password())) { // trung pass
							session.setAttribute("LoginInfo", user);
							session.setAttribute("login", "true");
							return "redirect:/trang-chu";
						} else { // khong trung password
							session.setAttribute("loginFail", "true");
			    			return "redirect:/login";
						}
					
					
				}
				else{ // không tồn tại email trong database =>> tiến hành đăng ký
					user.setUsers_email(users_email);
					user.setUsers_password(BCrypt.hashpw(id, BCrypt.gensalt(12)));
					cus.setName(name);
					cus.setSdt(null);
					
					boolean checkUser = new UserDao().ResUsersmxh(user);
					boolean checkKH = new UserDao().ResKHmxh(cus);
					if(checkUser==true) {
						if(checkKH==true) {
							List<Users> taikhoan = new UserDao().getUser(user);
							user.setUsers_id(taikhoan.get(0).getUsers_id());
							user.setUsers_email(taikhoan.get(0).getUsers_email());
							user.setUsers_password(taikhoan.get(0).getUsers_password());
							user.setRole_id(taikhoan.get(0).getRole_id());
							session.setAttribute("LoginInfo", user);
							session.setAttribute("login", "true");
							return "redirect:/trang-chu";
						}
						else {
							session.setAttribute("loginFail", "true");
			    			return "redirect:/login";
						}
					}
					
				}
			}
			else if(action.equals("google"))
			{
				System.out.println("google "  );
			}
		}
			
		
		return null;
	}
	
}