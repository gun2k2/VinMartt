
<%
	Users check = (Users) session.getAttribute("LoginInfo");
if (check == null) {
	response.sendRedirect("trang-chu");
} else {
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	Users user = (Users) session.getAttribute("LoginInfo");
if ((user.getRole_id() == 7) || (user.getRole_id() == 1) || (user.getRole_id() == 2)) {
	System.out.print("user: " + user.getRole_id());

} else {
	session.setAttribute("role", "true");
	response.sendRedirect("admin-page");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76"
	href="${pageContext.request.contextPath}/assets/images/apple-icon.png">
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/images/favicon.png">
<title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
  <link rel="icon" href="https://vinmart.com/images/favicon_1.ico">
<!-- Head -->
<%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp"%>
<!-- End Head -->
<style type="text/css">
  	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
</style>
</head>
<body>
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
					<%
						if (user.getRole_id() == 1) {
					%>
					<div class="col-md-12">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">Thông tin user</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<!--  thêm nhân viên -->
									<a title="Thêm user nhân viên" class="tipS"
										href="#myAddNhanVien" data-toggle="modal" data-target="">
										<i style="font-size: 30px; color: #6f42c1;"
											class="fas fa-user-plus"></i>
									</a>
									<!--Table-->
									<table id="dataTable" class="table tablesorter myTable">
										<thead class=" text-primary">
											<tr>
												<th>ID</th>
												<th>Email</th>
												<th>Mật khẩu</th>
												<th>Tên quyền</th>
												<th>Trạng thái</th>
												<th class="text-center">Hành động</th>
											</tr>
										</thead>
										
											<tbody>
											<c:forEach var="item" items="${ view_account }">
												<tr>
													<td>${ item.users_id }</td>
													<td>${ item.users_email }</td>
													<td>${ item.users_password }</td>
													<c:if test="${ item.role_id == 1 }">
														<td>ADMIN</td>
													</c:if>
													<c:if test="${ item.role_id == 2 }">
														<td>NHANVIEN_FULL</td>
													</c:if>
													<c:if test="${ item.role_id == 3 }">
														<td>KHACHHANG</td>
													</c:if>
													<c:if test="${ item.role_id == 4 }">
														<td>NHANVIEN_DANHMUC</td>
													</c:if>
													<c:if test="${ item.role_id == 5 }">
														<td>NHANVIEN_SANPHAM</td>
													</c:if>
													<c:if test="${ item.role_id == 6 }">
														<td>NHANVIEN_DONHANG</td>
													</c:if>
													<c:if test="${ item.role_id == 7 }">
														<td>NHANVIEN_KHACHHANG</td>
													</c:if>
													<c:if test="${ item.role_id == 8 }">
														<td>NHANVIEN_DOANHTHU</td>
													</c:if>
													<c:if
														test="${ item.role_id == 2 || item.role_id == 4 || item.role_id == 5 ||  item.role_id == 6 ||  item.role_id == 7 }">
														<c:forEach var="item1" items="${ view_employees }">
															<c:if test="${ item1.id == item.users_id }">
																<c:if test="${ item1.status == true }">
																	<td>Runing </td>
																</c:if>															
															</c:if>
														</c:forEach>
														<c:forEach var="item1" items="${ view_employees_leave }">
															<c:if test="${ item1.id == item.users_id }">
																<c:if test="${ item1.status == false }">
																	<td>Stoped </td>
																</c:if>															
															</c:if>
														</c:forEach>
													</c:if>
													<c:if test="${ item.role_id == 1 || item.role_id == 3}">
														<td></td>
													</c:if>
													<td class="text-center">
													
														<div class="dropdown">
															<c:if test="${ item.role_id == 1}">	
															<a style="cursor: not-allowed;"
																class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
																href="#" role="button" data-toggle="dropdown"
																aria-expanded="false">
																<i class="tim-icons icon-settings-gear-63"></i>
															</a>
															</c:if>
															<c:if test="${ item.role_id != 1}">	
															<a 
																class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
																href="#" role="button" data-toggle="dropdown"
																aria-expanded="false">
																<i class="tim-icons icon-settings-gear-63"></i>
															</a>
															<div
																class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
																style="margin-right: 12px; background: snow">
																<!-- <a class="dropdown-item dropdown-item-font" href="#"><i class="tim-icons icon-spaceship"></i> Xem chi tiết</a> -->
																<!-- EDIT THEO ID -->
																
																												
																
																<a title="Chỉnh sửa user"
																	class="dropdown-item dropdown-item-font editRole "
																	href="#myEditRole" data-toggle="modal">
																	<i class="tim-icons icon-pencil"></i>
																	Chỉnh sửa
																</a>
																<!-- <a class="dropdown-item dropdown-item-font" href="#"><i class="tim-icons icon-lock-circle"></i> Khóa</a>
					                              <a class="dropdown-item dropdown-item-font" href="#"><i class="tim-icons icon-trash-simple"></i> Xóa</a>  -->
																<input type="hidden" id="users_id"
																	value="${item.users_id}">
																<input type="hidden" id="users_email"
																	value="${item.users_email}">
																<input type="hidden" id="users_password"
																	value="${item.users_password}">
																<input type="hidden" id="role_id" value="${item.role_id}">
															</div>
															</c:if>
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
					<!--END TABLE 1-->
					<%
						}
					%>
					<%
						if ((user.getRole_id() == 1) || (user.getRole_id() == 2)) {
					%>
					<!--TABLE 2-->
					<div class="col-md-12">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">Thông tin nhân viên</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<!--  thêm nhân viên -->
									<!--Table-->
									<table id="dataTable" class="table tablesorter myTable">
										<thead class=" text-primary">
											<tr>
												<th>ID</th>
												<th>Họ và tên</th>
												<th>Số điện thoại</th>
												<th>Giới tính</th>
												<th class="text-center">Hành động</th>
											</tr>
										</thead>
										
											<tbody>
											<c:forEach var="item" items="${ view_employees }" begin="0"
											end="${ view_employees.size() }" varStatus="loop">
												<tr>
													<td>${ item.id }</td>
													<td>${ item.name }</td>
													<td>${ item.sdt }</td>
													<td>${ item.gioitinh }</td>
													<td class="text-center">
														<div class="dropdown">
															<a
																class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
																href="#" role="button" data-toggle="dropdown"
																aria-expanded="false">
																<i class="tim-icons icon-settings-gear-63"></i>
															</a>
															<div
																class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
																style="margin-right: 107px; background: snow">
																<!-- EDIT THEO ID -->
																<a title="Chỉnh sửa nhân viên"
																	class="dropdown-item dropdown-item-font editNV"
																	href="#myEditNhanvien" data-toggle="modal">
																	<i class="tim-icons icon-pencil"></i>
																	Chỉnh sửa
																</a>
																<c:if test="${ LoginInfo.users_id != item.id}">
																	<a title="Khóa nhanviên"
																		class="dropdown-item dropdown-item-font removeNV"
																		href="#myDelNhanvien" data-toggle="modal">
																		<i class="tim-icons icon-lock-circle"></i>
																		Khóa
																	</a>
																</c:if>
																<c:if test="${ LoginInfo.users_id == item.id}">
																	<a style="cursor: not-allowed;" title="Không thể thao tác"
																		class="dropdown-item dropdown-item-font "
																		href="javascript:void(0)" >
																		<i class="tim-icons icon-lock-circle"></i>
																		Khóa
																	</a>
																</c:if>
																<input type="hidden" id="id_nv" value="${item.id}">
																<input type="hidden" id="name_nv" value="${item.name}">
																<input type="hidden" id="sdt_nv" value="${item.sdt}">
																<input type="hidden" id="gioitinh_nv"
																	value="${item.gioitinh}">
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
					<%
						}
					%>
					<!--End table 2-->
					<!--TABLE 3-->
					<div class="col-md-12">
						<div class="card ">
							<div class="card-header">
								<h4 class="card-title">Thông tin khách hàng</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<!--  thêm nhân viên -->
									<!--  thêm nhân viên -->
									<a title="Thêm user khách hàng" class="tipS"
										href="#myAddKhachHang" data-toggle="modal">
										<i style="font-size: 30px; color: #6f42c1;"
											class="fas fa-user-plus"></i>
									</a>
									<!--Table-->
									<table id="dataTable" class="table tablesorter myTable">
										<thead class=" text-primary">
											<tr>
												<th>ID</th>
												<th>Họ và tên</th>
												<th>Số điện thoại</th>
												<th>Giới tính</th>
												<th class="text-center">Hành động</th>
											</tr>
										</thead>
										
											<tbody>
											<c:forEach var="item" items="${ view_customers }" begin="0"
											end="${ view_customers.size() }" varStatus="loop">
												<tr>
													<td>${ item.id }</td>
													<td>${ item.name }</td>
													<td>${ item.sdt }</td>
													<td>${ item.gioitinh }</td>
													<td class="text-center">
														<div class="dropdown">
															<a
																class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
																href="#" role="button" data-toggle="dropdown"
																aria-expanded="false">
																<i class="tim-icons icon-settings-gear-63"></i>
															</a>
															<div
																class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
																style="margin-right: 92px; background: snow">
																<!-- EDIT THEO ID -->
																<a title="Chỉnh sửa Khách hàng"
																	class="dropdown-item dropdown-item-font editKH"
																	href="#myEditKhachHang" data-toggle="modal">
																	<i class="tim-icons icon-pencil"></i>
																	Chỉnh sửa
																</a>
																<a title="Xóa Khách hàng"
																	class="dropdown-item dropdown-item-font removeKH"
																	href="#myDelKhachHang" data-toggle="modal">
																	<i class="tim-icons icon-trash-simple"></i>
																	Xóa
																</a>
																
																<input type="hidden" id="idcus" value="${item.id}">
																<input type="hidden" id="namecus" value="${item.name}">
																<input type="hidden" id="sdtcus" value="${item.sdt}">
																<input type="hidden" id="gioitinhcus"
																	value="${item.gioitinh}">
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
					<!-- END TABLE 3 -->
				</div>
			</div>
		</div>
	</div>
	<!--END BODY-->
	<jsp:include page="../admin/modalAndajax.jsp"></jsp:include>
</body>
</html>
<%
	}
%>