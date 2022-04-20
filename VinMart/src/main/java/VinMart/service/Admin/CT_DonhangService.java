package VinMart.service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import VinMart.dao.CT_DonhangDao;
import VinMart.entities.CT_DonHang;

@Service
@Transactional
public class CT_DonhangService {

	@Autowired
	private CT_DonhangDao ct_dh;
	
	
	
}
