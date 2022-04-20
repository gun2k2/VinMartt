package VinMart.entities;

import java.util.Date;

public class Donhang {
	
	private int donhang_id;
	private  Date donhang_ngaydat = new Date();
	private int donhang_trangthai;
	private String donhang_ngaygiao ;
	private int nhanvien_id;
	private String donhang_dahuy;
	private int nguoimua_id;
	public int getDonhang_id() {
		return donhang_id;
	}
	public void setDonhang_id(int donhang_id) {
		this.donhang_id = donhang_id;
	}
	public Date getDonhang_ngaydat() {
		return donhang_ngaydat;
	}
	public void setDonhang_ngaydat(Date donhang_ngaydat) {
		this.donhang_ngaydat = donhang_ngaydat;
	}
	public int getDonhang_trangthai() {
		return donhang_trangthai;
	}
	public void setDonhang_trangthai(int donhang_trangthai) {
		this.donhang_trangthai = donhang_trangthai;
	}
	public String getDonhang_ngaygiao() {
		return donhang_ngaygiao;
	}
	public void setDonhang_ngaygiao(String donhang_ngaygiao) {
		this.donhang_ngaygiao = donhang_ngaygiao;
	}
	public int getNhanvien_id() {
		return nhanvien_id;
	}
	public void setNhanvien_id(int nhanvien_id) {
		this.nhanvien_id = nhanvien_id;
	}
	public String getDonhang_dahuy() {
		return donhang_dahuy;
	}
	public void setDonhang_dahuy(String donhang_dahuy) {
		this.donhang_dahuy = donhang_dahuy;
	}
	public int getNguoimua_id() {
		return nguoimua_id;
	}
	public void setNguoimua_id(int nguoimua_id) {
		this.nguoimua_id = nguoimua_id;
	}
	public Donhang(int donhang_id, Date donhang_ngaydat, int donhang_trangthai, String donhang_ngaygiao, int nhanvien_id,
			String donhang_dahuy, int nguoimua_id) {
		super();
		this.donhang_id = donhang_id;
		this.donhang_ngaydat = donhang_ngaydat;
		this.donhang_trangthai = donhang_trangthai;
		this.donhang_ngaygiao = donhang_ngaygiao;
		this.nhanvien_id = nhanvien_id;
		this.donhang_dahuy = donhang_dahuy;
		this.nguoimua_id = nguoimua_id;
	}
	public Donhang() {
		super();
	}
	@Override
	public String toString() {
		return "Donhang [donhang_id=" + donhang_id + ", donhang_ngaydat=" + donhang_ngaydat + ", donhang_trangthai="
				+ donhang_trangthai + ", donhang_ngaygiao=" + donhang_ngaygiao + ", nhanvien_id=" + nhanvien_id
				+ ", donhang_dahuy=" + donhang_dahuy + ", nguoimua_id=" + nguoimua_id + "]";
	}
	
	

	
}
