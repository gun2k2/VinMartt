package VinMart.service.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import VinMart.dao.phieunhapDao;
import VinMart.entities.Products;

@Service
@Transactional
public class PhieunhapService {

	@Autowired
	private phieunhapDao phieunhap;
	
	 public void updateProbyID(Products pro){
		    // validate business
		 phieunhap.updateProbyID(pro);
		  }
	 
	 
}
