<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("trang-chu");	
 }
 else {
 %>


<%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 5) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 session.setAttribute("role","true");  
	 response.sendRedirect("admin-page");
 }
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <h4 class="card-title">Quản lý phiếu nhập</h4>
                <% 	int MaPN = Integer.parseInt(request.getParameter("MaPN"));	 
                       		ConnectionToDB con = new ConnectionToDB();
                        	ResultSet rs = con.selectData("select * from CHITIETPN where MaPN =  " + MaPN);
                        	%>
                      <a title="GO BACK" class="btn btn-danger"  href="${pageContext.request.contextPath}/List-Phieu-Nhap" >
	                        <i class="tim-icons icon-double-left"></i>
	                  </a>
              </div>
              <div class="card-body">
                <div class="table-responsive">	
                
                       Chi tiết phiếu nhập #<%=MaPN %>  				
                  <!--Table-->
                  <table class="table tablesorter myTable" >
				                    <thead class=" text-primary">
					                    <tr>
											<th>Mã sản phẩm</th>                       
				                            <th>Đơn giá </th>
				                            <th>Số lượng</th>                           																					
										</tr> 
				                    </thead> 					
			                        <tbody>   
			                        <%while(rs.next()){ %>                  	
			                          <tr>
			                            <td>
			                            <a target="_blank" title="<%=rs.getInt("product_id") %>" class="tipS"  target="_blank"
													href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%=rs.getInt("product_id") %>">
													<b>#<%=rs.getInt("product_id") %></b>
										</a>			                                  
			                            <td><%=rs.getInt("Dongianhap") %></td>                     
			                            <td><%=rs.getInt("Soluongnhap") %></td> 
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