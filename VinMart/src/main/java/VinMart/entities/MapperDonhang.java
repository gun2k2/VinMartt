package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperDonhang implements RowMapper<Donhang> {

	public  Donhang mapRow(ResultSet rs, int rowNum) throws SQLException {
		Donhang dh = new Donhang(); // kieu tra ve la Donhang
		dh.setDonhang_id(rs.getInt("donhang_id"));
		dh.setDonhang_ngaydat(rs.getDate("donhang_ngaydat"));
		dh.setDonhang_trangthai(rs.getInt("donhang_trangthai"));
		dh.setDonhang_ngaygiao(rs.getString("donhang_ngaygiao"));
		dh.setNhanvien_id(rs.getInt("nhanvien_id"));
		dh.setDonhang_dahuy(rs.getString("donhang_dahuy"));
		dh.setNguoimua_id(rs.getInt("nguoimua_id"));
		
		return dh;
	}
}
