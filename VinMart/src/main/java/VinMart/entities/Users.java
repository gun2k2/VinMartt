
package VinMart.entities;

public class Users {
	private int users_id;
	private String users_email;
	private String users_password;
	private int role_id;

	public Users() {
		super();
	}


	public Users(int users_id, String users_email, String users_password, int role_id) {
		super();
		this.users_id = users_id;
		this.users_email = users_email;
		this.users_password = users_password;
		this.role_id = role_id;
	}


	


	public Users(String users_email, String users_password) {
		super();
		this.users_email = users_email;
		this.users_password = users_password;
	}


	public int getUsers_id() {
		return users_id;
	}

	public void setUsers_id(int users_id) {
		this.users_id = users_id;
	}

	public String getUsers_email() {
		return users_email;
	}

	public void setUsers_email(String users_email) {
		this.users_email = users_email;
	}

	public String getUsers_password() {
		return users_password;
	}

	public void setUsers_password(String users_password) {
		this.users_password = users_password;
	}

	public int getRole_id() {
		return role_id;
	}

	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}

}
