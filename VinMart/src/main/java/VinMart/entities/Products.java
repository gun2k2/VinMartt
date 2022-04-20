package VinMart.entities;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class Products {

	@NotNull
	@Min(value = 1)
	private int product_id;

	@NotBlank
	private String product_name;

	@NotNull
	@Min(value = 1)
	private int product_price;

	@Min(value = 0)
	@Max(value = 100)
	private int product_discount;

	@NotNull
	@Min(value = 1)
	private int product_danhmuc;
	
	private String product_image;
	private int product_view;
	private int product_purchased;
	private int product_trangthai;
	private int product_soLuongMua;
	
	@NotBlank
	private String product_content;

	
	@Min(value = 0)
	private int product_soluongtonkho;
	
	@NotBlank
	private String product_thuonghieu;
	
	@NotBlank
	private String product_sanxuat;
	
	
	private String product_thanhphan;
	private String product_nongdocon;
	private String product_luongga = "Có ga";
	private String product_luongduong = "Có đường";
	
	@NotBlank
	private String product_thetich;
	
	@NotBlank
	private String product_baoquan;
	
	
	private String product_sudung;
	
	

	@NotNull
	@Min(value = 1)
	private int nhanvien_id;

	@NotNull
	@Min(value = 1)
	private int MaNCC;

	public Products() {
		super();
	}

	public Products(int product_id, String product_name, int product_price, int product_discount, String product_image,
			int product_soLuongMua, int product_soluongtonkho) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_discount = product_discount;
		this.product_image = product_image;
		this.product_soLuongMua = product_soLuongMua;
		this.product_soluongtonkho = product_soluongtonkho;
	}

	
	public Products(int product_id, String product_name, int product_price, int product_discount, int product_danhmuc,
			String product_image, int product_view, int product_purchased, int product_trangthai,
			int product_soLuongMua, String product_content, int product_soluongtonkho, String product_thuonghieu,
			String product_sanxuat, String product_thanhphan, String product_nongdocon, String product_luongga,
			String product_luongduong, String product_thetich, String product_baoquan, String product_sudung,
			 int nhanvien_id, int maNCC) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_discount = product_discount;
		this.product_danhmuc = product_danhmuc;
		this.product_image = product_image;
		this.product_view = product_view;
		this.product_purchased = product_purchased;
		this.product_trangthai = product_trangthai;
		this.product_soLuongMua = product_soLuongMua;
		this.product_content = product_content;
		this.product_soluongtonkho = product_soluongtonkho;
		this.product_thuonghieu = product_thuonghieu;
		this.product_sanxuat = product_sanxuat;
		this.product_thanhphan = product_thanhphan;
		this.product_nongdocon = product_nongdocon;
		this.product_luongga = product_luongga;
		this.product_luongduong = product_luongduong;
		this.product_thetich = product_thetich;
		this.product_baoquan = product_baoquan;
		this.product_sudung = product_sudung;
		
		this.nhanvien_id = nhanvien_id;
		MaNCC = maNCC;
	}

	public Products(String product_name, int product_discount) {
		super();
		this.product_name = product_name;
		this.product_discount = product_discount;
	}

	public Products(String product_name, int product_price, int product_discount) {
		super();
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_discount = product_discount;
	}
	
	
	
	


	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getProduct_discount() {
		return product_discount;
	}

	public void setProduct_discount(int product_discount) {
		this.product_discount = product_discount;
	}

	public int getProduct_danhmuc() {
		return product_danhmuc;
	}

	public void setProduct_danhmuc(int product_danhmuc) {
		this.product_danhmuc = product_danhmuc;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public int getProduct_view() {
		return product_view;
	}

	public void setProduct_view(int product_view) {
		this.product_view = product_view;
	}

	public int getProduct_purchased() {
		return product_purchased;
	}

	public void setProduct_purchased(int product_purchased) {
		this.product_purchased = product_purchased;
	}

	public int getProduct_trangthai() {
		return product_trangthai;
	}

	public void setProduct_trangthai(int product_trangthai) {
		this.product_trangthai = product_trangthai;
	}

	public int getProduct_soLuongMua() {
		return product_soLuongMua;
	}

	public void setProduct_soLuongMua(int product_soLuongMua) {
		this.product_soLuongMua = product_soLuongMua;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public int getProduct_soluongtonkho() {
		return product_soluongtonkho;
	}

	public void setProduct_soluongtonkho(int product_soluongtonkho) {
		this.product_soluongtonkho = product_soluongtonkho;
	}

	public String getProduct_thuonghieu() {
		return product_thuonghieu;
	}

	public void setProduct_thuonghieu(String product_thuonghieu) {
		this.product_thuonghieu = product_thuonghieu;
	}

	public String getProduct_sanxuat() {
		return product_sanxuat;
	}

	public void setProduct_sanxuat(String product_sanxuat) {
		this.product_sanxuat = product_sanxuat;
	}

	public String getProduct_thanhphan() {
		return product_thanhphan;
	}

	public void setProduct_thanhphan(String product_thanhphan) {
		this.product_thanhphan = product_thanhphan;
	}

	public String getProduct_nongdocon() {
		return product_nongdocon;
	}

	public void setProduct_nongdocon(String product_nongdocon) {
		this.product_nongdocon = product_nongdocon;
	}

	public String getProduct_luongga() {
		return product_luongga;
	}

	public void setProduct_luongga(String product_luongga) {
		this.product_luongga = product_luongga;
	}

	public String getProduct_luongduong() {
		return product_luongduong;
	}

	public void setProduct_luongduong(String product_luongduong) {
		this.product_luongduong = product_luongduong;
	}

	public String getProduct_thetich() {
		return product_thetich;
	}

	public void setProduct_thetich(String product_thetich) {
		this.product_thetich = product_thetich;
	}

	public String getProduct_baoquan() {
		return product_baoquan;
	}

	public void setProduct_baoquan(String product_baoquan) {
		this.product_baoquan = product_baoquan;
	}

	public String getProduct_sudung() {
		return product_sudung;
	}

	public void setProduct_sudung(String product_sudung) {
		this.product_sudung = product_sudung;
	}

	

	public int getNhanvien_id() {
		return nhanvien_id;
	}

	public void setNhanvien_id(int nhanvien_id) {
		this.nhanvien_id = nhanvien_id;
	}

	public int getMaNCC() {
		return MaNCC;
	}

	public void setMaNCC(int maNCC) {
		MaNCC = maNCC;
	}

	@Override
	public String toString() {
		return "Products [product_id=" + product_id + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_discount=" + product_discount + ", product_danhmuc=" + product_danhmuc
				+ ", product_image=" + product_image + ", product_view=" + product_view + ", product_purchased="
				+ product_purchased + ", product_trangthai=" + product_trangthai + ", product_soLuongMua="
				+ product_soLuongMua + ", product_content=" + product_content + ", product_soluongtonkho="
				+ product_soluongtonkho + ", product_thuonghieu=" + product_thuonghieu + ", product_sanxuat="
				+ product_sanxuat + ", product_thanhphan=" + product_thanhphan + ", product_nongdocon="
				+ product_nongdocon + ", product_luongga=" + product_luongga + ", product_luongduong="
				+ product_luongduong + ", product_thetich=" + product_thetich + ", product_baoquan=" + product_baoquan
				+ ", product_sudung=" + product_sudung + ", nhanvien_id=" + nhanvien_id + ", MaNCC=" + MaNCC + "]";
	}

	

	

}
