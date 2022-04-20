package VinMart.entities;


public class NhaCungCap {
	
	private int MaNCC;
	private String TenNCC;
	private String DiaChi;
	private String Email;
	private String Sdt;
	
	
	public int getMaNCC() {
		return MaNCC;
	}

	public void setMaNCC(int maNCC) {
		MaNCC = maNCC;
	}

	public String getTenNCC() {
		return TenNCC;
	}

	public void setTenNCC(String tenNCC) {
		TenNCC = tenNCC;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getSdt() {
		return Sdt;
	}

	public void setSdt(String sdt) {
		Sdt = sdt;
	}

	@Override
	public String toString() {
		return "NhaCungCap [MaNCC=" + MaNCC + ", TenNCC=" + TenNCC + ", DiaChi=" + DiaChi + ", Email=" + Email
				+ ", Sdt=" + Sdt + "]";
	}
	
	public NhaCungCap(int maNCC, String tenNCC, String diaChi, String email, String sdt) {
		super();
		MaNCC = maNCC;
		TenNCC = tenNCC;
		DiaChi = diaChi;
		Email = email;
		Sdt = sdt;
	}
	public NhaCungCap() {
		super();
	}
	
}
