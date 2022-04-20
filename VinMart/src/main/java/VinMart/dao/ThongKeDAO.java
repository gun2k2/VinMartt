package VinMart.dao;



import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import VinMart.entities.ConnectionToDB;
import VinMart.entities.Products;

public class ThongKeDAO {
	public ThongKeDAO(){
		
	}
	
	/*public Map<String,TraSua> thongKeTheoTuan(String tuan,String text){
		ArrayList<String> list = danhSachKhoangNgayTheoTuan(tuan, text);
		return thongKeTheoKhoanNgay(list.get(0), list.get(1));
	}
	
	public ArrayList<String> danhSachKhoangNgayTheoTuan(String tuan,String text){
		int week = Integer.parseInt(tuan);
		String year = text.substring(0,text.indexOf("-"));
		String month=text.substring(text.indexOf("-")+1, text.length());
		ArrayList<String> list = new ArrayList<>();
		switch (week) {
		case 1:
			list.add(year+"-"+month+"-"+1);
			list.add(year+"-"+month+"-"+7);
			break;
		case 2:
			list.add(year+"-"+month+"-"+8);
			list.add(year+"-"+month+"-"+14);
			break;
		case 3:
			list.add(year+"-"+month+"-"+15);
			list.add(year+"-"+month+"-"+21);
			break;
		case 4:
			list.add(year+"-"+month+"-"+22);
			list.add(year+"-"+month+"-"+31);
			break;
		default:
			break;
		}
		return list;
	}
	
	
	public Map<String,TraSua> thongKeTheoKhoanNgay(String dateStart,String dateEnd){
		Map<String,TraSua> map = new HashMap<>();
		try {
			ResultSet rs = new ConnectDTB().chonDuLieu("select * from [dbo].[TraSua] where NgayBanRa>='"+dateStart+"' and NgayBanRa<='"+dateEnd+"'");
			while(rs.next()){
				String ma = rs.getString(1);
				String ten = rs.getString(2);
				String gia = rs.getString(3);
				String soLuong = rs.getString(4);
				String doanhThu = rs.getString(5);
				String ngay = rs.getString(6);
				map.put(ma, new TraSua(ma, ten, gia, soLuong, doanhThu, ngay));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Loi thong ke theo thang");
		}
		return map;
		
	}
	
	public Map<String, TraSua> thongKeTheoThang(String text){
		String year = text.substring(0,text.indexOf("-"));
		String month=text.substring(text.indexOf("-")+1, text.length());
		
		Map<String,TraSua> map = new HashMap<>();
		try {
			ResultSet rs = new ConnectDTB().chonDuLieu("select * from [dbo].[TraSua] where year(NgayBanRa)='"+year+"' and month(NgayBanRa)='"+month+"'");
			while(rs.next()){
				String ma = rs.getString(1);
				String ten = rs.getString(2);
				String gia = rs.getString(3);
				String soLuong = rs.getString(4);
				String doanhThu = rs.getString(5);
				String ngay = rs.getString(6);
				map.put(ma, new TraSua(ma, ten, gia, soLuong, doanhThu, ngay));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Loi thong ke theo thang");
		}
		return map;
	}
	
	public Map<String, TraSua> thongKeTheoThangHeThong(){
		Date toDate = new Date(System.currentTimeMillis());
		SimpleDateFormat fomatTime = new SimpleDateFormat("yyyy-MM-dd");
		String date = fomatTime.format(toDate.getTime());
		
		String year = date.substring(0,date.indexOf("-"));
		String month=date.substring(date.indexOf("-")+1, date.lastIndexOf("-"));

		Map<String,TraSua> map = new HashMap<>();
		try {
			ResultSet rs = new ConnectDTB().chonDuLieu("select * from [dbo].[TraSua] where year(NgayBanRa)='"+year+"' and month(NgayBanRa)='"+month+"'");
			while(rs.next()){
				String ma = rs.getString(1);
				String ten = rs.getString(2);
				String gia = rs.getString(3);
				String soLuong = rs.getString(4);
				String doanhThu = rs.getString(5);
				String ngay = rs.getString(6);
				map.put(ma, new TraSua(ma, ten, gia, soLuong, doanhThu, ngay));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Loi thong ke theo thang");
		}
		return map;
	}
	*/
	public Map<String,Products> thongKeTheoNgay(String date){
		Map<String,Products> map = new HashMap<String, Products>();
		try {
			ResultSet rs = new ConnectionToDB().selectData("select * from product where NgayBanRa='"+date+"'");
			while(rs.next()){
				String ma = rs.getString(1);
				String ten = rs.getString(2);
				String gia = rs.getString(3);
				String soLuong = rs.getString(4);
				String doanhThu = rs.getString(5);
				String ngay = rs.getString(6);
			
			//map.put(ma, new Products(ma, ten, gia, soLuong, doanhThu, ngay));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Loi thong ke theo ngay");
		}
		return map;
	}
	/*public Map<String,TraSua> thongKeTheoNgayHeThong(){
		Date toDate = new Date(System.currentTimeMillis());
		SimpleDateFormat fomatTime = new SimpleDateFormat("yyyy-MM-dd");
		String date = fomatTime.format(toDate.getTime());
		
		Map<String,TraSua> map = new HashMap<>();
		try {
			ResultSet rs = new ConnectDTB().chonDuLieu("select * from [dbo].[TraSua] where NgayBanRa='"+date+"'");
			while(rs.next()){
				String ma = rs.getString(1);
				String ten = rs.getString(2);
				String gia = rs.getString(3);
				String soLuong = rs.getString(4);
				String doanhThu = rs.getString(5);
				String ngay = rs.getString(6);
				map.put(ma, new TraSua(ma, ten, gia, soLuong, doanhThu, ngay));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Loi thong ke theo ngay");
		}
		return map;
	}
	public static void main(String[] args) {
		String ngay="2017-05-03";
		String tuan="2";
		String thang="2017-05";
		String ngay2 = "2017-06-12";
		
//		System.out.println(new ThongKeDAO().thongKeTheoNgay(ngay));
//		System.out.println(new ThongKeDAO().thongKeTheoNgayHeThong());
		Map<String,TraSua> map = new ThongKeDAO().thongKeTheoKhoanNgay(ngay, ngay2);
		for(TraSua ts : map.values()){
			System.out.println(ts);
		}
//		System.out.println(new ThongKeDAO().thongKeTheoThang(thang));
//		System.out.println(new ThongKeDAO().thongKeTheoThangHeThong());
//		System.out.println(new ThongKeDAO().thongKeTheoTuan(tuan, thang));
//		System.out.println(new ThongKeDAO().thongKeTheoKhoanNgay(ngay, ngay2));
		
	}
	*/
}
