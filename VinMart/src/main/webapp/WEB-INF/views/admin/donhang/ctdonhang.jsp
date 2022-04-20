<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("trang-chu");	
 }
 else {
 %>

<%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 6) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 session.setAttribute("role","true");  
	 response.sendRedirect("admin-page");
 }
 %>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/taglib/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/images/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png">
  <title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
  <link rel="icon" href="https://vinmart.com/images/favicon_1.ico">
	<!-- Head -->
	<%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp"%>
<!-- End Head -->
</head>
<body class="app">
	<div class="wrapper">
    <!--sidebar -->
   		<%@include file="/WEB-INF/views/layouts/admin/sidebarLeft/sidebar.jsp"%>
    <!-- end sidebar -->
    <div class="main-panel">
      <!-- Navbar -->
      	<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp"%>
      <!-- End Navbar -->
      
      <!-- BODY CONTENT-->
      <div class="content">
        <div class="row">
          <!--TABLE 1-->
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">Quản lý danh mục</h4>
                 			<% 
	                     int donhang_id = Integer.parseInt(request.getParameter("donhang_id"));
	                     ConnectionToDB con = new ConnectionToDB();
                                	ResultSet rs = con.selectData("select * from ct_donhang where donhang_id = " 
                                 		+ donhang_id);       
                                	ResultSet p,d,w,ct_dh; 	
                                %>  
                <a title="GO BACK" class="btn btn-danger"  href="${pageContext.request.contextPath}/List-Donhang" >
	                   <i class="tim-icons icon-double-left"></i>
	            </a>
              </div>
              <div class="card-body">          
                <div class="table-responsive">
                 Chi tiết đơn hàng #<%=donhang_id %>					
                  <!--Table-->
                  <table class="table tablesorter myTable" >
				                    <thead class=" text-primary">
					                    <tr>
											<th>Mã sản phẩm</th>
				                            <th>Sản phẩm</th>
				                            <th>Số lượng</th>
				                            <th>Tổng tiền</th>
				                            <th>Địa chỉ</th>
				                            <th>Thành Phố/Tỉnh</th>
				                            <th>Phường/Huyện</th>
				                            <th>Đường/Xã</th>											
										</tr> 
				                    </thead>              
									<tbody>								
										<%while(rs.next()){ %>
										<tr>
											<td>#<%=rs.getInt("product_id") %></td>                         
				                            <td>			                          
				                             <% 
				                             ResultSet temp = con.selectData("select product_name from product where product_id = " + rs.getInt("product_id"));
				                             temp.next();
				                             String tenSP = temp.getString("product_name");
				                                ResultSet sp = con.selectData("select * from product where product_id =" +rs.getInt("product_id") );			                                
								                while(sp.next()){%>
											     <div class="image_thumb"> 
											        <img height="50" src="${pageContext.request.contextPath}/assets/images/<%=sp.getString("product_image") %>">
											            <a target="_blank" title="chi-tiet-san-pham" class="tipS" href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%=sp.getInt("product_id")%>">
											               <b><%=tenSP%></b>
											            </a>
											    	<div class="clear"></div>
											    </div>
											    <%} %>			
				                            </td>
                            				<td><%=rs.getString("soLuong")%></td>
				                            <td>
				                            <%int thanhtien =  rs.getInt("thanhtien");%>
				                             	<span style="color:red;"><fmt:formatNumber type = "number" groupingUsed = "true" 
												value="<%=thanhtien%>" />₫ </span>
				                            </td>
                           					<td><%=rs.getString("diachi")%></td>
                         					<% ct_dh = con.selectData("select * from CT_DonHang where donhang_id = "+rs.getInt("donhang_id") + " "); 					     
					     					ct_dh.next();%>
					     					<%p = con.selectData("select province_name from province where id = "+ct_dh.getInt("province"));
	                           				 p.next();
				                            String tenprovince = p.getString("province_name");
				                            
				                            d = con.selectData("select district from district where id = "+ ct_dh.getInt("district")+ " and province_id = " + ct_dh.getInt("province") );
			                				d.next();
			                				String tendistrict = d.getString("district");
			                				
			                				w = con.selectData("select ward from ward where id = "+ ct_dh.getInt("ward") );
			                				w.next();
			                				String tenward = w.getString("ward");
				                         	%>
				                            <td><%=tenprovince %></td>
				                            <td><%=tendistrict %></td>
				                            <td><%=tenward %></td>
										</tr>
									<%} %>
									</tbody>									
                  </table>
                  <!-- End Table-->
                </div>
              </div>
            </div>
          </div>
          <!--END TABLE 1-->
		 
        </div>
      </div>
    </div>
  </div>
    <!--END BODY-->
        
		 <!--Footer-->
	  	<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
	    <!-- END Footer-->
  
	  <!--DECORATOR FOOTER-->
	  <%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
	  <!--END DECORATOR FOOTER-->
</body>
</html>
<%}%>