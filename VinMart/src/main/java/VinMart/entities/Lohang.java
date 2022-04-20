package VinMart.entities;

public class Lohang {
	private int malo;
	private int product_id;
	private int soluongnhap;
	private String ngaysanxuat ;
	private String hansudung ;
	private int trangthai;
	private String[] hsd;
	public int getMalo() {
		return malo;
	}
	public void setMalo(int malo) {
		this.malo = malo;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getSoluongnhap() {
		return soluongnhap;
	}
	public void setSoluongnhap(int soluongnhap) {
		this.soluongnhap = soluongnhap;
	}
	public String getNgaysanxuat() {
		return ngaysanxuat;
	}
	public void setNgaysanxuat(String ngaysanxuat) {
		this.ngaysanxuat = ngaysanxuat;
	}
	public String getHansudung() {
		return hansudung;
	}
	public void setHansudung(String hansudung) {
		this.hansudung = hansudung;
	}
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
	public Lohang(int malo, int product_id, int soluongnhap, String ngaysanxuat, String hansudung, int trangthai) {
		super();
		this.malo = malo;
		this.product_id = product_id;
		this.soluongnhap = soluongnhap;
		this.ngaysanxuat = ngaysanxuat;
		this.hansudung = hansudung;
		this.trangthai = trangthai;
	}
	public Lohang() {
		super();
	}
	
	public Lohang(String hansudung) {
		super();
		this.hansudung = hansudung;
	}
	public Lohang(String[] hsd) {
		super();
		this.hsd = hsd;
	}
	@Override
	public String toString() {
		return "Lohang [malo=" + malo + ", product_id=" + product_id + ", soluongnhap=" + soluongnhap + ", ngaysanxuat="
				+ ngaysanxuat + ", hansudung=" + hansudung + ", trangthai=" + trangthai + "]";
	}
	
	
}
