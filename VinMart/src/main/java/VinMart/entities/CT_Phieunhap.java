package VinMart.entities;

import java.util.Arrays;

public class CT_Phieunhap {

	
	private int MaPN;
	private String[]  product_id;
	private String[] Dongianhap;
	private String[] Soluongnhap;
	
	
	public CT_Phieunhap() {
		
		super();
	}

	public int getMaPN() {
		return MaPN;
	}

	public void setMaPN(int maPN) {
		MaPN = maPN;
	}

	public String[] getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String[] product_id) {
		this.product_id = product_id;
	}

	public String[] getDongianhap() {
		return Dongianhap;
	}

	public void setDongianhap(String[] dongianhap) {
		Dongianhap = dongianhap;
	}

	public String[] getSoluongnhap() {
		return Soluongnhap;
	}

	public void setSoluongnhap(String[] soluongnhap) {
		Soluongnhap = soluongnhap;
	}

	


	@Override
	public String toString() {
		return "CT_Phieunhap [MaPN=" + MaPN + ", product_id=" + Arrays.toString(product_id) + ", Dongianhap="
				+ Arrays.toString(Dongianhap) + ", Soluongnhap=" + Arrays.toString(Soluongnhap) + "]";
	}

	public CT_Phieunhap( int maPN, String[] product_id, String[] dongianhap, String[] soluongnhap) {
		super();
		
		MaPN = maPN;
		this.product_id = product_id;
		Dongianhap = dongianhap;
		Soluongnhap = soluongnhap;
	}
	
	
}
