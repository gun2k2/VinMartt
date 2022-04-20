package VinMart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import VinMart.entities.CT_DonHang;
import VinMart.entities.Categorys;
import VinMart.entities.ConnectionToDB;
import VinMart.entities.Lohang;
import VinMart.entities.MapperCategorys;
import VinMart.entities.MapperProducts;
import VinMart.entities.NhaCungCap;
import VinMart.entities.Products;

@Repository
@Transactional
public class ProductDao  extends BaseDao{


	
	//list load KM
	 public List<Products> listAllkm(int amount) {
		    String sql = "SELECT  * FROM product where product_discount !=0 and product_trangthai =1 ORDER BY product_id OFFSET "+ amount + " rows fetch next 8 rows only";
		    return _jdbcTemplate.query(sql, new MapperProducts());
		  }
	//list load all
	 public List<Products> listAll(int amount) {
		    String sql = "SELECT  * FROM product where product_trangthai =1 ORDER BY product_id OFFSET "+ amount + " rows fetch next 8 rows only";
		    return _jdbcTemplate.query(sql, new MapperProducts());
		  }
	//list load top 8 sp
	 public List<Products> listAll() {
		    String sql = "SELECT top 8 * FROM product where product_trangthai =1 ";
		    return _jdbcTemplate.query(sql, new MapperProducts());
		  }
	//list load top 8 sp KM
	 public List<Products> listAllkm() {
		    String sql = "SELECT top 8 * FROM product where product_discount !=0 and product_trangthai =1 ";
		    return _jdbcTemplate.query(sql, new MapperProducts());
		  }
	// lay san pham ra ngoai boi danh muc
	 public List<Products> GetAllByID(int category_id) {
		    String sql = "SELECT  * FROM product where product_danhmuc = " + category_id + " and product_trangthai =1 " ;
		    return _jdbcTemplate.query(sql, new MapperProducts());
		  }
	// lay san pham cung loai voi danh muc
	 public List<Products> GetSpLienquanByID(int category_id) {
		    String sql = "SELECT top 4 *  FROM product where product_danhmuc = " + category_id + " and product_trangthai =1 " ;
		    return _jdbcTemplate.query(sql, new MapperProducts());
		  }
	 
	
	 
	 
	 public Products GetNameByID(int category_id) {
		    String sql = "SELECT  * FROM category where category_id = " + category_id + " " ;
		    return  _jdbcTemplate.queryForObject(sql, new MapperProducts(), category_id); 
		  }
	 
	 public List<Products> GetDataProductsPaginate(int category_id,int start, int totalPage) {
		 String sqlGetDataByID = "SELECT  * FROM product where product_danhmuc = " + category_id + " and product_trangthai =1 " ;
		 List<Products> ListProductsByID = _jdbcTemplate.query(sqlGetDataByID, new MapperProducts());
		 List<Products> ListProduct = new ArrayList<Products>();
		 System.out.println("ListProductsByID " + ListProductsByID );
		 System.out.println("ListProduct " +ListProduct );
		 if(ListProductsByID.size()>0) { //neu nhu co san pham moi lay du lieu phan trang
			 String sql = "SELECT  * FROM product where product_danhmuc= " + category_id + " and product_trangthai =1 "+ " ORDER BY product_danhmuc OFFSET "
		    		 + start+"-1 " +" ROWS " + " FETCH NEXT "+ totalPage + " "+ " ROWS ONLY" ;
			 ListProduct = _jdbcTemplate.query(sql, new MapperProducts()); 
		 }
		   
		    return ListProduct;
		  }
	 
	 // Tang dan
	 public List<Products> GetDataProductsPaginatetangdan(int category_id,int start, int totalPage) {
		 String sqlGetDataByID = "SELECT  * FROM product where product_danhmuc = " + category_id + " and product_trangthai =1 " ;
		 List<Products> ListProductsByID = _jdbcTemplate.query(sqlGetDataByID, new MapperProducts());
		 List<Products> ListProduct = new ArrayList<Products>();
		 if(ListProductsByID.size()>0) { //neu nhu co san pham moi lay du lieu phan trang
			 String sql = "SELECT  * FROM product where product_danhmuc=" + category_id + " and product_trangthai =1 ORDER BY  product_price ASC, product_danhmuc OFFSET "
		    		 + start+"-1 " +" ROWS " + " FETCH NEXT "+ totalPage + " "+ " ROWS ONLY" ;
			 ListProduct = _jdbcTemplate.query(sql, new MapperProducts());
		 }
		   
		    return ListProduct;
		  }
	 
	 // Giam dan
	 public List<Products> GetDataProductsPaginategiamdan(int category_id,int start, int totalPage) {
		 String sqlGetDataByID = "SELECT  * FROM product where product_danhmuc = " + category_id + " and product_trangthai =1 " ;
		 List<Products> ListProductsByID = _jdbcTemplate.query(sqlGetDataByID, new MapperProducts());
		 List<Products> ListProduct = new ArrayList<Products>();
		 if(ListProductsByID.size()>0) { //neu nhu co san pham moi lay du lieu phan trang
			 String sql = "SELECT  * FROM product where product_danhmuc=" + category_id + " and v ORDER BY  product_price DESC, product_danhmuc OFFSET "
		    		 + start+"-1 " +" ROWS " + " FETCH NEXT "+ totalPage + " "+ " ROWS ONLY" ;
			 ListProduct = _jdbcTemplate.query(sql, new MapperProducts());
		 }
		   
		    return ListProduct;
		  }
	 
	// Khuyen mai
		 public List<Products> GetDataProductsPaginatekhuyenmai(int category_id, int start, int totalPage) {
			 String sqlGetDataByID = "SELECT  * FROM product where product_danhmuc = " + category_id + " and product_trangthai =1 " ;
			 List<Products> ListProductsByID = _jdbcTemplate.query(sqlGetDataByID, new MapperProducts());
			 List<Products> ListProduct = new ArrayList<Products>();
			 if(ListProductsByID.size()>0) { //neu nhu co san pham moi lay du lieu phan trang
				 String sql = "SELECT  * FROM product where product_danhmuc = "+ category_id + " and product_trangthai =1 ORDER BY  product_discount DESC, product_danhmuc OFFSET "
			    		 + start+"-1 " +" ROWS " + " FETCH NEXT "+ totalPage + " "+ " ROWS ONLY" ;
				 ListProduct = _jdbcTemplate.query(sql, new MapperProducts());
			 }
			   
			    return ListProduct;
			  }
		// sap xep ban chay 
		 public List<Products> GetDataProductsPaginatebanchay(int category_id, int start, int totalPage) {
			 String sqlGetDataByID = "SELECT  * FROM product where product_danhmuc = " + category_id + " and product_trangthai =1 " ;
			 List<Products> ListProductsByID = _jdbcTemplate.query(sqlGetDataByID, new MapperProducts());
			 List<Products> ListProduct = new ArrayList<Products>();
			 if(ListProductsByID.size()>0) { //neu nhu co san pham moi lay du lieu phan trang
				 String sql = "SELECT  * FROM product where  product_danhmuc = "+ category_id + " and product_trangthai =1 ORDER BY product_purchased DESC, product_danhmuc OFFSET "
			    		 + start+"-1 " +" ROWS " + " FETCH NEXT "+ totalPage + " "+ " ROWS ONLY" ;
				 ListProduct = _jdbcTemplate.query(sql, new MapperProducts());
			 }
			   
			    return ListProduct;
			  }
		 public List<Products> GetDataProductsPaginatenew(int category_id, int start, int totalPage) {
			 String sqlGetDataByID = "SELECT  * FROM product where product_danhmuc = " + category_id + " and product_trangthai =1 " ;
			 List<Products> ListProductsByID = _jdbcTemplate.query(sqlGetDataByID, new MapperProducts());
			 List<Products> ListProduct = new ArrayList<Products>();
			 if(ListProductsByID.size()>0) { //neu nhu co san pham moi lay du lieu phan trang
				 String sql = "SELECT  * FROM product where product_danhmuc = "+ category_id + " and product_trangthai =1 ORDER BY product_id DESC, product_danhmuc OFFSET "
			    		 + start+"-1 " +" ROWS " + " FETCH NEXT "+ totalPage + " "+ " ROWS ONLY" ;
				 ListProduct = _jdbcTemplate.query(sql, new MapperProducts());
			 }
			   
			    return ListProduct;
			  }
	public List<Products> GetProductByID(long product_id) {
		 String sql = "SELECT  * FROM product where product_id = " + product_id + "  and product_trangthai =1 " ;
		    return _jdbcTemplate.query(sql, new MapperProducts());
	}
	
	public List<Products> GetProductAddOld(long product_id) {
		 String sql = "SELECT  * FROM product where product_id = " + product_id  ;
		    return _jdbcTemplate.query(sql, new MapperProducts());
	}
	
	 public List<Products> GetSpBanChay() {
		    String sql = "SELECT top 10 *  FROM product where product_trangthai =1 order by product_purchased DESC " ;
		    return _jdbcTemplate.query(sql, new MapperProducts());
		  }
	 
	//--------------------------------------------------------------------------------
	 //ADMIN-PAGE
	 public List<Products> listAllPro() {
		    String sql = "SELECT  * FROM product ";
		    return _jdbcTemplate.query(sql, new MapperProducts());
		  }
	 // add
		public boolean save(Products pro) {
			System.out.println("vao them san pham");
			
			try {
				
				new ConnectionToDB().excuteSql("insert into product values("
				+ pro.getProduct_id() + ", N'" 
				+ pro.getProduct_name() + "'," 
				+ pro.getProduct_price() + ","
				+ pro.getProduct_discount() +","
				+ pro.getProduct_danhmuc() +",'"
				+ pro.getProduct_image() + "',"
				+ pro.getProduct_view() + ","
				+ pro.getProduct_purchased() + ","
				+ pro.getProduct_trangthai() + ","
				+ pro.getProduct_soLuongMua() + ",N'"
				+ pro.getProduct_content() + "',"
				+ 0 +",N'" 
				+ pro.getProduct_thuonghieu() +"',N'"
				+ pro.getProduct_sanxuat() + "',N'"
				+ pro.getProduct_thanhphan() + "',N'"
				+ pro.getProduct_nongdocon() + "',N'"
				+ pro.getProduct_luongga() + "',N'"
				+ pro.getProduct_luongduong() +"',N'"
				+ pro.getProduct_thetich() + "',N'"
				+ pro.getProduct_baoquan() + "',N'"
				+ pro.getProduct_sudung() + "',"				
				+ pro.getNhanvien_id() + ","
				+ pro.getMaNCC() + ")" ); 
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			return false;
		}
		
		// UPDATE PRODUCT
		public boolean update(Products pro) {
			System.out.println("vao update san pham");
			try {

				new ConnectionToDB().excuteSql("UPDATE product set product_name= N'" + pro.getProduct_name()
						+ "',product_price=" + pro.getProduct_price() + ",product_discount=" + pro.getProduct_discount()
						+ ",product_danhmuc=" + pro.getProduct_danhmuc() + ",product_image='" + pro.getProduct_image()
						+ "',product_view=" + pro.getProduct_view() + ",product_purchased=" + pro.getProduct_purchased()
						+ ",product_soLuongMua="
						+ pro.getProduct_soLuongMua() + ",product_content=N'" + pro.getProduct_content()
						 + "',product_thuonghieu=N'"
						+ pro.getProduct_thuonghieu() + "',product_sanxuat=N'" + pro.getProduct_sanxuat()
						+ "',product_thanhphan=N'" + pro.getProduct_thanhphan() + "',product_nongdocon=N'"
						+ pro.getProduct_nongdocon() + "',product_luongga=N'" + pro.getProduct_luongga()
						+ "',product_luongduong=N'" + pro.getProduct_luongduong() + "',product_thetich=N'"
						+ pro.getProduct_thetich() + "',product_baoquan=N'" + pro.getProduct_baoquan()
						+ "',product_sudung=N'" + pro.getProduct_sudung()  + "',nhanvien_id=" + pro.getNhanvien_id() + ",MaNCC="
						+ pro.getMaNCC() + "where product_id=" + pro.getProduct_id());
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
			}
			return false;
		}
		// end edit
		
		// UPDATE SLTK
				public boolean updateSLTK(Products pro) {
					System.out.println("vao update san pham");
					try {

						new ConnectionToDB().excuteSql("UPDATE product set product_soluongtonkho= " + pro.getProduct_soluongtonkho()
								 +",product_purchased = "+ pro.getProduct_purchased() + " where product_id = " + pro.getProduct_id());
						return true;
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println(e.getMessage());
					}
					return false;
				}
		// end UPDATE SLTK
				
				
		// UPDATE SLTK
			public boolean updateSLTK(int product_id, int sltk) {
					System.out.println("vao update san pham");
					try {

						new ConnectionToDB().excuteSql("UPDATE product set product_soluongtonkho= product_soluongtonkho- " + sltk
								  + " where product_id = " + product_id);
						return true;
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println(e.getMessage());
					}
					return false;
				}
		// end UPDATE SLTK
			
		// UPDATE TT SAN PHAM = 2
			public boolean updateTrangThaiBangHai(int product_id) {
								System.out.println("vao update san pham");
								try {

									new ConnectionToDB().excuteSql("UPDATE product set product_trangthai= 2 "
											  + " where product_id = " + product_id);
									return true;
								} catch (Exception e) {
									e.printStackTrace();
									System.out.println(e.getMessage());
								}
								return false;
							}
					// end UPDATE SLTK
				
				
		// add NCC
		public void savencc(NhaCungCap ncc) {
		    String sql = "INSERT INTO NhaCungCap (TenNCC, DiaChi,Email,Sdt) VALUES (?, ?,?,?)";
		    _jdbcTemplate.update(sql,ncc.getTenNCC(),ncc.getDiaChi(),ncc.getEmail(),ncc.getSdt());
		  }
		//chinh sua product OLD
		  public void addproductOld(Products product) {
			  System.out.println("getProduct_soluongtonkho" + product.getProduct_soluongtonkho());
			  System.out.println("getProduct_id" + product.getProduct_id());
		   String sql = "UPDATE product SET  product_soluongtonkho = product_soluongtonkho + ? WHERE product_id = ? ";  
		   _jdbcTemplate.update(sql, product.getProduct_soluongtonkho(), product.getProduct_id());
		  
		  }
		//xoa product
		  public boolean delete(int product_id) {
		    String sql = "DELETE FROM product WHERE product_id = " + product_id;
		    if ( _jdbcTemplate.update(sql) > 0 ) return true;
		    
		    return false;
		  }
		  
		
		//tang view
		  public boolean updateView(int product_id) throws Exception   {
				Connection conn  = null;
				PreparedStatement ps =null;
				
				ConnectionToDB db = new ConnectionToDB();
				System.out.println("2");
				try {
					String query =" update product" +" set product_view=product_view +1 where product_id='"+product_id+"'";
					
					conn = db.getConnect();
					ps =conn.prepareStatement(query);
					ps.executeUpdate();
					System.out.println("4");
					return true;
				} catch (Exception e) {
					throw e;
				} 
				
			
			}

		//get cate by Name hien thi ra ngoai chi tiet san pham
		public List<Categorys> GetCateName(int caterogy_id) {
			 String sql = "SELECT  * FROM  category where category_id = " + caterogy_id + " " ;
			    return _jdbcTemplate.query(sql, new MapperCategorys());
		}
		
		// kiem tra san pham  co ton tai hay khong  bang id
				public boolean checkIDProDuct(int product_id) {
					try {
					ResultSet rs=	new ConnectionToDB().selectData("select product_id from product where product_id = '" + product_id + "'");
					if(rs.next()) {
						return true;
					}else {
						return false;
					}
							
						
					} catch (Exception e) {
						return false;
					}
				}
				// lay sltk 
				 public int  getSLTK(int product_id) {
						try {
							ResultSet rs=	new ConnectionToDB().selectData("SELECT product_soluongtonkho FROM product WHERE product_id = " + product_id );
							if(rs.next()) {
								return rs.getInt("product_soluongtonkho");
							}else {
								return 0;
							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							return 0;
							
						}
						
					}
				
				
		
}
