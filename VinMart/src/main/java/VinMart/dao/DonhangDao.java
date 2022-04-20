package VinMart.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import VinMart.entities.Donhang;
import VinMart.entities.MapperDonhang;

@Repository
@Transactional
public class DonhangDao  extends BaseDao{

	
			//list TRANG THAI =1
		 public List<Donhang> listDhID1() {
			    String sql = "select * from DonDatHang where donhang_trangthai= 1";
			    return _jdbcTemplate.query(sql, new MapperDonhang());
			  }
		//list TRANG THAI =2
		 public List<Donhang> listDhID2() {
			    String sql = "select * from DonDatHang where donhang_trangthai= 2";
			    return _jdbcTemplate.query(sql, new MapperDonhang());
			  }
		//list TRANG THAI =3
		 public List<Donhang> listDhID3() {
			    String sql = "select * from DonDatHang where donhang_trangthai= 3";
			    return _jdbcTemplate.query(sql, new MapperDonhang());
			  }
		//list TRANG THAI =4
		 public List<Donhang> listDhID4() {
			    String sqlByID = "select * from DonDatHang where donhang_trangthai= 4";
			    List<Donhang> listDHByID = _jdbcTemplate.query(sqlByID, new MapperDonhang());
			    List<Donhang> ListDh = new ArrayList<Donhang>();
			    System.out.println("LISTDHBYID " + listDHByID.size() );
			    System.out.println("ListDh " + ListDh	.size() );
			    if(listDHByID.size()>0) { 
			    	 String sql = "select * from DonDatHang where donhang_trangthai= 4";
			    	 ListDh = _jdbcTemplate.query(sql, new MapperDonhang());
				 }
				   
				    return ListDh;
				  }
		 
		//list TRANG THAI =0
		 public List<Donhang> listDhID0() {
			    String sqlByID = "select * from DonDatHang where donhang_trangthai= 0";
			    List<Donhang> listDHByID = _jdbcTemplate.query(sqlByID, new MapperDonhang());
			    List<Donhang> ListDh = new ArrayList<Donhang>();
			    System.out.println("LISTDHBYID " + listDHByID.size() );
			    System.out.println("ListDh " + ListDh	.size() );
			    if(listDHByID.size()>0) { 
			    	 String sql = "select * from DonDatHang where donhang_trangthai= 0";
			    	 ListDh = _jdbcTemplate.query(sql, new MapperDonhang());
				 }
				   
				    return ListDh;
				  }
		
		  
		//update don hang
		  public void update(Donhang dh) {
		   String sql = "UPDATE DonDatHang SET donhang_trangthai = ?,donhang_ngaygiao= ?,  nhanvien_id = ? WHERE donhang_id = ? ";  
		   _jdbcTemplate.update(sql,dh.getDonhang_trangthai() ,dh.getDonhang_ngaygiao(),dh.getNhanvien_id(), dh.getDonhang_id());
		  
		  }
		//cancel don hang
		  public void cancel(Donhang dh) {
		   String sql = "UPDATE DonDatHang SET donhang_trangthai = ?, donhang_dahuy = ? WHERE donhang_id = ? ";  
		   _jdbcTemplate.update(sql,dh.getDonhang_trangthai() , dh.getDonhang_dahuy() ,dh.getDonhang_id());
		  
		  }
}
