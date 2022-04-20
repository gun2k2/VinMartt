package VinMart.entities;



public class Categorys {
	
	private int category_id;
	private String category_name;
	private int p_id;
	public Categorys() {
		super();
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public Categorys(int category_id, String category_name, int p_id) {
		super();
		this.category_id = category_id;
		this.category_name = category_name;
		this.p_id = p_id;
	}
	@Override
	public String toString() {
		return "Categorys [category_id=" + category_id + ", category_name=" + category_name + ", p_id=" + p_id + "]";
	}
	
	
}
