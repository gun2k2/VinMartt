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
<script src="${pageContext.request.contextPath}/assets/js/core/n2vi.min.js" type="text/javascript"></script>
		<style type="text/css">
     	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
     	</style>
     	<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
     	<link href="${pageContext.request.contextPath}/assets/demo/styleTrangThaiDonHang.css" rel="stylesheet" />
<!-- End Head -->

</head>
<body  >
	
	<div id="toast"></div>
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
              
              <div class="card-body">
                <div class="table-responsive">
					 <div id="history" class="history">
					    <div class="choose" style="margin-top: -20px;">
					        <h3 class="lsmh active" data-tab="orderlist">Lịch sử mua hàng</h3>    
					    </div>
					    <div class="tcontent orderlist" data-tab="orderlist" >  
					    <div class="order sso" data-id="" style="height: 653px;"  >
					    <div class="status" >			   
								    <div class="createdate infoOther" data-id="" >							                    
									    <!-- TRANG THAI DON HANG -->
									    <div class="orderstatus" data-id="" >
										    <label id = "trangthaidonhang" class="complete statusdelivery">Check trạng thái <i class="tpl-status1"></i>									 
										    </label>
										    <div class="list-status info-status hidden">
											    <div class="status">											   		
												    <button id="xacnhan" style="border-style: none;background: transparent; margin-bottom: 10px;" ><i class="tpl-status1"></i> 
												    	<span>Đã xác nhận</span>
												    </button>
												     <button id="chohang" style="border-style: none;background: transparent; margin-bottom: 10px;" ><i class="tpl-status2"></i> 
												    	<span>Chờ xuất hàng</span>
												    </button>
												    <button id="danggiao" style="border-style: none;background: transparent; margin-bottom: 10px;" ><i class="tpl-status6"></i> 
												    	<span>Đang giao hàng</span>
												    </button>
												    <button id="thanhcong" style="border-style: none;background: transparent; margin-bottom: 10px;" ><i class="tpl-status7"></i>
												    	 <span>Giao thành công</span>
												     </button>
												     <button id="canceldh" style="border-style: none;background: transparent; margin-bottom: 10px;" ><i class="tpl-status4"></i>
												    	 <span>Cancel</span>
												     </button>											   
											     </div>
										     </div>
									     </div>								     
								  </div>
							     <div class="clear"></div>							     
						     </div>	
						    
                  <!--Table-->
                  
 
 <table id="gun2k2" class="table tablesorter myTable dataTable" >
				                    <thead class=" text-primary">
					                    <tr>
											<th>Mã đơn hàng</th>
				                            <th>Ngày đặt</th>                         
				                            <th>Khách hàng</th>                         
				                            <th>Trạng thái</th>                                             
				                            <th>Nhân viên</th> 
				                            <c:if test="${item.donhang_trangthai==0 }" >
				                            <th>Lý do</th> 
				                            </c:if>
				                            <c:if test="${item.donhang_trangthai==4 }" >
				                            <th>Ngày giao</th> 
				                            </c:if>                                        			                            
											<th class="text-center">Hành động</th>											
										</tr> 
				                    </thead>  
				                    <c:if test="${Listdh.size()==0 }" >
			                        <tbody>
			                          <tr>
			                          	<td>NOT DATA</td>
			                            <td>NOT DATA</td>                          
			                            <td>NOT DATA</td>                      
			                            <td>NOT DATA</td>                            
			                            <td>NOT DATA</td>
			                            <c:if test="${item.donhang_trangthai==0 }" >
				                            <td>Lý do</td> 
				                        </c:if> 
				                        <c:if test="${item.donhang_trangthai==4 }" >
				                            <td>Ngày giao</td> 
				                        </c:if>                                                                     
			                            <td class="text-center">NOT DATA</td> 			                            
			                          </tr>
			                          </tbody>
			                        </c:if>            
									<tbody>								
										<c:forEach var="item" items="${Listdh}" >
										<tr>
											<td>#${item.donhang_id }</td> 
				                            <td>${item.donhang_ngaydat }</td>                            
				                            <c:forEach var="item_kh" items="${ view_customers }">
													 <c:if test="${ item_kh.id == item.nguoimua_id }">
													    <td>${item_kh.name}(Khách hàng)</td>  
													 </c:if>
													
												</c:forEach>                        
												 <c:if test="${ item_kh.id != item.nguoimua_id }">
													    	<c:forEach var="item_nv" items="${ view_employees }">
													     	 	<c:if test="${ item_nv.id == item.nguoimua_id }">
													     			<td>${item_nv.name}(Nhân viên) </td>  
													    		</c:if>
													     	 </c:forEach>  
													 </c:if>
				                            <td>
						                         <c:if test="${item.donhang_trangthai==1 }" >
											     Đã xác nhận 
											    </c:if>
											    <c:if test="${item.donhang_trangthai==2 }" >
											     Chờ xuất hàng 
											    </c:if>
											    <c:if test="${item.donhang_trangthai==3 }" >
											    Đang giao hàng
											    </c:if>				    
											    <c:if test="${item.donhang_trangthai==4 }" >
											     Giao thành công
											    </c:if> 
											    <c:if test="${item.donhang_trangthai==0 }" >
											     Đơn hàng đã hủy
											    </c:if> 
									    
									    	</td>  
											   <c:if test="${item.donhang_trangthai != 1 }" >
											    	<c:if test="${ item.nhanvien_id == 33 }">
												     	<td>ADMIN </td>  
													</c:if>
											    	<c:if test="${ item.nhanvien_id != 33 }">
											    		<c:forEach var="item_nv" items="${ view_employees }">
													     <c:if test="${ item_nv.id == item.nhanvien_id }">
													     	<td>${item_nv.name}(Nhân viên) </td>  
													     </c:if>
													     <c:if test="${ item_nv.id != item.nhanvien_id }">
													     	 <c:forEach var="item_kh" items="${ view_customers }">
													     	 	<c:if test="${ item_kh.id == item.nguoimua_id }">
													     			<td>${item_kh.name}(Khách hàng) </td>  
													    		</c:if>
													     	 </c:forEach>
													     </c:if>
											     		</c:forEach>
											    	</c:if>										     										    
						                         </c:if>  
						                         <c:if test="${item.donhang_trangthai == 1   }" >
						                            <td>NULL </td>  
						                         </c:if>   
				                           	<c:if test="${item.donhang_trangthai==0 }" >
				                            <td>${item.donhang_dahuy }</td> 
				                            </c:if> 
				                            <c:if test="${item.donhang_trangthai==4 }" >
				                            <td>${item.donhang_ngaygiao }</td> 
				                            </c:if>      
				                            <td class="text-center">
				                            	<div class="dropdown">
						                            <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
						                              <i class="tim-icons icon-settings-gear-63"></i>
						                            </a>
						                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list" style="margin-right: 58px;background:snow">
						     							<!-- Xem chi tiet  -->
						     							<form  class="dropdown-item dropdown-item-font" action="${pageContext.request.contextPath}/ct-don-hang/${item.donhang_id}" method="post"  enctype="multidata/form-data">
								                            <button style="border: none;padding: 0px;background: transparent;" type="submit" title="DETAIL">
								                           		<i class="tim-icons icon-spaceship"></i> Xem chi tiết
								                            </button>
							                             	<input hidden="true" name="donhang_id" value="${item.donhang_id}">
							                            </form>
						     								
							     						<!-- Xuat THEO ID -->
							     						<c:if test="${item.donhang_trangthai==4 }" >
							     						
														  <a  title="Xuất" class="dropdown-item dropdown-item-font showPN" href="#myModalIN" data-toggle="modal">
															<i class="tim-icons icon-paper"></i>Printf
															<input hidden="true" class="donhang_id" name="donhang_id" value="${item.donhang_id}">
															<input hidden="true" class="donhang_ngaydat" name="donhang_ngaydat" value="${item.donhang_ngaydat }">
															<!-- khach hang -->
															<c:forEach var="item1" items="${ view_customers }">
															<c:if test="${ item1.id == item.nguoimua_id }">
															<input hidden="true" class="nguoimua_id" name="nguoimua_id" value="${ item1.name}">	
															</c:if>
															</c:forEach>
															
															<!-- nhanvien -->
															<c:forEach var="item1" items="${ view_employees }">
															<!-- nguoi mua -->
															<c:if test="${ item1.id == item.nguoimua_id }">
															<input hidden="true" class="nguoimua_id" name="nguoimua_id" value="${ item1.name}">	
															</c:if>
															<!-- duyet san pham -->
															<c:if test="${ item1.id == item.nhanvien_id }">
															<input hidden="true" class="nhanvien_id" name="nhanvien_id" value="${ item1.name}">	
															</c:if>
															</c:forEach>
														  </a>
														</c:if> 	
														  
														<!-- CANCEL TTĐH  -->
														 <c:if test="${item.donhang_trangthai==1 }" >
								                             <form class="dropdown-item dropdown-item-font" action="${pageContext.request.contextPath}/huy-don-hang-admin/${item.donhang_id}" method="post"  enctype="multidata/form-data">
									                             <button title="Cancel"  style="border: none;padding: 0px;background: transparent;"  class="remove">
																    	 <i class="tim-icons icon-simple-remove"></i>Cancel
																 </button>
															  	<input hidden="true" name="donhang_trangthai" value="${item.donhang_trangthai -1}">
																<input hidden="true" name="nhanvien_id" value="<%=user.getUsers_id()%>">			
															 </form>
														 </c:if>
														 
														 <!-- Confirm đơn hàng -->
															 <form class="dropdown-item dropdown-item-font" action="${pageContext.request.contextPath}/update-trangthai/${item.donhang_id}" method="post"  enctype="multidata/form-data">
																 <c:if test="${item.donhang_trangthai==1 }" >
																	 <input hidden="true" name="donhang_trangthai" value="${item.donhang_trangthai +1}">
																	 <input hidden="true" name="nhanvien_id" value="<%=user.getUsers_id()%>">						  
																	 <button  type="submit" title="Xác nhận"  style="border: none;padding: 0px;background: transparent;" class="updatee">
																 		<i class="tim-icons icon-check-2"></i>Confirm
																 	</button>
																 </c:if>
																 <c:if test="${item.donhang_trangthai==2 }" >
																	 <input hidden="true" name="donhang_trangthai" value="${item.donhang_trangthai +1}">
																	 <input hidden="true" name="nhanvien_id" value="<%=user.getUsers_id()%>">
																	 <button  type="submit" title="Xác nhận"  style="border: none;padding: 0px;background: transparent;" class="updatee">
																 		<i class="tim-icons icon-check-2"></i>Confirm
																 	</button>
																 </c:if>
																 <c:if test="${item.donhang_trangthai==3 }" >
																	 <input hidden="true" name="donhang_trangthai" value="${item.donhang_trangthai +1}">
																	 <input hidden="true" name="nhanvien_id" value="<%=user.getUsers_id()%>">
																	 <button  type="submit" title="Xác nhận"  style="border: none;padding: 0px;background: transparent;" class="updatee">
																 		<i class="tim-icons icon-check-2"></i>Confirm
																 	</button>
																 </c:if>
															</form>	 				                            
						                            </div>
					                         	 </div>	
					                            
						
												 
				                             </td> 
										</tr>
									</c:forEach>
									</tbody>									
                  </table>
                  <!-- End Table-->
                  </div>
                  </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!--END TABLE 1-->
        </div>
      </div>
    </div>
  </div>
   
    <%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
    <!-- END Footer-->
  
  <!--DECORATOR FOOTER-->
  <%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
  <!--END DECORATOR FOOTER-->
  	<jsp:include page="../donhang/modalAndajax.jsp"></jsp:include>
    <!--END BODY-->
	<!--Footer-->
 
  
	<%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp" %>	
    
</body>
</html>
<%}%>