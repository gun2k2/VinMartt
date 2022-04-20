package VinMart.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import VinMart.entities.CT_DonHang;
import VinMart.entities.ConnectionToDB;
import VinMart.entities.MapperCTDonHang;

@Repository
@Transactional
public class CT_DonhangDao extends BaseDao {

	// list
	public CT_DonHang listCtdh(int donhang_id) {
		ConnectionToDB con = new ConnectionToDB();
		List<String> product_ids = new ArrayList<String>();
		List<String> soLuongs = new ArrayList<String>();
		List<String> thanhtiens = new ArrayList<String>();

		ResultSet rs;
		System.out.println("donhang_id" + donhang_id);
		try {
			rs = con.selectData("select * from ct_donhang where donhang_id =  " + donhang_id);
			while (rs.next()) {
				product_ids.add(rs.getString("product_id"));
				soLuongs.add(rs.getString("soLuong"));
				thanhtiens.add(rs.getString("thanhtien"));

			}

		} catch (Exception e) {
			// TODO: handle exception

		}
		return new CT_DonHang(donhang_id, product_ids.toArray(new String[0]), soLuongs.toArray(new String[0]),
				thanhtiens.toArray(new String[0]));
	}
	

}