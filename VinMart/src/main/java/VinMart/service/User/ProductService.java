package VinMart.service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import VinMart.dao.ProductDao;
import VinMart.entities.Categorys;
import VinMart.entities.NhaCungCap;
import VinMart.entities.Products;

@Service
@Transactional
public class ProductService {

	@Autowired
	private ProductDao productDao;

	public List<Products> listAllkm(int amount) {
		return productDao.listAllkm(amount);
	}

	public List<Products> listAll(int amount) {
		return productDao.listAll(amount);
	}

	public List<Products> listAll() {
		return productDao.listAll();
	}

	public List<Products> listAllkm() {
		return productDao.listAllkm();
	}

	public Products GetProductByID(long product_id) {
		List<Products> listProducts = productDao.GetProductByID(product_id);

		return listProducts.get(0);
	}
	
	public Products GetProductAddOld(long product_id) {
		List<Products> listProducts = productDao.GetProductAddOld(product_id);

		return listProducts.get(0);
	}

	// getcatebyname
	public Categorys GetCateName(int caterogy_id) {
		List<Categorys> listcates = productDao.GetCateName(caterogy_id);

		return listcates.get(0);
	}

	public List<Products> GetSpBanChay() {
		return productDao.GetSpBanChay();
	}

	// -------------------------------------------------------------------
	// ADMIN-PAGE
	public List<Products> listAllPro() {
		return productDao.listAllPro();
	}

	// ADD
	public boolean save(Products pro) {
		// validate business
		return productDao.save(pro);
	}

	// ADD
	public boolean update(Products pro) {
		// validate business
		return productDao.update(pro);
	}

	// save
	public void savencc(NhaCungCap ncc) {
		// validate business
		productDao.savencc(ncc);
	}
	
	// update so luong ton kho khi san pham het han
		public boolean updateSLTK(int product_id, int sltk) {
			// validate business
			return productDao.updateSLTK(product_id,sltk);
		}
		// UPDATE TT SAN PHAM = 2
		public boolean updateTrangThaiBangHai(int product_id) {
			return productDao.updateTrangThaiBangHai(product_id);
			}
		
		// lay so luong ton kho de kt
		public int getSLTK(int product_id) {
			
			return productDao.getSLTK(product_id);
		}

	// productOLD
	public void addproductOld(Products product) {
		// validate business
		productDao.addproductOld(product);
	}

	// Del
	public boolean delete(int product_id) {
		// validate business
		return productDao.delete(product_id);
	}

}
