package VinMart.dao;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import VinMart.entities.CT_DonHang;
import VinMart.entities.ConnectionToDB;
import VinMart.entities.Donhang;
import VinMart.entities.Products;

public class cartDao {

	public static ArrayList<Products> dsSanPham= new ArrayList<Products>();
	public static ArrayList<Products> gioHang= new ArrayList<Products>();
	
	public  cartDao(){
		
	
		dsSanPham.removeAll(dsSanPham);
			try {
				ResultSet rs = new ConnectionToDB().selectData("select * from product where product_trangthai =1 ");
				while(rs.next()){
					int product_id = rs.getInt("product_id");								
					int product_soLuongMua = rs.getInt("product_soLuongMua");
					String product_name = rs.getString("product_name");
					int product_price = rs.getInt("product_price");
					int product_discount = rs.getInt("product_discount");
					int product_soluongtonkho = rs.getInt("product_soluongtonkho");
					String product_image = rs.getString("product_image");
					
					Products sanpham = new Products(product_id, product_name, product_price, product_discount, product_image, product_soLuongMua,product_soluongtonkho);
					dsSanPham.add(sanpham);
				
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	
	}
				
	public boolean kiemTraSanPhamCoTrongGioHangChua(int product_id){
		for (int i = 0; i < gioHang.size(); i++) {
			if(gioHang.get(i).getProduct_id()==product_id){
				System.out.println("if cua kt");
				return true;
			}
		}
		return false;
	}
	
	public boolean themVaoGioHang(int product_id){
		System.out.println("da vao gio hang them 1 sp");

		boolean kiemTra = kiemTraSanPhamCoTrongGioHangChua(product_id);
		for (int i = 0; i <dsSanPham.size(); i++) {
			
				if(dsSanPham.get(i).getProduct_id()==product_id && kiemTra==false){
					dsSanPham.get(i).setProduct_soluongtonkho(dsSanPham.get(i).getProduct_soluongtonkho()-1);
					System.out.println("dsSanPham.get(i).getProduct_soluongtonkho() " + dsSanPham.get(i).getProduct_soluongtonkho() );
					System.out.println("dsSanPham.get(i) = " + dsSanPham.get(i));
					dsSanPham.get(i).setProduct_soLuongMua(dsSanPham.get(i).getProduct_soLuongMua()+1);
					gioHang.add(dsSanPham.get(i));
					
					return true;
				}
		}
		if(kiemTra==true){
			int index =gioHang.size();
			for (int i = 0; i < index; i++) {
				if((gioHang.get(i).getProduct_id())==product_id){
					System.out.println("if cua true");
					System.out.println("ton kho =" + gioHang.get(i).getProduct_soluongtonkho());
					if(gioHang.get(i).getProduct_soluongtonkho()>0 ) {
					gioHang.get(i).setProduct_soLuongMua(gioHang.get(i).getProduct_soLuongMua()+1);
					gioHang.get(i).setProduct_soluongtonkho(gioHang.get(i).getProduct_soluongtonkho()-1);
					index=i;
					return true;
					}
				}
			}
		}
		return false;
	}
	

	public boolean tangsoluonggiohang(int product_id,int sl,int soluongtonkho){
		System.out.println("da vao gio hang ==>");
		
		for (int i = 0; i <gioHang.size(); i++) {		
				if(gioHang.get(i).getProduct_id()==product_id){
					
					if(sl>0 && sl <= soluongtonkho) {
										
					gioHang.get(i).setProduct_soLuongMua(sl);
					
					gioHang.get(i).setProduct_soluongtonkho(soluongtonkho-sl);
					sl=i;
					return true;
					}
	
					
				}
			
			}
		return false;
		
	}
	
	public boolean checkSLmua(int[] product_id,int[] sl){
		
		for (int i = 0; i <gioHang.size(); i++) {		
				if(gioHang.get(i).getProduct_id()==product_id[i]){
					System.out.println("sltk = " + gioHang.get(i).getProduct_soluongtonkho());
					System.out.println("sl mua  = " + gioHang.get(i).getProduct_soLuongMua());
					if(sl[i]>=0 && gioHang.get(i).getProduct_soluongtonkho()>=0 ) {
			
					return true;
					}
	
					
				}
			
			}
		return false;
		
	}
	public boolean xoaSanPhamRakhoiGioHang(int product_id){
	
		for (int i = 0; i < gioHang.size(); i++) {
			if((gioHang.get(i).getProduct_id())==product_id){
				
				gioHang.remove(i);
				
				return true;
			}
		}
		return false;
	}
	public boolean xoa(int[] product_id){
		gioHang.removeAll(gioHang);
		return true;
	}

	public static ArrayList<Products> getDsSanPham() {
		return dsSanPham;
	}

	public static void setDsSanPham(ArrayList<Products> dsSanPham) {
		cartDao.dsSanPham = dsSanPham;
	}

	public static ArrayList<Products> getGioHang() {
		return gioHang;
	}

	public static void setGioHang(ArrayList<Products> gioHang) {
		cartDao.gioHang = gioHang;
	}
	
	
	public boolean adddh(Donhang  dh) {		
		System.out.println("dh.getNguoimua_id() = " + dh.getNguoimua_id());
		
		int donhang_id = 1;
		ConnectionToDB con = new ConnectionToDB();
		try {
			ResultSet rs = con.selectData("select top (1) donhang_id from DonDatHang order by donhang_id desc");
			if (rs.next()) { 
				donhang_id = rs.getInt("donhang_id")+1;
			}
			System.out.println("donhang_id = " + donhang_id);
			
				new ConnectionToDB().excuteSql("insert into DonDatHang values("+donhang_id + ",'" + LocalDate.now() + "'," + dh.getDonhang_trangthai() + ", " 
				+ null + ", " + null + ", " + dh.getDonhang_dahuy() + ", " + dh.getNguoimua_id() +  ")");	
	
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	public boolean addctdh(CT_DonHang  ct_dh) {
		int product_purchased = 0;
		int product_soluongtonkho = 0;
		int donhang_id = 1;
		ConnectionToDB con = new ConnectionToDB();
		try {
			ResultSet rs = con.selectData("select top (1) donhang_id from CT_DonHang order by donhang_id desc");
			if (rs.next()) { 
				donhang_id = rs.getInt("donhang_id")+1;
			}
			 
			for(int i = 0; i < gioHang.size(); i++) { 
				new ConnectionToDB().excuteSql("insert into CT_DonHang values("+donhang_id + "," + ct_dh.getProduct_id()[i] + ",'" + ct_dh.getSoLuong()[i] + "', '" 
				+ ct_dh.getThanhtien()[i] + "', N'" + ct_dh.getDiachi() + "', N'" + ct_dh.getProvince() + "', N'" + ct_dh.getDistrict() + "', N'" 
				+ ct_dh.getWard() + "')");	
				rs = con.selectData("select product_purchased,product_soluongtonkho from product where product_id = "+ct_dh.getProduct_id()[i]);
				rs.next();
				product_purchased = rs.getInt("product_purchased") + Integer.parseInt(ct_dh.getSoLuong()[i]);
				product_soluongtonkho = rs.getInt("product_soluongtonkho") - Integer.parseInt(ct_dh.getSoLuong()[i]);
				new ConnectionToDB().excuteSql("update product set product_purchased = "+product_purchased 
												+",product_soluongtonkho = " + product_soluongtonkho +" where product_id = " + ct_dh.getProduct_id()[i]);
				
				
			
			}
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	

	

	public void giamGioHang(int maSP) {
		// TODO Auto-generated method stub
		int index =gioHang.size();
		
		for (int i = 0; i < index; i++) {
			if(gioHang.get(i).getProduct_id()==maSP){
				gioHang.get(i).setProduct_soLuongMua(gioHang.get(i).getProduct_soLuongMua()-1);
				gioHang.get(i).setProduct_soluongtonkho(gioHang.get(i).getProduct_soluongtonkho()+1);
				if (gioHang.get(i).getProduct_soLuongMua()==0) gioHang.remove(i);
				index=i;
			}
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
