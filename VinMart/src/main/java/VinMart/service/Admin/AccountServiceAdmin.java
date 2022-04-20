package VinMart.service.Admin;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import VinMart.dao.UserDao;
import VinMart.entities.Customers;
import VinMart.entities.Employees;
import VinMart.entities.Users;

@Service
public class AccountServiceAdmin {
	@Autowired
	UserDao userDao = new UserDao();

	public List<Users> GetAllAccount() {
		return userDao.GetAllUser();
	}
	
	public List<Employees> GetAllEmployees() {
		return userDao.GetAllEmployees();
	}
	public List<Employees> GetAllEmployeesLeave() {
		return userDao.GetAllEmployeesLeave();
	}
	
	public List<Customers> GetAllCustomers() {
		return userDao.GetAllCustomers();
	}

	public Users GetUserById(int id) {
		return userDao.GetUserById(id);
	}
	
	public Customers GetCustomerById(int id) {
		return userDao.GetCustomerById(id);
	}

	public Employees GetEmployeeById(int id) {
		return userDao.GetEmployeeById(id);
	}
	
	public boolean checkEdit(Users user) {
		
		String passwordcheck = user.getUsers_password();
		String passwordDB = userDao.getPasswordDB(user.getUsers_id());
		if(passwordcheck.compareTo(passwordDB) ==0)
			{			
			return userDao.update(user);
			}
		else {
			user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
			return userDao.update(user);
		}
		
	}
	
	

	public boolean checkEditCustomer(Customers customer) {
		int id = customer.getId();
		String sdt = customer.getSdt();
		String sdtDB = userDao.getSdtCustomer(id);
		
		if(sdt.equals(sdtDB)) {
			
			return userDao.updateCustomer(customer);
		}
		else {
			
			boolean checkSdt = userDao.checkSdt(sdt);
			if (checkSdt== false) {
				
				return userDao.updateCustomer(customer);
				
			 }else {
				 
				 return false;
			 }
		}
		
		
	}

	public boolean checkEditEmployee(Employees employee) {
		int id = employee.getId();
		String sdt = employee.getSdt();
		String sdtDB = userDao.getSdtEmployee(id);
		
		if(sdt.equals(sdtDB)) {
			
			return userDao.updateEmployee(employee);
		}
		else {
			
			boolean checkSdt = userDao.checkSdtEmployee(sdt);
			if (checkSdt== false) {
				
				return userDao.updateEmployee(employee);
				
			 }else {
				 
				 return false;
			 }
		}
		
	}

	public int AddEmployee(Users user, Employees employee) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		
		
		 String email = user.getUsers_email();
		 String sdt = employee.getSdt();
		 boolean checkEmail = userDao.checkEmail(email);
		 boolean checkSdt = userDao.checkSdtEmployee(sdt);
		
		 if (checkEmail == false && checkSdt== false) {
			 return userDao.AddEmployee(user, employee);
		 }else {
			 return 0;
		 }
	}

	public boolean AddCustomer(Users user, Customers customer) {
		user.setUsers_password(BCrypt.hashpw(user.getUsers_password(), BCrypt.gensalt(12)));
		return userDao.AddCustomer(user, customer);
	}

	public boolean delEmployee(int  id) {
		return userDao.deleteEmployee(id);
	}

	public boolean delete(int  id) {
		return userDao.delete(id);
	}

	public boolean delCUstomer(int id) {
		return userDao.deleteCustomer(id);
	}
}