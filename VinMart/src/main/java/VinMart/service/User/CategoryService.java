package VinMart.service.User;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import VinMart.dao.CategoryDao;
import VinMart.dao.ProductDao;
import VinMart.entities.Categorys;
import VinMart.entities.Products;

@Service
@Transactional
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	public List<Categorys> listAll() {
		return categoryDao.listAll();
	}

	public List<Categorys> listtop8() {
		return categoryDao.listtop8();
	}

	public Categorys findById(long category_id) {
		List<Categorys> listCate = categoryDao.findById(category_id);
		System.out.println("listCate.get(0) " + listCate.get(0));
		return listCate.get(0);
	}

	public boolean save(Categorys cate) {
		// validate business
		return categoryDao.save(cate);
	}

	public boolean update(Categorys cate) {
		// validate business
		return categoryDao.update(cate);
	}

	public boolean delete(int id) {
		// validate business
		return categoryDao.delete(id);
	}

	@Autowired
	private ProductDao productDao;

	public List<Products> GetDataProductsPaginate(int category_id, int start, int totalPage) {
		return productDao.GetDataProductsPaginate(category_id, start, totalPage);
	}

	// sap xep tang dan
	public List<Products> GetDataProductsPaginatetangdan(int category_id, int start, int totalPage) {
		return productDao.GetDataProductsPaginatetangdan(category_id, start, totalPage);
	}

	// sap xep giam dan
	public List<Products> GetDataProductsPaginategiamdan(int category_id, int start, int totalPage) {
		return productDao.GetDataProductsPaginategiamdan(category_id, start, totalPage);
	}

	// sap xep khuyen mai
	public List<Products> GetDataProductsPaginatekhuyenmai(int category_id, int start, int totalPage) {
		return productDao.GetDataProductsPaginatekhuyenmai(category_id, start, totalPage);
	}

	// sap xep Ban chay
	public List<Products> GetDataProductsPaginatebanchay(int category_id, int start, int totalPage) {
		return productDao.GetDataProductsPaginatebanchay(category_id, start, totalPage);
	}

	// sap xep Sp moi
	public List<Products> GetDataProductsPaginatenew(int category_id, int start, int totalPage) {
		return productDao.GetDataProductsPaginatenew(category_id, start, totalPage);
	}

	public List<Products> GetAllByID(int category_id) {
		return productDao.GetAllByID(category_id);
	}

	public List<Products> GetSpLienquanByID(int category_id) {
		return productDao.GetSpLienquanByID(category_id);
	}

	public Products GetNameByID(int category_id) {
		return productDao.GetNameByID(category_id);
	}

}
