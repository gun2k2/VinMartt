package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCTPhieunhap implements RowMapper<CT_Phieunhap>{

	public  CT_Phieunhap mapRow(ResultSet rs, int rowNum) throws SQLException {
		CT_Phieunhap ct_pn = new CT_Phieunhap(); // kieu tra ve la CT_Phieunhap
		
		
		ct_pn.setMaPN(rs.getInt("MaPN"));
		
		String[] product_id = new String[] {rs.getString("product_id")}; 
		ct_pn.setProduct_id(product_id);
		
		String[] dongianhap = new String[] {rs.getString("dongianhap")}; 
		ct_pn.setDongianhap(dongianhap);
		
		String[] soluongnhap = new String[] {rs.getString("soluongnhap")}; 
		ct_pn.setSoluongnhap(soluongnhap);
		
		
	
		return ct_pn;
	}
}
