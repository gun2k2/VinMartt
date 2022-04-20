<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("trang-chu");	
 }
 else {
 %>
<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
 <%@page import="VinMart.entities.Users"%>
 <%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 6) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 response.sendRedirect("admin-page");
 }
 %>
                    <!DOCTYPE html>
<html>
<body class="app"  >

 
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
    
     	
</body>
</html>
<%}%>