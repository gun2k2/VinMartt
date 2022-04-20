package VinMart.service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import VinMart.dao.DonhangDao;
import VinMart.entities.Donhang;

@Service
@Transactional
public class DonhangService {

	
	@Autowired
	private DonhangDao dh;
	
	// trang thai = 1
	public List<Donhang> listDhID1() {
	    return dh.listDhID1();
	  }
	
	// trang thai = 2
	public List<Donhang> listDhID2() {
	    return dh.listDhID2();
	  }
	
	// trang thai = 3
	public List<Donhang> listDhID3() {
	    return dh.listDhID3();
	  }
	
	// trang thai = 4	
	public List<Donhang> listDhID4() {
	    return dh.listDhID4();
	  }
	

	// trang thai = 0	
	public List<Donhang> listDhID0() {
	    return dh.listDhID0();
	  }
	
	
	
	//update don hang 
	 public void update(Donhang donhang){
		    
			  dh.update(donhang);
		  }
	//update don hang 
	public void cancel(Donhang donhang){	
		 dh.cancel(donhang);
 }
}
