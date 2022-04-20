package VinMart.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import VinMart.entities.Categorys;
import VinMart.entities.ConnectionToDB;
import VinMart.entities.MapperCategorys;

@Repository
@Transactional

public class CategoryDao extends BaseDao {

	// add
	public boolean save(Categorys cate) {
		String sql = "INSERT INTO category (category_name, p_id) VALUES (?, ?)";
		int kq = _jdbcTemplate.update(sql, cate.getCategory_name(), cate.getP_id());

		if (kq > 0)
			return true;
		return false;
	}

	// xoa
	public boolean delete(int category_id) {
		String sql = "DELETE FROM category WHERE category_id = " + category_id;
		int kq = _jdbcTemplate.update(sql);
		if (kq > 0)
			return true;
		return false;
	}

	// chinh sua
	public boolean update(Categorys cate) {
		String sql = "UPDATE category SET category_name = ?, p_id = ? WHERE category_id = ? ";
		int kq = _jdbcTemplate.update(sql, cate.getCategory_name(), cate.getP_id(), cate.getCategory_id());
		if (kq > 0)
			return true;
		return false;

	}

	// tim kim theo id
	public List<Categorys> findById(long category_id) {
		String sql = "SELECT * FROM category WHERE category_id =" + category_id;
		return _jdbcTemplate.query(sql, new MapperCategorys());
	}

	// hien thi tat ca danh muc ra ngoai view
	public List<Categorys> listAll() {
		String sql = "SELECT * FROM category ";
		return _jdbcTemplate.query(sql, new MapperCategorys());
	}

	// hien thi ́ san pham dau tien cua dnah muc ra ngoai view
	public List<Categorys> listtop8() {
		String sql = "SELECT top 4 * FROM category";
		return _jdbcTemplate.query(sql, new MapperCategorys());
	}
	
	//Lấy ra danh sách danh mục không được xoá
	public List<Integer> getDskodcxoa(){
		String sql = "SELECT DISTINCT product_danhmuc from product";
		ResultSet rs;
		try {
			//hiển thị xoá hoặc khoá
			rs = new ConnectionToDB().selectData(sql);
			List<Integer> listCatekodcxoa = new ArrayList<Integer>();
			while(rs.next()){
				listCatekodcxoa.add(rs.getInt("product_danhmuc"));
			}
			return listCatekodcxoa;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

}
