package VinMart.entities;

import java.util.Arrays;

public class CT_DonHang {

	private int donhang_id;
	private String[] product_id;
	private String[] soLuong;
	private String[] thanhtien;
	private String diachi;
	private String province;
	private String district;
	private String ward;
	public int getDonhang_id() {
		return donhang_id;
	}
	public void setDonhang_id(int donhang_id) {
		this.donhang_id = donhang_id;
	}
	public String[] getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String[] product_id) {
		this.product_id = product_id;
	}
	public String[] getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(String[] soLuong) {
		this.soLuong = soLuong;
	}
	public String[] getThanhtien() {
		return thanhtien;
	}
	public void setThanhtien(String[] thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getWard() {
		return ward;
	}
	public void setWard(String ward) {
		this.ward = ward;
	}
	public CT_DonHang() {
		super();
	}
	public CT_DonHang(int donhang_id, String[] product_id, String[] soLuong, String[] thanhtien, String diachi,
			String province, String district, String ward) {
		super();
		this.donhang_id = donhang_id;
		this.product_id = product_id;
		this.soLuong = soLuong;
		this.thanhtien = thanhtien;
		this.diachi = diachi;
		this.province = province;
		this.district = district;
		this.ward = ward;
	}
	
	
	public CT_DonHang(int donhang_id, String[] product_id, String[] soLuong, String[] thanhtien) {
		super();
		this.donhang_id = donhang_id;
		this.product_id = product_id;
		this.soLuong = soLuong;
		this.thanhtien = thanhtien;
	}
	@Override
	public String toString() {
		return "CT_DonHang [donhang_id=" + donhang_id + ", product_id=" + Arrays.toString(product_id) + ", soLuong="
				+ Arrays.toString(soLuong) + ", thanhtien=" + Arrays.toString(thanhtien) + ", diachi=" + diachi
				+ ", province=" + province + ", district=" + district + ", ward=" + ward + "]";
	}
	
	
}
