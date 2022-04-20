package VinMart.Controller.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;

import VinMart.dao.cartDao;
import VinMart.entities.Products;

public class XuLyMuaHang extends HttpServlet  {
	private static final long serialVersionUID = 1L;

    public XuLyMuaHang() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		
		String action = request.getParameter("action");
		System.out.println(action);
		System.out.println(product_id);
		
		cartDao cart = new cartDao();
		if (action.equals("giam")) 
		{
			
			
		         cart.giamGioHang(product_id);
			ArrayList<Products> dsGioHang = new ArrayList<Products>();
			dsGioHang = cartDao.getGioHang();
			session.setAttribute("cart", dsGioHang);
			session.setAttribute("giamThanhCong", "true");
			response.sendRedirect("gio-hang");
		}
			
		else if(action.equals("update")) {
			 String regex = "^[0-9]{1,3}$";		 
	         Pattern pattern = Pattern.compile(regex);
			String check = request.getParameter("sl");
			 Matcher matcher = pattern.matcher(check);
			 if (!matcher.matches() ) {
				 session.setAttribute("CartFail", "true");
	         }
			 else {
				 	int sl = Integer.parseInt(request.getParameter("sl"));
					int soluong_tonkho = Integer.parseInt(request.getParameter("soluong_tonkho"));
					int sl_bandau = Integer.parseInt(request.getParameter("sl_bandau"));
					System.out.println("sl: "+ sl);
					System.out.println("soluong_tonkho: "+ soluong_tonkho);
					System.out.println("sl_bandau: "+ sl_bandau);
					int soluongtonkho=sl_bandau+soluong_tonkho;
					if(cart.tangsoluonggiohang(product_id,sl,soluongtonkho)) {
						ArrayList<Products> dsGioHang = new ArrayList<Products>();
						dsGioHang = cartDao.getGioHang();
						session.setAttribute("cart", dsGioHang);
						session.setAttribute("updateThanhCong", "true");
					}
					else {
						session.setAttribute("CartFail", "true");
					}
			 }
			
			response.sendRedirect("gio-hang");
		}
		else if(action.equals("them")) {
			
				if(cart.themVaoGioHang(product_id)==true) {
					ArrayList<Products> dsGioHang = new ArrayList<Products>();
					dsGioHang = cartDao.getGioHang();
					session.setAttribute("cart", dsGioHang);
					
					session.setAttribute("addThanhCong", "true");
				}
				else {
					session.setAttribute("Thanhtoanfail", "true");
				}
				
			
			response.sendRedirect("gio-hang");
		}
		else if(action.equals("mua")) {
			System.out.println("mua hang");
			
			cart.themVaoGioHang(product_id);
			
			ArrayList<Products> dsGioHang = new ArrayList<Products>();
			dsGioHang = cartDao.getGioHang();
			
			session.setAttribute("cart", dsGioHang);
			System.out.println("thanh cong mua hang");
			
			response.sendRedirect("chi-tiet-san-pham/"+product_id );
			
		}
		else if(action.equals("xoa")) {
			new cartDao().xoaSanPhamRakhoiGioHang(product_id);
			System.out.print("xoa thanh cong");
			session.setAttribute("xoaThanhCong", "true");
			response.sendRedirect("gio-hang");
			
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
