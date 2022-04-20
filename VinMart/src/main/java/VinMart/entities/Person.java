
package VinMart.entities;

public class Person {
	private int id;
	private String name;
	private String sdt;
	private boolean gioitinh;

	public Person(int id, String name, String sdt, boolean gioitinh) {
		super();
		this.id = id;
		this.name = name;
		this.sdt = sdt;
		this.gioitinh = gioitinh;
	}

	public Person() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public boolean isGioitinh() {
		return gioitinh;
	}

	public void setGioitinh(boolean gioitinh) {
		this.gioitinh = gioitinh;
	}
	

}
