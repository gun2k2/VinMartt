package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperPhieunhap implements RowMapper<Phieunhap>{

	public  Phieunhap mapRow(ResultSet rs, int rowNum) throws SQLException {
		Phieunhap phieunhap = new Phieunhap(); // kieu tra ve la PhieuNhap
		phieunhap.setMaPN(rs.getInt("MaPN"));
		System.out.print("phieunhap =" + phieunhap);
		phieunhap.setNgayNhap(rs.getDate("NgayNhap"));
		
		return phieunhap;
	}
}
