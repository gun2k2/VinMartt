
<%
	Users check = (Users) session.getAttribute("LoginInfo");
if (check == null) {
	response.sendRedirect("trang-chu");
} else {
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

		<style type="text/css">
     	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
     	</style>
<!-- End Head -->
</head>
<body class="app">
	<%
		Users user = (Users) session.getAttribute("LoginInfo");
	if ((user.getRole_id() == 4) || (user.getRole_id() == 1) || (user.getRole_id() == 2)) {
		System.out.print("user: " + user.getRole_id());

	} else {
		session.setAttribute("role", "true");
		response.sendRedirect("admin-page");
	}
	%>
	
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
                <h4 class="card-title">Quản lý danh mục</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">
						<a title="Chỉnh sửa danh mục" class="tipS" href="#myModal" data-toggle="modal" >
							<i style="font-size: 30px; color: #6f42c1;"class="fas fa-user-plus"></i>
						</a>
                  <!--Table-->
                  <table id="dataTable" class="table tablesorter myTable" >
				                    <thead class=" text-primary">
					                    <tr>
											<th>ID</th>
											<th>Tên danh mục</th>
											<th>Loại</th>
											<th class="text-center">Hành động</th>											
										</tr> 
				                    </thead>              
									<tbody>								
										<c:forEach items="${cate}" var="item">
										<tr>
											<td>${item.category_id}</td>
											<td>
												<a 	target="_blank"
													href="${pageContext.request.contextPath}/san-pham/${item.category_id}"
													class="link-hover" data-search="${item.category_name}"
													data-keyword=""> ${item.category_name} </a>
											</td>
											<td>${item.p_id}</td>
											<td class="text-center">
											<div class="dropdown">
					                            <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
					                              <i class="tim-icons icon-settings-gear-63"></i>
					                            </a>
					                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list" style="margin-right: 58px;background:snow">
					     							<!-- EDIT THEO ID -->
												<a  title="Chỉnh sửa category" class="dropdown-item dropdown-item-font edit" href="#myModalEdit" data-toggle="modal">
													<i class="tim-icons icon-pencil"></i>Chỉnh sửa
												  </a> 
												<!-- DEL THEO ID -->
												<c:if test="${listCatekodcxoa.contains(item.category_id) == false }">
													<!-- XOÁ THEO ID -->
													<a title="Xóa category" class="dropdown-item dropdown-item-font delete" href="#myModaldel" data-toggle="modal">
													<i class="tim-icons icon-simple-remove"></i> Xóa</a>
												</c:if>
												<input type="hidden" id="category_id" value="${item.category_id}">
												<input type="hidden" id="p_id" value="${item.p_id}">
												<input type="hidden" id="category_name"value="${item.category_name}">
					                            
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
          <!--END TABLE 1-->
		

        
        </div>
      </div>
    </div>
  </div>
    <!--END BODY-->
	
	<!-- The Modal ADD -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Thêm danh mục</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="row tm-edit-product-row"
						style="justify-content: center;">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<form:form action="category-add" method="post"
								modelAttribute="cate2add">
								<div class="form-group mb-3">
									<label for="name">Tên danh mục </label>
									<input name="category_name" type="text"
										class="form-control validate" required>
								</div>
								<div class="form-group mb-3">
									<label for="category">Danh mục</label>
									<select class="custom-select tm-select-accounts" name="p_id"
										id="category">
										<option value="0">Là danh mục cha</option>
										<c:forEach items="${cate}" var="item">
											<c:if test="${item.p_id == 0 }">
												<option value="${item.category_id }">${item.category_name }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
								<div class="col-12">
									<button type="submit"
										style="background-color: #ed1c24; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">THÊM NGAY</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">ĐÓNG</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END The Modal ADD -->
	<!-- The Modal EDIT -->
	<div class="modal fade" id="myModalEdit">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Chỉnh sửa danh mục</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="row tm-edit-product-row"
						style="justify-content: center;">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<form:form action="category-edit" class="tm-edit-product-form"
								method="post" modelAttribute="cate2edit">
								<div class="form-group mb-3">
									<label for="name">Tên danh mục </label>
									<input name="category_name" id="category_name_modal"
										type="text" class="form-control validate" required>
								</div>
								<div class="form-group mb-3">
									<label for="category">Danh mục</label>
									<select class="custom-select tm-select-accounts" name="p_id"
										id="p_id_modal">
										<option value="0">Là danh mục cha</option>
										<c:forEach items="${cate}" var="item">
											<c:if test="${item.p_id == 0 }">
												<option value="${item.category_id }">${item.category_name }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
								<div class="col-12">
									<button type="submit"
										style="background-color: #ed1c24; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">CẬP NHẬP NGAY</button>
									<input type="hidden" name="category_id" id="category_id_edit" />
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button"
						style="background-color: #868e96; border-color: #868e96"
						class="btn btn-danger" data-dismiss="modal">ĐÓNG</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END The Modal EDIT -->
	<!-- The Modal DEL-->
	<div class="modal fade" id="myModaldel">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Xóa danh mục</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body" id="title_product_del"></div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<form class="tm-edit-product-form"
						action="${pageContext.request.contextPath}/del-category"
						method="post">
						<button style="width: 100%; background-color: red;" type="submit"
							class="btn btn-primary btn-block text-uppercase deleteCate">XÓA NGAY 
							?</button>
						<input type="hidden" name="category_id" id="category_id_del" />
					</form>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">ĐÓNG</button>
				</div>
			</div>
		</div>
	</div>
	<!-- END The Modal DEL -->
	<!--Footer-->
  	<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
    <!-- END Footer-->
  
	  <!--DECORATOR FOOTER-->
	  <%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
	  <!--END DECORATOR FOOTER-->
	<%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp" %>
	<c:set var="inserted" value="${inserted}" />
	<c:set var="updated" value="${updated}" />
	<c:set var="deleted" value="${deleted}" />
	<!-- THÊM -->
	<script>if(${inserted}) themThanhCong(); else themThatBai()</script>
	<%
		session.removeAttribute("inserted");
	%>
	<!-- SỬA -->
	<script>if(${updated}) suaThanhCong(); else suaThatBai()</script>
	<%
		session.removeAttribute("updated");
	%>
	<!-- XOÁ -->
	<script>if(${deleted}) xoaSPthanhcong(); else xoaSPthatbai()</script>
	<%
		session.removeAttribute("deleted");
	%>
	
	
	<!-- END FOOTER -->
	<!-- Xoa du lieu -->
	<script type="text/javascript">
		$(document).ready(function() {

			$('#dataTable').on('click', '.delete', function() {
				let id = $(this).parent().find('#category_id').val();
				let cate_name = $(this).parent().find('#category_name').val();
				//TITLE MODAL DEL
				$('#title_product_del')[0].innerText = "Bạn có chắc chắn muốn xoá [" + cate_name + "] ?";
				
				$('#myModaldel #category_id_del').val(id);

			});

		});
	</script>
	<!-- END Xoa du lieu -->
	<!-- UPDATE du lieu -->
	<script type="text/javascript">
		$('#dataTable').on('click', '.edit', function(){	
			let cate_id = $(this).parent().find('#category_id').val();
			let cate_name = $(this).parent().find('#category_name').val();
			let p_id = $(this).parent().find('#p_id').val();
			
			$('#category_id_edit').val(cate_id);
			$('#category_name_modal').val(cate_name);
			$('#p_id_modal').val(p_id);
		})
	</script>
	<!-- END UPDATE du lieu -->
</body>
</html>
<%
	}
%>