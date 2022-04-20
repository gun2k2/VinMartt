
package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperUsers implements RowMapper<Users> {

	public  Users mapRow(ResultSet rs, int rowNum) throws SQLException {
		Users users = new Users();
		users.setUsers_id(rs.getInt("users_id"));
		users.setUsers_email(rs.getString("users_email"));
		users.setUsers_password(rs.getString("users_password"));
		users.setRole_id(rs.getInt("role_id"));
		System.out.println("users = " + users );
		return users;
	}

}
