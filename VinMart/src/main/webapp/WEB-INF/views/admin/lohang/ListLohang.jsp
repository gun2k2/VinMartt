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
		<script src="${pageContext.request.contextPath}/assets/js/core/n2vi.min.js" type="text/javascript"></script>
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
                <h4 class="card-title">Quản lý lô hàng</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">					
                  <!--Table-->
                  <table id="dataTable" class="table tablesorter myTable" >
				                    <thead class=" text-primary">
					                    <tr>
											<th>ID Lô hàng</th>
                            				<th>Sản Phẩm</th> 
                            				<th>Số lượng nhập</th>
                            				<th>Ngày sản xuất</th>
                            				<th>Hạn sử dụng</th>
                            				<th>Trạng thái</th>                                              
																						
										</tr> 
				                    </thead> 
				                                
									<tbody>								
										<c:forEach var="item" items="${ lohang }">
											<tr>
												<td>#${item.malo }</td>                        
	                           					<td>
	                           						<c:forEach var="pros" items="${ pro }">
		                           						<c:if test="${ item.product_id == pros.product_id }">
															<div class="image_thumb">
																<img height="50" alt="${pros.product_name}"
																	src="${pageContext.request.contextPath}/assets/images/${pros.product_image}" />
																<div class="clear"></div>
															</div>
															<a target="_blank" title="${pros.product_name}"
																class="tipS" target="_blank"
																href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}">
																<b>${pros.product_name}</b>
															</a>
															<div class="f11">Mã sản phẩm: #${pros.product_id}</div>
														</c:if>
													</c:forEach>
												</td>
												<td>${item.soluongnhap }</td>
												<td>${item.ngaysanxuat }</td>
												<td>${item.hansudung }</td>
												<c:if test="${ item.trangthai == 0}">
													<td>Hàng đang về</td>
												</c:if>
												<c:if test="${ item.trangthai == 1}">
													<td>Đang bán</td>
												</c:if>
												<c:if test="${ item.trangthai == 2}">
													<td>Ngừng kinh doanh</td>
												</c:if>
											</tr>	
										</c:forEach>							
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