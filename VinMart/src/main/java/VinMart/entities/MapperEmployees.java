package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperEmployees implements RowMapper<Employees> {

	public Employees mapRow(ResultSet rs, int rowNum) throws SQLException {
		Employees employee = new Employees();
		employee.setId(rs.getInt("nhanvien_id"));
		employee.setName(rs.getString("nhanvien_name"));
		employee.setSdt(rs.getString("nhanvien_sdt"));
		employee.setGioitinh(rs.getBoolean("nhanvien_gioitinh"));
		employee.setHSL(rs.getFloat("HSL"));
		employee.setStatus(rs.getBoolean("status"));
		return employee;
	}


}
