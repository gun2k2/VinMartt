<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="VinMart.entities.Users"%>
<%@page import="java.sql.ResultSet"%>
<!-- The Modal ADD Khach hang -->
<div class="modal fade" id="myAddKhachHang">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Thêm khách hàng</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row tm-edit-product-row"
					style="justify-content: center;">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<c:url value="/addCustomer" var="addCustomer" />
						<form action="${ addCustomer }" method="POST"
							class="tm-edit-product-form">
							<div class="row tm-edit-product-row">
								<div class="col-xl-6 col-lg-6 col-md-12">
									<div class="form-group mb-3">
										<div class="form-group mb-3">
											<label for="name">Email </label>
											<input style="width: 254%;" name="users_email" type="email"
												class="form-control validate" required>
										</div>
										<div class="form-group mb-3">
											<label for="name">Mật khẩu </label>
											<input style="width: 254%;" name="users_password"
												type="password" class="form-control validate" required>
										</div>
										<label for="name">Họ và tên </label>
										<input style="width: 254%;" name="name" type="text"
											class="form-control validate" required>
									</div>
									<div class="form-group mb-3">
										<label for="name">Số diện thoại </label>
										<input style="width: 254%;" name="sdt" type="text"
											class="form-control validate" required>
									</div>
									<div style="display: flex; margin-left: 78px;">
										<input type="radio" name="gioitinh" value="1">
										<label for="male">NAM</label>
										<br>
										<input type="radio" name="gioitinh" value="0">
										<label for="female">NỮ</label>
										<br>
									</div>
								</div>
								<div class="col-12">
									<button type="submit"
										style="background-color: #ed1c24; width: 130%; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">
										Thêm khách hàng</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal ADD khach hang -->
<!-- The Modal UPDATE Khach hang -->
<div class="modal fade" id="myEditKhachHang">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Update khách hàng</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row tm-edit-product-row"
					style="justify-content: center;">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<form:form action="editcustomer" class="tm-edit-product-form"
							method="post" modelAttribute="cusedit">
							<div class="row tm-edit-product-row">
								<div class="col-xl-6 col-lg-6 col-md-12">
									<div class="form-group mb-3">
										<label for="name"> Id </label>
										<input id="id_modal" name="id" style="width: 254%;" readonly
											required class="form-control validate" />
									</div>
									<div class="form-group mb-3">
										<label for="name">Họ và tên </label>
										<input id="name_modal" name="name" style="width: 254%;"
											type="text" class="form-control validate" required>
									</div>
									<div class="form-group mb-3">
										<label for="name">Số diện thoại </label>
										<input id="sdt_modal" name="sdt" style="width: 254%;"
											type="text" class="form-control validate" required>
									</div>
									<div style="display: flex; margin-left: 78px;">
										<input type="radio" name="gioitinh" value="1" id = "gioitinh_modal_KH_nam">
										<label for="male">NAM</label>
										<br>
										<input type="radio" name="gioitinh" value="0" id = "gioitinh_modal_KH_nu">
										<label for="female">NỮ</label>
										<br>
									</div>
								</div>
								<div class="col-12" style="right: 23px;">
									<button type="submit"
										style="background-color: #ed1c24; width: 130%; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">Lưu</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal UPdate khach hang -->
<!-- The Modal DEL Khach hang-->
<div class="modal fade" id="myDelKhachHang">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">DELETE</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">Do you want to DELETE ?</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<form class="tm-edit-product-form"
					action="${pageContext.request.contextPath}/del-customer"
					method="post">
					<button style="width: 100%; background-color: red;" type="submit"
						class="btn btn-primary btn-block text-uppercase deleteCate">OK
						?</button>
					<input type="hidden" name="id" id="id_modal_del" />
				</form>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal DEL Khach hang -->
<!-- ------------------------------------------------------------------------------------------------------------ -->
<!-- The Modal ADD Nhan Vien-->
<div class="modal fade" id="myAddNhanVien">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Thêm nhân viên</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row tm-edit-product-row"
					style="justify-content: center;">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<c:url value="/addEmployee" var="addEmployee" />
						<form action="${ addEmployee }" method="POST"
							class="tm-edit-product-form">
							<div class="row tm-edit-product-row">
								<div class="col-xl-6 col-lg-6 col-md-12">
									<div class="form-group mb-3">
										<div class="form-group mb-3">
											<label for="name">Email </label>
											<input style="width: 254%;" name="users_email" type="email"
												class="form-control validate" required>
										</div>
										<div class="form-group mb-3">
											<label for="name">Mật khẩu </label>
											<input style="width: 254%;" name="users_password"
												type="password" class="form-control validate" required>
										</div>
										<label for="name">Họ và tên </label>
										<input style="width: 254%;" name="name" type="text"
											class="form-control validate" required>
									</div>
									<div class="form-group mb-3">
										<label for="name">Số diện thoại </label>
										<input style="width: 254%;" name="sdt" type="text"
											class="form-control validate" required>
									</div>
									<div style="display: flex; margin-left: 78px;">
										<input required type="radio" name="gioitinh" value="1">
										<label for="male">NAM</label>
										<br>
										<input required type="radio" name="gioitinh" value="0">
										<label for="female">NỮ</label>
										<br>
									</div>
									<div class="row">
										<%
											ConnectionToDB con = new ConnectionToDB();
										ResultSet rs = con.selectData("select * from Role where role_id != 1 and role_id != 3");
										while (rs.next()) {
										%>
										<div class="row">
											<input required type="radio" name="role_id"
												value="<%=rs.getInt("role_id")%>">
											<label for="male">
												<%=rs.getString("role_name")%></label>
											<br>
										</div>
										<%
											}
										%>
									</div>
								</div>
								<div class="col-12">
									<button type="submit"
										style="background-color: #ed1c24; width: 130%; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">
										Thêm nhân viên</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal ADD Nhan Vien -->
<!-- The Modal DEL Nhan Vien-->
<div class="modal fade" id="myDelNhanvien">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Leave ?</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">This employee has stopped working?</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<form class="tm-edit-product-form"
					action="${pageContext.request.contextPath}/del-employee"
					method="post">
					<button style="width: 100%; background-color: red;" type="submit"
						class="btn btn-primary btn-block text-uppercase deleteCate">OK
						?</button>
					<input type="hidden" name="id" id="id_nv" />
				</form>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal DEL Nhan vien -->
<!-- The Modal UPDATE Nhan vien-->
<div class="modal fade" id="myEditNhanvien">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Update Nhan vien</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row tm-edit-product-row"
					style="justify-content: center;">
					<div class="col-xl-6 col-lg-6 col-md-12">
						
						<form:form action="editemployee" class="tm-edit-product-form"
							method="post" modelAttribute="empedit">
							<div class="row tm-edit-product-row">
								<div class="col-xl-6 col-lg-6 col-md-12">
									<div class="form-group mb-3">
										<label for="name"> Id </label>
										<input id="id_nv" name="id" style="width: 254%;" readonly
											required class="form-control validate" />
										
									</div>
									<div class="form-group mb-3">
										<label for="name">Họ và tên </label>
										<input id="name_nv" name="name" style="width: 254%;"
											type="text" class="form-control validate" required>
									</div>
									<div class="form-group mb-3">
										<label for="name">Số diện thoại </label>
										<input id="sdt_nv" name="sdt" style="width: 254%;" type="text"
											class="form-control validate" required>
									</div>
									<div style="display: flex; margin-left: 78px;">
										<input required type="radio" id="gioitinh_nv_nam" name="gioitinh" value="1">
										<label for="male">NAM</label>
										<br>
										<input required type="radio" id="gioitinh_nv_nu" name="gioitinh" value="0">
										<label for="female">NỮ</label>
										<br>
									</div>
								</div>
								<div class="col-12" style="right: 23px;">
									<button type="submit"
										style="background-color: #ed1c24; width: 130%; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">Lưu</button>
									<input type="hidden" name="id" id="id_nv" />
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal UPdate Nhan vien -->
<!-- ------------------------------------------------------------------------------------------------------------------------------------ -->
<!-- The Modal UPDATE ROLE ADMIN -->
<div class="modal fade" id="myEditRole">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Update ROLE</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row tm-edit-product-row"
					style="justify-content: center;">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<c:url value="/editadmin" var="editadmin" />
						<form action="${ editadmin}" method="POST" modelAttribute="userid"
							class="tm-edit-product-form" class="tm-edit-product-form">
							<div class="row tm-edit-product-row">
								<div class="col-xl-6 col-lg-6 col-md-12">
									<div class="form-group mb-3">
										<label for="name"> Id </label>
										<input  name="users_id" style="width: 254%;"
											readonly required class="form-control validate users_id" />
									</div>
									<div class="form-group mb-3">
										<label for="name">Email </label>
										<input id="users_email" name="users_email"
											style="width: 254%;" type="email" readonly
											class="form-control validate" required>
									</div>
									<div class="form-group mb-3">
										<label for="name">Password </label>
										<input id="users_password" name="users_password"
											style="width: 254%;" type="password"
											class="form-control validate" required>
									</div>
									<div class="form-group mb-3">
										<label for="role">Role</label>
										<input type="number" min="2" max="7" id="role_id" name="role_id" required
											class="form-control validate" />
									</div>
								</div>
								<div class="col-12" style="right: 23px;">
									<button type="submit"
										style="background-color: #ed1c24; width: 130%; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">Lưu</button>
									<input type="hidden" name="users_id" class="users_id" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal UPdate ROLE ADMIN -->
<!--Footer-->
<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
<!-- END Footer-->
<!--DECORATOR FOOTER-->
<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
<!--END DECORATOR FOOTER-->
<%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp"%>
<c:set var="deleted" value="${deleted}" />
<c:if test="${ not empty addNVFail }">
	<script type="text/javascript">
		addNVFail();
	</script>
	<%
		session.removeAttribute("addNVFail");
	%>
</c:if>
<c:if test="${ not empty addNV }">
	<script type="text/javascript">
		addNV();
	</script>
	<%
		session.removeAttribute("addNV");
	%>
</c:if>

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
	 <c:if test="${ not empty emailFail }">
	<script type="text/javascript">
	emailFail();	    
	 </script>
	 <%session.removeAttribute("emailFail");    %> 
	</c:if>
<!-- --------------------------------------------------------------------------------------------------------------------------------- -->
<!-- Xoa du lieu Khach hang -->
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.myTable').on('click', '.removeKH' ,function() {
			var id = $(this).parent().find('#idcus').val();
			console.log(id);
			$('#myDelKhachHang #id_modal_del').val(id);

		});

	});
</script>
<!-- END Xoa du lieu khach hang -->
<!-- UPDATE du lieu Khach hang -->
<script type="text/javascript">
	$(document).ready(function() {

		$('.myTable').on('click', '.editKH' ,function() {
			var id = $(this).parent().find('#idcus').val();
			var name = $(this).parent().find('#namecus').val();
			var sdt = $(this).parent().find('#sdtcus').val();
			var gioitinh = $(this).parent().find('#gioitinhcus').val();
			
			$('#myEditKhachHang #id_modal').val(id);
			$('#myEditKhachHang #name_modal').val(name);
			$('#myEditKhachHang #sdt_modal').val(sdt);
			
			if (gioitinh == "true") $('#gioitinh_modal_KH_nam')[0].checked = true;
			else $('#gioitinh_modal_KH_nu')[0].checked = true;

		});

	});
</script>
<!-- END UPDATE du lieu Khach hang -->
<!-- Xoa du lieu Nhan vien -->
<script type="text/javascript">
	$(document).ready(function() {
		$('.myTable').on('click', '.removeNV' ,function() {
		
			var id = $(this).parent().find('#id_nv').val();

			$('#myDelNhanvien #id_nv').val(id);

		});

	});
</script>
<!-- END Xoa du lieu Nhan vien -->
<!-- UPDATE du lieu Nhan vien-->
<script type="text/javascript">
	$(document).ready(function() {
		$('.myTable').on('click', '.editNV' ,function() {
			var id = $(this).parent().find('#id_nv').val();
			var name = $(this).parent().find('#name_nv').val();
			var sdt = $(this).parent().find('#sdt_nv').val();
			var gioitinh = $(this).parent().find('#gioitinh_nv').val();
			$('#myEditNhanvien #id_nv').val(id);
			$('#myEditNhanvien #name_nv').val(name);
			$('#myEditNhanvien #sdt_nv').val(sdt);
					
			if (gioitinh == "true") $('#gioitinh_nv_nam')[0].checked = true;
			else $('#gioitinh_nv_nu')[0].checked = true;

		});

	});
</script>
<!-- END UPDATE du lieu Nhan vien -->
<!-- UPDATE du lieu ROLE-->
<script type="text/javascript">
	$(document).ready(function() {
		$('.editRole').on('click',function() {
			var users_id = $(this).parent().find('#users_id').val();
			var users_email = $(this).parent().find('#users_email').val();
			var users_password = $(this).parent().find('#users_password').val();
			var role_id = $(this).parent().find('#role_id').val();
			$('#myEditRole .users_id').val(users_id);
			$('#myEditRole #users_email').val(users_email);
			$('#myEditRole #users_password').val(users_password);
			$('#myEditRole #role_id').val(role_id);
			$.ajax({
				url : "${pageContext.request.contextPath}/edit-admin/"+ users_id,
				type : "GET",
				success : function(data) {
					$('#myEditRole .users_id').val(users_id);
					$('#myEditRole #users_email').val(users_email);
					$('#myEditRole #users_password').val(users_password);
					$('#myEditRole #role_id').val(role_id);
				}
			});
		});
	});
</script>
<!-- END UPDATE du lieu ROLE -->
