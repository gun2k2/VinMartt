package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperNhaCungCap implements RowMapper<NhaCungCap>{

	public  NhaCungCap mapRow(ResultSet rs, int rowNum) throws SQLException {
		NhaCungCap ncc = new NhaCungCap(); // kieu tra ve la NhaCungCAP 
		ncc.setMaNCC(rs.getInt("MaNCC"));
		ncc.setTenNCC(rs.getString("TenNCC"));
		ncc.setDiaChi(rs.getString("DiaChi"));
		ncc.setEmail(rs.getString("Email"));
		ncc.setSdt(rs.getString("Sdt"));
	
		return ncc;
	}
}
