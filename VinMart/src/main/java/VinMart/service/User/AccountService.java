
package VinMart.service.User;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VinMart.dao.UserDao;
import VinMart.entities.Customers;
import VinMart.entities.Users;

@Service
public class AccountService {
	@Autowired
	UserDao userDao = new UserDao();

	public int AddAccount(Users user,Customers customer) {
		
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		 String email = user.getUsers_email();
		 String sdt = customer.getSdt();
		 boolean checkEmail = userDao.checkEmail(email);
		 boolean checkSdt = userDao.checkSdt(sdt);
		 System.out.println("checkEmail = " + checkEmail);
		 System.out.println("checkSdt = " + checkSdt);
		 if (checkEmail == false && checkSdt== false) {
			 return userDao.AddAccount(user,customer);
		 }else {
			 return 0;
		 }
		
	}	
	public Users CheckAccountLogin(Users user) {
		String pass = user.getUsers_password();
		user = userDao.GetUserByAccount(user);
			
		if (user != null) {
			System.out.println("khac null");
			if (BCrypt.checkpw(pass, user.getUsers_password())) {
				return user;
			} else {
				return null;
			}
		}
		return null;
	}
	
	
	public boolean CheckEmailTonTai(Users user,String userEmail) {
		
		boolean checkEmail = userDao.checkEmail(userEmail);
		System.out.println("checkEmail = " + checkEmail );
		if (checkEmail == false) {
			
			return false;
		}else {
			return true;
		}
		
	}
	
	public int getIdNv(int id_nv) {
		
		int checkID = userDao.getIdNv(id_nv);
		
		if (checkID >0) {
			
			return checkID;
		}else {
			return 0;
		}
		
	}
	
	public boolean checkPassword(Users user) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		return userDao.updatePassword(user);
	}
	
public boolean checkStatusById(int id_nv) {
		
		boolean check_status = userDao.checkStatusById( id_nv);
		System.out.println("check_status = " + check_status );
		if (check_status == true) {
			
			return true;
		}else {
			return false;
		}
		
	}
	
	
	
}
