
<%
	Users check = (Users) session.getAttribute("LoginInfo");
if (check == null) {
	response.sendRedirect("trang-chu");
} else {
%>
<%
	Users user = (Users) session.getAttribute("LoginInfo");
if ((user.getRole_id() == 5) || (user.getRole_id() == 1) || (user.getRole_id() == 2)) {
	System.out.print("user: " + user.getRole_id());
} else {
	session.setAttribute("role", "true");
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
<style type="text/css">
	<%@include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
</style>
<!-- End Head -->
</head>
<body class="app">
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
							<div class="card-header">
								<div class="row" style="justify-content: space-between;">
									<h4 class="card-title">Quản lý sản phẩm</h4>
									<a data-toggle="modal" style="width: 230px; height: 38px;"
										title="Thêm Nhà cung cấp"
										class="btn btn-primary btn-block text-uppercase"
										href="#addncc">Thêm Nhà cung cấp</a>
									<form action="import-excel" method="post"
										enctype="multipart/form-data">
										<input type="file" hidden="true" name="file"/>
										<input style="width: 230px; height: 38px;"
											title="Nhập dữ liệu từ file Excel"
											class="btn btn-primary btn-block text-uppercase"
											type="button" value="Nhập từ file Excel" id="inputExcel"/>
										<input type="submit" hidden="true">
										
									</form>
								</div>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<div class="dropdown">
										<a style="justify-content: center; display: flow-root;"
											class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle"
											href="#" role="button" data-toggle="dropdown"
											aria-expanded="false">
											<i class="tim-icons icon-settings-gear-63"></i>
										</a>
										<div
											class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list"
											style="margin-right: 442px; background: snow">
											<a data-toggle="modal" title="thêm sản phẩm mới"
												class="dropdown-item dropdown-item-font" href="#product-new">
												<i class="tim-icons icon-image-02"></i>
												Sản phẩm mới
											</a>
											<!-- EDIT THEO ID -->
											<a title="thêm sản phẩm đã tồn tại"
												class="dropdown-item dropdown-item-font edit"
												href="#product-old" data-toggle="modal"
												class="dropdown-item dropdown-item-font ">
												<i class="tim-icons icon-single-copy-04"></i>
												Sản phẩm tồn kho
											</a>
										</div>
									</div>
									<!--Table-->
									<table id="dataTable" class="table tablesorter myTable">
										<thead class=" text-primary">
											<tr>
												<th>ID SP</th>
												<th>Sản phẩm</th>
												<th>Danh mục</th>
												<th>Giá</th>
												<th>Trạng thái</th>
												<th>Số lượng</th>
												<th>Thương hiệu</th>
												
												<th class="text-center">Hành động</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="pros" items="${pro}" varStatus="i">
												<tr>
													<th>${pros.product_id}</th>
													<td>
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
														<div class="f11">Đã bán: ${pros.product_purchased} |
															Xem: ${pros.product_view}</div>
													</td>
													<c:forEach var="cate" items="${listCate}">
														<c:if test="${cate.category_id == pros.product_danhmuc }">
															<td>${cate.category_name}</td>
														</c:if>
													</c:forEach>
													<td>
														<a target="_blank" title="" class="tipS">
															<b>
																Discount:
																<span style="color: red;">-${pros.product_discount}%</span>
															</b>
														</a>
														<br>
														<a target="_blank" title="" class="tipS">
															<b>
																Sale:
																<span style="color: red;">
																	<fmt:formatNumber type="number" groupingUsed="true"
																		value="${pros.product_price-pros.product_price*pros.product_discount/100}" />
																	₫
																</span>
															</b>
														</a>
														<br>
														<a target="_blank" title="" class="tipS">
															<b>
																Price:
																<span style="color: red;">
																	<fmt:formatNumber type="number" groupingUsed="true"
																		value="${pros.product_price}" />
																	₫
																</span>
															</b>
														</a>
													</td>
													<c:if test="${pros.product_trangthai == 0 }">
														<td>Hàng đang về</td>
													</c:if>
													<c:if test="${pros.product_trangthai == 1}">
														<c:if test="${pros.product_soluongtonkho != 0}">
														<td>Còn hàng</td>
														</c:if>
														<c:if test="${pros.product_soluongtonkho == 0}">
														<td>Hết hàng</td>
														</c:if>
													</c:if>
													<c:if test="${pros.product_trangthai == 2 }">
														<td>Hết hàng </td>
													</c:if>
													<td>${pros.product_soluongtonkho}</td>
													<td>${pros.product_thuonghieu}</td>
													 													
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
																style="margin-right: 11px; background: snow">
																<a class="dropdown-item dropdown-item-font"
																	target="_blank"
																	href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}">
																	<i class="tim-icons icon-spaceship"></i>
																	Xem chi tiết
																</a>
																<!-- EDIT THEO ID -->
																<a title="Chỉnh sửa sản phẩm"
																	class="dropdown-item dropdown-item-font edit"
																	href="#product_update" data-toggle="modal"
																	class="dropdown-item dropdown-item-font edit">
																	<i class="tim-icons icon-pencil"></i>
																	Chỉnh sửa
																</a>
																<!-- NẾU LIST_SP_KHÔNG_ĐƯỢC_XOÁ CHỨA PRODUCT ID THÌ HIỆN RA KHOÁ -->
																<c:if test="${listSPkodcxoa.contains(pros.product_id) }">
																	<!-- KHOA THEO ID -->
																	<a title="Khoa sản phẩm"
																		class="dropdown-item dropdown-item-font delete"
																		href="#" data-toggle="modal">
																		<i class="tim-icons icon-lock-circle"></i>
																		Đã khóa
																	</a>
																</c:if>
																<c:if
																	test="${listSPkodcxoa.contains(pros.product_id) == false }">
																	<!--  Xoa theo id -->
																	<a title="Xóa sản phẩm"
																		class="dropdown-item dropdown-item-font delete"
																		href="#myModaldel" data-toggle="modal">
																		<i class="tim-icons icon-trash-simple"></i>
																		Xóa
																	</a>
																</c:if>
																<!-- Dữ liệu để edit -->
																<input type="hidden" id="product_id"
																	value="${pros.product_id}" />
																<input type="hidden" id="product_name"
																	value="${pros.product_name}" />
																<input type="hidden" id="product_price"
																	value="${pros.product_price}" />
																<input type="hidden" id="product_discount"
																	value="${pros.product_discount}" />
																<input type="hidden" id="product_danhmuc"
																	value="${pros.product_danhmuc}" />
																<input type="hidden" id="product_image"
																	value="${pros.product_image}" />
																<input type="hidden" id="product_view"
																	value="${pros.product_view}" />
																<input type="hidden" id="product_purchased"
																	value="${pros.product_purchased}" />
																<input type="hidden" id="product_trangthai"
																	value="${pros.product_trangthai}" />
																<input type="hidden" id="MaNCC"
																	value="${pros.getMaNCC()}" />
																<input type="hidden" id="product_thuonghieu"
																	value="${pros.product_thuonghieu}" />
																<input type="hidden" id="product_sanxuat"
																	value="${pros.product_sanxuat}" />
																<input type="hidden" id="product_thanhphan"
																	value="${pros.product_thanhphan}" />
																<input type="hidden" id="product_nongdocon"
																	value="${pros.product_nongdocon}" />
																<input type="hidden" id="product_luongga"
																	value="${pros.product_luongga}" />
																<input type="hidden" id="product_luongduong"
																	value="${pros.product_luongduong}" />
																<input type="hidden" id="product_thetich"
																	value="${pros.product_thetich}" />
																<input type="hidden" id="product_baoquan"
																	value="${pros.product_baoquan}" />
																<input type="hidden" id="product_sudung"
																	value="${pros.product_sudung}" />
																
																
																<input type="hidden" id="product_content"
																	value="${pros.product_content}" />
															</div>
														</div>
														<!-- EDIT THEO ID -->
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
				</div>
			</div>
		</div>
	</div>
	
	<!--END BODY-->
	<jsp:include page="../product/modalAndajax.jsp"></jsp:include>
	
	<script type="text/javascript">
		$('#inputExcel').on('click', function(){
			let input = $(this).parent().find("input[type='file']")
			input.click();
			input.on('change', function(){
				$(this).parent().find("input[type='submit']").click()
			})
		})
	</script>
	<!-- END FOOTER -->
</body>
</html>
<%
	}
%>