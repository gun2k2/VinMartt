package VinMart.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import VinMart.entities.ConnectionToDB;
import VinMart.entities.Donhang;
import VinMart.entities.Lohang;
import VinMart.entities.MapperLohang;
import VinMart.entities.MapperProducts;
import VinMart.entities.Products;

@Repository
@Transactional
public class LohangDao extends BaseDao{
	
		
		// add
				public boolean save(Lohang lo) {
					System.out.println("vao them san pham");
					
					try {
						
						new ConnectionToDB().excuteSql("insert into lohang values("
						+ lo.getProduct_id() + ", N'" 
						+ lo.getSoluongnhap() + "','" 
						+ lo.getNgaysanxuat() + "','"
						+ lo.getHansudung() +"',"
						+ lo.getTrangthai() + ")" ); 
						return true;
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println(e.getMessage());
					}
					return false;
				}
		// hien thi tat ca danh muc ra ngoai view
		public List<Lohang> listLoHang() {
			String sql = "SELECT  * FROM lohang  order by malo desc";
			return _jdbcTemplate.query(sql, new MapperLohang());
		}
		
		//xoa product
		  public boolean delete(int product_id) {
		    String sql = "DELETE FROM lohang WHERE product_id = " + product_id + " and  trangthai = 0";
		    if ( _jdbcTemplate.update(sql) > 0 ) return true;
		    
		    return false;
		  }
		  // lay han su dung ngay san xuat truyen len view product detail
		  public List<Lohang> GetDateOfLoByID(int product_id) {
				 String sql = "SELECT  top 1 * FROM lohang where product_id = " + product_id + "  and trangthai =1 order by hansudung ASC " ;
				    return _jdbcTemplate.query(sql, new MapperLohang());
			}
		  
		  
		  // update lai trang thai lo thành 2 do hết hạn sử dụng		
		  public void updateTrangthaiLo(int  product_id,String hsd,String nsx,int sln) {
		   String sql = "UPDATE lohang SET trangthai = ? WHERE product_id = ? and hansudung= ? and ngaysanxuat = ? and soluongnhap = ? ";  
		   _jdbcTemplate.update(sql,2 , product_id,hsd,nsx,sln);
		  
		  }
		  
		// lay so luong nhap 
		  public int  getSoLuongNhap(int product_id,String hsd,String nsx) {
				try {
					ResultSet rs=	new ConnectionToDB().selectData("SELECT soluongnhap FROM lohang WHERE product_id = " + product_id +" and hansudung= '"+ hsd +"' and ngaysanxuat = '" + nsx +"'");
					if(rs.next()) {
						return rs.getInt("soluongnhap");
					}else {
						return 0;
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					return 0;
					
				}
						
			}
		// lay hsd 
			 public List<String>  getHsdforCheck() {
				 List<String> los = new ArrayList<String>();
					try {
						ResultSet rs=	new ConnectionToDB().selectData("SELECT hansudung FROM lohang where trangthai=1 ORDER BY hansudung ASC" );
						while(rs.next()) {
							
							los.add(rs.getString("hansudung"));
							
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						return null;
						
					}
					return los;
					
				}
		// lay id 
			 public List<String>  getId(String  hsd) {
				 List<String> ids = new ArrayList<String>();
					try {
						ResultSet rs=	new ConnectionToDB().selectData("SELECT product_id FROM lohang WHERE hansudung = '" + hsd + "'");
						while(rs.next()) {
							ids.add(rs.getString("product_id"));
							
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						return null;
						
					}
					return ids;
					
				}
			// lay id 
			 public List<String>  getSl(String  hsd,String id) {
				 System.out.println("hsd = " + hsd);
				 System.out.println("id = " + id);
				 System.out.println("==========" );
				 List<String> sls = new ArrayList<String>();
					try {
						ResultSet rs=	new ConnectionToDB().selectData("SELECT soluongnhap FROM lohang WHERE hansudung = '" + hsd + "' and product_id = "+ id);
						while(rs.next()) {
							sls.add(rs.getString("soluongnhap"));
							
						}
					} catch (Exception e) {
						// TODO Auto-generated catch block
						return null;
						
					}
					return sls;
					
				}
			 // update lai trang thai lo thành 2 do hết hạn sử dụng		
			  public boolean UpdateTTLo(String  hsd,int id,int soluong) {
				  System.out.println("hsd = " + hsd);
				  System.out.println("id = " + id);
				  System.out.println("soluong = " + soluong);
				  System.out.println("==========" );
				  try {
					new ConnectionToDB().excuteSql("UPDATE lohang set trangthai= 2 "
							  + " where product_id = " + id + "and hansudung= '"+ hsd + "' and soluongnhap =" + soluong);
					return true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return false;
			   
			  
			  }
}
