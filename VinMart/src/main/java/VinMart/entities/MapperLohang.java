package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class MapperLohang implements RowMapper<Lohang> {

	public  Lohang mapRow(ResultSet rs, int rowNum) throws SQLException {
		Lohang lh = new Lohang(); // kieu tra ve la Lohang
		lh.setMalo(rs.getInt("malo"));
		lh.setProduct_id(rs.getInt("product_id"));
		lh.setSoluongnhap(rs.getInt("soluongnhap"));
		lh.setNgaysanxuat(rs.getString("ngaysanxuat"));
		lh.setHansudung(rs.getString("hansudung"));
		lh.setTrangthai(rs.getInt("trangthai"));		
		return lh;
	}
}
