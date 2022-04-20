package VinMart.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Repository;

import VinMart.entities.ConnectionToDB;
import VinMart.entities.Customers;
import VinMart.entities.Employees;
import VinMart.entities.MapperCustomers;
import VinMart.entities.MapperEmployees;
import VinMart.entities.MapperUsers;
import VinMart.entities.Users;
@Repository
public class UserDao extends BaseDao {

	
	public Users GetUserByAccount(Users user) {
		
		try {
			String sql = "SELECT * FROM users WHERE users_email='" + user.getUsers_email() + "'";
			Users result = _jdbcTemplate.queryForObject(sql, new MapperUsers());
			return result;
		} catch (EmptyResultDataAccessException e) {
			// Không tồn tại username
			return null;
		}
	}
	public List<Users> getUser(Users user){
		ConnectionToDB con = new ConnectionToDB();
		List<Users> users = new ArrayList<Users>();
		ResultSet rs;
		try {
			rs = con.selectData("select * from users where users_email =  '" +  user.getUsers_email() + "'");
			if(rs.next()) {
				
				int users_id = rs.getInt("users_id");
				String users_email = rs.getString("users_email");
				String users_password = rs.getString("users_password");
				int role_id  =  rs.getInt("role_id");
				Users u = new Users(users_id, users_email, users_password, role_id);
				users.add(u);
			}
			

		} catch (Exception e) {
			// TODO: handle exception

		}
		return users;
		
	}
	
		
		// res mang xa hoi users
		public boolean ResUsersmxh(Users user) {
		
			try {
				
				new ConnectionToDB().excuteSql("insert into Users values('"
				+ user.getUsers_email() + "','" 
				+ user.getUsers_password() + "'," 
				+ 3 + ")" ); 
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			return false;
		}
			
		
		// res mang xa hoi KH
		public boolean ResKHmxh(Customers customer) {
			
			try {
				
				new ConnectionToDB().excuteSql("insert into KHACHHANG values('"
				+ customer.getName() + "'," 
				+ "'+84'"+ "," 
				+ 1 + ")" ); 
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			return false;
		}
		

	public int AddAccount(Users user, Customers customer) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("declare @userid int ");
			sql.append(" SET IDENTITY_INSERT KHACHHANG ON ");
			sql.append(" SET IDENTITY_INSERT Users OFF ");
			sql.append("INSERT ");
			sql.append("INTO users ");
			sql.append("( ");
			sql.append("	users_email, ");
			sql.append("	users_password, ");
			sql.append("	role_id ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	'" + user.getUsers_email() + "', ");
			sql.append("	'" + user.getUsers_password() + "', ");
			sql.append("	" + "3");
			sql.append(") ");
			sql.append("select @userid = SCOPE_IDENTITY() ");
			sql.append("INSERT ");
			sql.append("INTO KHACHHANG ");
			sql.append("( ");
			sql.append("	khachhang_id, ");
			sql.append("	khachhang_name, ");
			sql.append("	khachhang_sdt, ");
			sql.append("	khachhang_gioitinh ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	" + "@userid" + ", ");
			sql.append("	'" + customer.getName() + "', ");
			sql.append("	'" + customer.getSdt() + "', ");
			sql.append("	'" + customer.isGioitinh());
			sql.append("')");
			int insert = _jdbcTemplate.update(sql.toString());
			return insert;
		} catch (Exception e) {
			return 0;
		}

	}
	public int AddEmployee(Users user, Employees employee) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("declare @userid int ");
			sql.append("SET IDENTITY_INSERT NHANVIEN ON ");
		
			sql.append("INSERT ");
			sql.append("INTO users ");
			sql.append("( ");
			sql.append("	users_email, ");
			sql.append("	users_password, ");
			sql.append("	role_id ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	'" + user.getUsers_email() + "', ");
			sql.append("	'" + user.getUsers_password() + "', ");
			sql.append("	" + user.getRole_id());
			sql.append(") ");
			sql.append("select @userid = SCOPE_IDENTITY() ");
			sql.append("INSERT ");
			sql.append("INTO NHANVIEN ");
			sql.append("( ");
			sql.append("	nhanvien_id, ");
			sql.append("	nhanvien_name, ");
			sql.append("	nhanvien_sdt, ");
			sql.append("	status, ");
			sql.append("	nhanvien_gioitinh ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	" + "@userid" + ", ");
			sql.append("	'" + employee.getName() + "', ");
			sql.append("	'" + employee.getSdt() + "', ");
			sql.append("	'1', ");
			sql.append("	'" + employee.isGioitinh());
			sql.append("')");
			int insert = _jdbcTemplate.update(sql.toString());
			return insert;
		} catch (Exception e) {
			return 0;
		}
	}

	public boolean AddCustomer(Users user, Customers customer) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("declare @userid int ");
			sql.append("SET IDENTITY_INSERT KHACHHANG ON ");
			
			sql.append("INSERT ");
			sql.append("INTO users ");
			sql.append("( ");
			sql.append("	users_email, ");
			sql.append("	users_password, ");
			sql.append("	role_id ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	'" + user.getUsers_email() + "', ");
			sql.append("	'" + user.getUsers_password() + "', ");
			sql.append("	" + "3");
			sql.append(") ");
			sql.append("select @userid = SCOPE_IDENTITY() ");
			sql.append("INSERT ");
			sql.append("INTO KHACHHANG ");
			sql.append("( ");
			sql.append("	khachhang_id, ");
			sql.append("	khachhang_name, ");
			sql.append("	khachhang_sdt, ");
			sql.append("	khachhang_gioitinh ");
			sql.append(") ");
			sql.append("VALUES ");
			sql.append("( ");
			sql.append("	" + "@userid" + ", ");
			sql.append("	'" + customer.getName() + "', ");
			sql.append("	'" + customer.getSdt() + "', ");
			sql.append("	'" + customer.isGioitinh());
			sql.append("')");
			_jdbcTemplate.update(sql.toString());
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public List<Users> GetAllUser() {
		String sql = "SELECT * FROM users";

		List<Users> list = _jdbcTemplate.query(sql, new MapperUsers());
		
		return list;
	}

	public List<Customers> GetAllCustomers() {
		String sql = "SELECT * FROM KHACHHANG";
		List<Customers> list = _jdbcTemplate.query(sql, new MapperCustomers());
		
		return list;
	}

	public List<Employees> GetAllEmployees() {
		String sql = "SELECT * FROM NHANVIEN where status !='0'";
		List<Employees> list = _jdbcTemplate.query(sql, new MapperEmployees());
		
		return list;
	}
	
	public List<Employees> GetAllEmployeesLeave() {
		String sql = "SELECT * FROM NHANVIEN where status = 0";
		List<Employees> list = _jdbcTemplate.query(sql, new MapperEmployees());
		
		return list;
	}
	
	public Users GetUserById(int id) {
		String sql = "SELECT * FROM users WHERE users_id = ?";
		Users result = _jdbcTemplate.queryForObject(sql, new MapperUsers(), id);
		return result;
	}

	public Customers GetCustomerById(int id) {
		String sql = "SELECT * FROM KHACHHANG WHERE khachhang_id = ?";
		Customers result = _jdbcTemplate.queryForObject(sql, new MapperCustomers(), id);
		return result;
	}

	public Employees GetEmployeeById(int id) {
		String sql = "SELECT * FROM NHANVIEN WHERE nhanvien_id = ?";
		Employees result = _jdbcTemplate.queryForObject(sql, new MapperEmployees(), id);
		return result;
	}
	
	

	public boolean updateCustomer(Customers customers) {
		try {
			String sql = "UPDATE KHACHHANG SET khachhang_gioitinh ='" + customers.isGioitinh() + "', khachhang_sdt ='"
					+ customers.getSdt() + "', khachhang_name= '" + customers.getName() + "' WHERE khachhang_id = '"
					+ customers.getId() + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean updateEmployee(Employees employees) {
		try {
			String sql = "UPDATE NHANVIEN SET nhanvien_gioitinh ='" + employees.isGioitinh() + "', nhanvien_sdt ='"
					+ employees.getSdt() + "', nhanvien_name= '" + employees.getName() + "' WHERE nhanvien_id = '"
					+ employees.getId() + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//xóa nhân viên (chuyển trạng thái từ 1 sang 0
	public boolean deleteEmployee(int  id) {
		try {
			String sql = "UPDATE NHANVIEN SET status ='0' WHERE nhanvien_id = '"
					+ id + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//xóa khách hàng
	public boolean deleteCustomer(int  id) {
		try {
			String sql = "DELETE FROM KHACHHANG WHERE khachhang_id = '"
					+ id + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
	public boolean update(Users user) {
		try {
			String sql = "UPDATE users SET users_password = '" + user.getUsers_password() 
			+ "',role_id='" +user.getRole_id() +"'  WHERE users_id = '"
					+ user.getUsers_id() + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//update user profile
	public boolean UpdateUserProfile(Users user) {
		try {
			System.out.println("user.getUsers_email() = " + user.getUsers_email() );
			String sql = "UPDATE users SET users_password = '" + user.getUsers_password() 
			+ "',users_email='" +user.getUsers_email() +"'  WHERE users_id = '"
					+ user.getUsers_id() + "'";
			_jdbcTemplate.update(sql);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	//update cus profile
		public boolean UpdateKhachHangProfile(Customers customers) {
			try {
				String sql = "UPDATE KHACHHANG SET khachhang_gioitinh ='" + customers.isGioitinh()  + "', khachhang_name= '" + customers.getName() + "' WHERE khachhang_id = '"
						+ customers.getId() + "'";
				_jdbcTemplate.update(sql);
				return true;
			} catch (Exception e) {
				return false;
			}
		}
	//update nv profile
		public boolean UpdateNhanVienProfile(Employees nv) {
			try {
				String sql = "UPDATE NHANVIEN SET nhanvien_gioitinh ='" + nv.isGioitinh()  + "', nhanvien_name= '" + nv.getName()
				+ "' WHERE nhanvien_id = '"+ nv.getId() + "'";
				_jdbcTemplate.update(sql);
				return true;
				} catch (Exception e) {
					return false;
				}
			}		
	//xóa user
		public boolean delete(int id) {
			System.out.println("id " + id);
			try {
				String sql = "DELETE FROM Users WHERE users_id = '"
						+ id + "'";
				_jdbcTemplate.update(sql);
				return true;
			} catch (Exception e) {
				return false;
			}
		}
	
	//cap nhap password khi thay doi
	public boolean updatePassword(Users u) {
		try {
			System.out.println("email nhap vao" + u.getUsers_email());
			System.out.println("password moi nhap vao" + u.getUsers_password());
			new  ConnectionToDB().excuteSql("update users set users_password='"+u.getUsers_password()+"' where users_email='"+ u.getUsers_email()+"'");
			
			return true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	//code very random
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    //gui mail den mail cua user
    public boolean sendEmail(String email, String code) {
        boolean test = false;
        
        String toEmail = email;
        System.out.println("toEmail = " + toEmail );
        try {

        	Properties props = new Properties();
        	props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.port", "587");
            

            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("contact.cgv4@gmail.com", "hoangminhtuan");
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

    		//set from email address
            mess.setFrom(new InternetAddress("contact.cgv4@gmail.com"));
    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    		
    		//set email subject
            mess.setSubject("User Email Verification");
            System.out.println(code);
    		//set message text
            mess.setText("VinMart hello,"
            		+ "Click the link to change the password: "  + 
            		" http://localhost:8080/VinMart/do-forgot-password/" +code +"/" +email );
            
            //send the message
            Transport.send(mess);
            
            test=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
    
  //gui mail khi mua hang thanh toan
    public boolean sendMailThanhToan(String email,String name) {
        boolean test = false;
        
        String toEmail = email;
        System.out.println("toEmail = " + toEmail );
        try {

        	Properties props = new Properties();
        	props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.port", "587");
            

            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("contact.cgv4@gmail.com", "hoangminhtuan");
                }
            });

            //set email message details
            Message mess = new MimeMessage(session);

    		//set from email address
            mess.setFrom(new InternetAddress("contact.cgv4@gmail.com"));
    		//set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
    		
    		//set email subject
            mess.setSubject("Xác nhận đơn hàng thành công !");
           
    		//set message text
            mess.setText("VinMart xin chào " + name+", Vinmart đã xác nhận đơn hàng của bạn, vui lòng bấm vào theo dõi đơn hàng ở mục ĐƠN HÀNG CỦA BẠN để kiểm tra sản phẩm và quá trình vận chuyển !" );
            
            //send the message
            Transport.send(mess);
            
            test=true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
    
  
	// kiem tra sdt co ton tai hay khong 
		public boolean checkEmail(String email) {
			try {
			ResultSet rs=	new ConnectionToDB().selectData("select * from Users where users_email = '" + email + "'");
			if(rs.next()) {
				
				return true;
			}else {
				
				return false;
			}
					
				
			} catch (Exception e) {
				return false;
			}
		}
	
	// kiem tra sdt co ton tai hay khong 
	public boolean checkSdt(String sdt) {
		try {
		ResultSet rs=	new ConnectionToDB().selectData("select * from KHACHHANG where	 khachhang_sdt = '" + sdt + "'");
		if(rs.next()) {
			return true;
		}else {
			return false;
		}
				
			
		} catch (Exception e) {
			return false;
		}
	}
	
	// kiem tra sdt co ton tai hay khong 
		public boolean checkSdtEmployee(String sdt) {
			try {
			ResultSet rs=	new ConnectionToDB().selectData("select * from nhanvien where nhanvien_sdt = '" + sdt + "'");
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
					
				
			} catch (Exception e) {
				return false;
			}
		}

	
	// lay email de kiem tra email co ton tai chua, dung de doi profile email
	public String getEmailDB(int id) {
		try {
			ResultSet rs=	new ConnectionToDB().selectData("SELECT users_email FROM Users WHERE users_id = '" + id + "'");
			if(rs.next()) {
				return rs.getString("users_email");
			}else {
				return null;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return null;
			
		}
		
	}
	
	// lay pass de kiem tra pass co ton tai chua, dung de doi profile pass
		public String getPasswordDB(int id) {
			try {
				ResultSet rs=	new ConnectionToDB().selectData("SELECT users_password FROM Users WHERE users_id = '" + id + "'");
				if(rs.next()) {
					return rs.getString("users_password");
				}else {
					return null;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return null;
				
			}
			
		}
	
	public boolean GetCustomerById_1(int id) {
		try {
			ResultSet rs=	new ConnectionToDB().selectData("select * from KHACHHANG where	 khachhang_id = '" + id + "'");
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return false;
			
		}
		
	}
	public boolean GetEmployeeById_1(int id) {
		try {
			ResultSet rs=	new ConnectionToDB().selectData("select * from NHANVIEN where	nhanvien_id = '" + id + "'");
			if(rs.next()) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return false;
			
		}
		
	}
	
	// lay sdt customer de kiem tra co nhap khi chinh sua hay khong 
		public String getSdtCustomer(int id) {
			
			try {
				ResultSet rs=	new ConnectionToDB().selectData("SELECT khachhang_sdt FROM KHACHHANG WHERE khachhang_id = '" + id + "'");
				if(rs.next()) {
					
					return rs.getString("khachhang_sdt");
				}else {
					return null;
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				return null;
				
			}
			
		}
		
		// lay sdt nhanvien de kiem tra co nhap khi chinh sua hay khong 
				public String getSdtEmployee(int id) {
					
					try {
						ResultSet rs=	new ConnectionToDB().selectData("SELECT nhanvien_sdt FROM NHANVIEN WHERE nhanvien_id = '" + id + "'");
						if(rs.next()) {
							
							return rs.getString("nhanvien_sdt");
						}else {
							return null;
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						return null;
						
					}
					
				}
				// lay id nhanvien de kiem tra 
				public int getIdNv(int id_nv) {
					
					try {
						ResultSet rs=	new ConnectionToDB().selectData("SELECT nhanvien_id FROM NHANVIEN WHERE nhanvien_id = '" + id_nv + "'");
						if(rs.next()) {
							
							return rs.getInt("nhanvien_id");
						}else {
							return 0;
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						return 0;
						
					}
					
				}
				
		
				// check status của nhân viên xem có còn làm việc hay không bởi ID_nhanvien
				public boolean checkStatusById(int  id_nv) {
					try {
					ResultSet rs=	new ConnectionToDB().selectData("select status from NHANVIEN where nhanvien_id  = '" + id_nv + "'");
					if(rs.next()) {
						System.out.println("status = " + rs.getInt("status") );
						if(rs.getInt("status")==1)
						{
							return true;
						}
						else {
							return false;
						}
						
					}else {
						System.out.println("lag sai rồi !!  "  );
						return false;
					}
							
						
					} catch (Exception e) {
						return false;
					}
				}
				
				
			
	/* END*/
}
