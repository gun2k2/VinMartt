package VinMart.dao;

import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import VinMart.entities.CT_Phieunhap;
import VinMart.entities.ConnectionToDB;
import VinMart.entities.Phieunhap;
import VinMart.entities.Products;

@Repository
@Transactional
public class phieunhapDao extends BaseDao {

	public static ArrayList<Products> dsSanPham = new ArrayList<Products>();
	public static ArrayList<Products> phieuNhap = new ArrayList<Products>();

	public phieunhapDao() {

		dsSanPham.removeAll(dsSanPham);
		try {
			ResultSet rs = new ConnectionToDB().selectData("select * from product ");
			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				int product_soLuongMua = rs.getInt("product_soLuongMua");
				String product_name = rs.getString("product_name");
				int product_price = rs.getInt("product_price");
				int product_discount = rs.getInt("product_discount");
				int product_soluongtonkho = rs.getInt("product_soluongtonkho");
				String product_image = rs.getString("product_image");

				Products sanpham = new Products(product_id, product_name, product_price, product_discount,
						product_image, product_soLuongMua, product_soluongtonkho);
				dsSanPham.add(sanpham);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public boolean kiemTraSanPhamConTrongDBChua(int product_id, int product_soluongtonkho) {

		for (int i = 0; i < dsSanPham.size(); i++) {

			if (dsSanPham.get(i).getProduct_id() == product_id) {
				dsSanPham.get(i).setProduct_soluongtonkho(dsSanPham.get(i).getProduct_soluongtonkho() - product_soluongtonkho);
				if (dsSanPham.get(i).getProduct_soluongtonkho() > 0) {
					System.out.println("con trong db");
					return true;
				}

			}
		}
		return false;
	}

	public boolean kiemTraSanPhamCoTrongPhieuNhapChua(int product_id) {
		for (int i = 0; i < phieuNhap.size(); i++) {

			if (phieuNhap.get(i).getProduct_id() == product_id) {

				System.out.println("phieuNhap.get(i).getProduct_id() " + phieuNhap.get(i).getProduct_id());
				System.out.println("product_id " + product_id);
				System.out.println("xong kiem tra");
				return true;
			}
		}
		return false;
	}

	/*
	 * public boolean themVaoPhieuNhap(int product_id, int product_soluongtonkho){
	 * 
	 * boolean kiemTra = kiemTraSanPhamCoTrongPhieuNhapChua(product_id); for (int i
	 * = 0; i <dsSanPham.size(); i++) {
	 * 
	 * if(dsSanPham.get(i).getProduct_id()==product_id ){
	 * 
	 * phieuNhap.add(dsSanPham.get(i));
	 * 
	 * return true; } } if(kiemTra==true){ int index =phieuNhap.size(); for (int i =
	 * 0; i < index; i++) { if((phieuNhap.get(i).getProduct_id())==product_id){
	 * System.out.println("if cua true");
	 * phieuNhap.get(i).setProduct_soLuongMua(phieuNhap.get(i).getProduct_soLuongMua
	 * ()+1); phieuNhap.get(i).setProduct_soluongtonkho(phieuNhap.get(i).
	 * getProduct_soluongtonkho()+product_soluongtonkho); index=i; } } } return
	 * false; }
	 */
	public boolean themVaoPhieuNhap(Products product) {
		int product_id = product.getProduct_id();
		int product_soluongtonkho = product.getProduct_soluongtonkho();
		boolean kiemTra = kiemTraSanPhamCoTrongPhieuNhapChua(product_id);

		if (kiemTra == true) {
			int index = phieuNhap.size();
			for (int i = 0; i < index; i++) {
				if ((phieuNhap.get(i).getProduct_id()) == product_id) {
					System.out.println("if cua true");

					phieuNhap.get(i).setProduct_soluongtonkho(
							phieuNhap.get(i).getProduct_soluongtonkho() + product_soluongtonkho);
					index = i;
				}
			}
		} else {
			for (int i = 0; i < dsSanPham.size(); i++) {

				if (dsSanPham.get(i).getProduct_id() == product_id) {
					System.out.println("dsSanPham.get(i).getProduct_name() = " + dsSanPham.get(i).getProduct_name());
					System.out.println("price = " + dsSanPham.get(i).getProduct_price());
					dsSanPham.get(i).setProduct_soluongtonkho(product_soluongtonkho);
					System.out.println("1");
					System.out.println("dsSanPham.get(i) = " + dsSanPham.get(i));
					phieuNhap.add(dsSanPham.get(i));
					System.out.println("2");

					return true;
				}
			}
		}
		return false;
	}

	public boolean upDatePhieuNhap(Products product) {
		int product_id = product.getProduct_id();
		String product_name = product.getProduct_name(); 
		int product_price = product.getProduct_price();
		int product_discount = product.getProduct_discount();
		String product_image = product.getProduct_image();
		int product_soluongtonkho = product.getProduct_soluongtonkho();
		boolean kiemTra = kiemTraSanPhamCoTrongPhieuNhapChua(product_id);

		if (kiemTra == true) {
			int index = phieuNhap.size();
			for (int i = 0; i < index; i++) {
				if ((phieuNhap.get(i).getProduct_id()) == product_id) {

					phieuNhap.get(i).setProduct_soluongtonkho(product_soluongtonkho);
					phieuNhap.get(i).setProduct_name(product_name);
					phieuNhap.get(i).setProduct_price(product_price);
					phieuNhap.get(i).setProduct_discount(product_discount);
					phieuNhap.get(i).setProduct_image(product_image);
					index = i;
				}
			}
		}
		return false;
	}

	// xoa san pham ra khoi phieu nhap
	public boolean xoaSanPhamRakhoiPhieuNhap(int product_id) {

		for (int i = 0; i < phieuNhap.size(); i++) {
			if (phieuNhap.get(i).getProduct_id() == product_id) {

				phieuNhap.remove(i);

				return true;
			}
		}
		return false;
	}

	// xoa tat̉ ca san pham trong phieu nhap khi hoan thanh phieu nhap
	public boolean xoa(int[] product_id) {
		phieuNhap.removeAll(phieuNhap);
		return true;
	}

	public static ArrayList<Products> getDsSanPham() {
		return dsSanPham;
	}

	public static void setDsSanPham(ArrayList<Products> dsSanPham) {
		cartDao.dsSanPham = dsSanPham;
	}

	public static ArrayList<Products> getPhieuNhap() {
		return phieuNhap;
	}

	public static void setPhieuNhap(ArrayList<Products> phieuNhap) {
		phieunhapDao.phieuNhap = phieuNhap;
	}

	// update lai soluongton kho khi xoa phieu nhap
	public void updateProbyID(Products pro) {
		String sql = "UPDATE product SET product_soluongtonkho = product_soluongtonkho - ? WHERE product_id = ? ";
		_jdbcTemplate.update(sql, pro.getProduct_soluongtonkho(), pro.getProduct_id());
	}

	// them vao phieu nhap
	public boolean addPN(Phieunhap pn) {
		int MaPN = 1;
		ConnectionToDB con = new ConnectionToDB();
		try {
			ResultSet rs = con.selectData("select top (1) MaPN from PHIEUNHAP order by MaPN desc");
			if (rs.next()) {
				MaPN = rs.getInt("MaPN") + 1;
			}
			new ConnectionToDB().excuteSql("insert into PHIEUNHAP values(" + MaPN + ",'" + LocalDate.now() + "' )");

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

	// them vao CT_PhieuNhap
	public boolean addCTPN(CT_Phieunhap ct_pn) {

		int MaPN = 1;
		ConnectionToDB con = new ConnectionToDB();
		try {
			ResultSet rs = con.selectData("select top (1) MaPN from CHITIETPN order by MaPN desc");
			if (rs.next()) {
				MaPN = rs.getInt("MaPN") + 1;
			}
			
			for (int i = 0; i < phieuNhap.size(); i++) {
				new ConnectionToDB().excuteSql("insert into CHITIETPN values(" + MaPN + "," + ct_pn.getProduct_id()[i]
						+ ",'" + ct_pn.getDongianhap()[i] + "', '" + ct_pn.getSoluongnhap()[i] + "')");
				
				
					new ConnectionToDB().excuteSql("update product set product_soluongtonkho = product_soluongtonkho +"+ct_pn.getSoluongnhap()[i] 
					 + ",product_trangthai = 1 where product_id = " + ct_pn.getProduct_id()[i]);
					new ConnectionToDB().excuteSql("update lohang set trangthai =  1 where product_id = " + ct_pn.getProduct_id()[i] + "and soluongnhap = " + ct_pn.getSoluongnhap()[i]);
			
				
				
			}

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return false;
	}

}
