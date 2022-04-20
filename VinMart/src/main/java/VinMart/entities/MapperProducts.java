package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


public class MapperProducts implements RowMapper<Products> {

	public  Products mapRow(ResultSet rs, int rowNum) throws SQLException {
		Products pro = new Products(); // kieu tra ve la Product 
		pro.setProduct_id(rs.getInt("product_id"));
		pro.setProduct_name(rs.getString("product_name"));
		pro.setProduct_price(rs.getInt("product_price"));
		pro.setProduct_discount(rs.getInt("product_discount"));
		pro.setProduct_danhmuc(rs.getInt("product_danhmuc"));
		pro.setProduct_image(rs.getString("product_image"));
		pro.setProduct_view(rs.getInt("product_view"));
		pro.setProduct_purchased(rs.getInt("product_purchased"));
		pro.setProduct_trangthai(rs.getInt("product_trangthai"));
		pro.setProduct_soLuongMua(rs.getInt("product_soLuongMua"));
		pro.setProduct_content(rs.getString("product_content"));
		pro.setProduct_soluongtonkho(rs.getInt("product_soluongtonkho"));
		pro.setProduct_thuonghieu(rs.getString("product_thuonghieu"));
		pro.setProduct_sanxuat(rs.getString("product_sanxuat"));
		pro.setProduct_thanhphan(rs.getString("product_thanhphan"));
		pro.setProduct_nongdocon(rs.getString("product_nongdocon"));
		pro.setProduct_luongga(rs.getString("product_luongga"));
		pro.setProduct_luongduong(rs.getString("product_luongduong"));
		pro.setProduct_thetich(rs.getString("product_thetich"));
		pro.setProduct_baoquan(rs.getString("product_baoquan"));
		pro.setProduct_sudung(rs.getString("product_sudung"));
		
		pro.setMaNCC(rs.getInt("MaNCC"));
		pro.setNhanvien_id(rs.getInt("nhanvien_id"));
	
		
		return pro;
	}
		
	
}

