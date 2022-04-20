package VinMart.entities;

import java.util.Date;

public class Phieunhap {

	private int MaPN;
	private Date NgayNhap =new Date();
	public int getMaPN() {
		return MaPN;
	}
	public void setMaPN(int maPN) {
		MaPN = maPN;
	}
	public Date getNgayNhap() {
		return NgayNhap;
	}
	public void setNgayNhap(Date ngayNhap) {
		NgayNhap = ngayNhap;
	}
	@Override
	public String toString() {
		return "Phieunhap [MaPN=" + MaPN + ", NgayNhap=" + NgayNhap + "]";
	}
	public Phieunhap(int maPN, Date ngayNhap) {
		super();
		MaPN = maPN;
		NgayNhap = ngayNhap;
	}
	public Phieunhap() {
		super();
	}
	
}
