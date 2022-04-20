package VinMart.entities;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperCategorys implements RowMapper<Categorys> {

	public  Categorys mapRow(ResultSet rs, int rowNum) throws SQLException {
		Categorys categorys = new Categorys(); // kieu tra ve la categorys 
		categorys.setCategory_id(rs.getInt(1));
		categorys.setCategory_name(rs.getString(2)); 
		categorys.setP_id(rs.getInt(3));
		return categorys;
	}
		
	
}
