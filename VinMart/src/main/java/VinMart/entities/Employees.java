
package VinMart.entities;

public class Employees extends Person {
	private float HSL;
	private boolean status;

	public Employees(int id, String name, String sdt, boolean gioitinh, float hSL, boolean status) {
		super();
		HSL = hSL;
		this.status = status;
	}

	public Employees() {
	}

	public float getHSL() {
		return HSL;
	}

	public void setHSL(float hSL) {
		HSL = hSL;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
