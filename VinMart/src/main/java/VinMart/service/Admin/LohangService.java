package VinMart.service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import VinMart.dao.LohangDao;
import VinMart.entities.Donhang;
import VinMart.entities.Lohang;
import VinMart.entities.Products;

@Service
@Transactional
public class LohangService {
	
	@Autowired
	private LohangDao lohang;
	
	
	public List<Lohang> listLoHang() {
		List<Lohang> listLoHang = lohang.listLoHang();

		return listLoHang;
	}
	
	// Del
		public boolean delete(int product_id) {
			// validate business
			return lohang.delete(product_id);
		}
		
		public Lohang GetDateOfLoByID(int product_id) {
			List<Lohang> listLo = lohang.GetDateOfLoByID(product_id);

			return listLo.get(0);
		}
		
		//update don hang 
		 public void updateTrangthaiLo(int product_id,String hsd,String nsx,int sln){
			    
			 lohang.updateTrangthaiLo(product_id,hsd,nsx,sln);
			  }
		
}
