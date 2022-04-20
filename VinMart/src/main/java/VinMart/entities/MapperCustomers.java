
package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCustomers implements RowMapper<Customers>{

	public Customers mapRow(ResultSet rs, int rowNum) throws SQLException {
		Customers customer = new Customers();
		customer.setId(rs.getInt("khachhang_id"));
		customer.setName(rs.getString("khachhang_name"));
		customer.setSdt(rs.getString("khachhang_sdt"));
		customer.setGioitinh(rs.getBoolean("khachhang_gioitinh"));
		return customer;
	}
	

}
