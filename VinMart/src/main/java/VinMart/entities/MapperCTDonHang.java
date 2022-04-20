package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import org.springframework.jdbc.core.RowMapper;

public class MapperCTDonHang implements RowMapper<CT_DonHang>  {

	
	public  CT_DonHang mapRow(ResultSet rs, int rowNum) throws SQLException {
		CT_DonHang ct_dh = new CT_DonHang(); // kieu tra ve la CTDonhang
		ct_dh.setDonhang_id(rs.getInt("donhang_id"));
		
		String[] product_id = new String[] {rs.getString("product_id")}; 
		ct_dh.setProduct_id(product_id);		
		System.out.println("product_id" + Arrays.toString(product_id));
		String[] soLuong = new String[] {rs.getString("soLuong")}; 	
		ct_dh.setSoLuong(soLuong);	
		
		String[] thanhtien = new String[] {rs.getString("thanhtien")}; 
		ct_dh.setProduct_id(thanhtien); 
		
		ct_dh.setDiachi(rs.getString("diachi"));
		ct_dh.setProvince(rs.getString("province"));
		ct_dh.setDistrict(rs.getString("district"));
		ct_dh.setWard(rs.getString("ward"));
		
		
		return ct_dh;
	}
} 
