<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- NCC -->
<div class="modal fade" id="addncc">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Thêm nhà cung cấp</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row tm-edit-product-row"
					style="justify-content: center;">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<form action="ncc-add" class="tm-edit-product-form" method="post">
							<div class="form-group mb-3">
								<label for="name">Tên nhà cung cấp</label>
								<input name="TenNCC" type="text" class="form-control validate"
									required>
							</div>
							<div class="form-group mb-3">
								<label for="name">Địa chỉ nhà cung cấp </label>
								<input name="DiaChi" type="text" class="form-control validate"
									required>
							</div>
							<div class="form-group mb-3">
								<label for="name">Email nhà cung cấp </label>
								<input name="Email" type="email" class="form-control validate"
									required>
							</div>
							<div class="form-group mb-3">
								<label for="name">SĐT nhà cung cấp</label>
								<input name="Sdt" type="number" class="form-control validate"
									required>
							</div>
							<div class="col-12">
								<button type="submit"
									style="background-color: #ed1c24; border-color: #ed1c24;"
									class="btn btn-primary btn-block text-uppercase">Thêm
									ngay</button>
							</div>
						</form>
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
<!-- END NCC -->
<!-- PRODUCT OLD -->
<div class="modal fade" id="product-old">
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Thêm số lượng sản phẩm</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div class="row tm-edit-product-row"
					style="justify-content: center;">
					<div class="col-xl-6 col-lg-6 col-md-12">
						<form action="add-productOld" method="post">
							<label for="proDuct">Sản phẩm:</label>
							<input required list="dsProduct" name="product_id"
								style="border-radius: 13px; width: 271px; height: 37px;">
							<datalist id="dsProduct">
								<c:forEach var="p" items="${pro}">
									<option value="${p.product_id }">${p.product_name }</option>
								</c:forEach>
							</datalist>
							<label for="stock">Số lượng:</label>
							<input required name="product_soluongtonkho" type="number"
								min="1" class="form-control validate" style="width: 270px;">
							<div class="row" style=" width: 100%;margin-left: 32px;">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="expire_date">Ngày sản xuất *</label>
										<input style="width: 174px; margin-left: -80px;"
													min="2020-01-01" max="${nsx}" required
													pattern="\d{4}-\d{2}-\d{2}" name="product_nsx" type="date"
													class="form-control validate hasDatepicker"
													data-large-mode="true">
										<span class="validity"></span>
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="stock">Hạn sử dụng *</label>
											<input style="width: 174px;" required
													pattern="\d{4}-\d{2}-\d{2}" min="${hsd }" max="2100-01-01"
													name="product_hsd" type="date"
													class="form-control validate">
										<span class="validity"></span>
								</div>
							</div>
							<button
								style="background-color: #ed1c24; border-color: #ed1c24; margin-top: 12px; margin-left: 20px;"
								type="submit" class="btn btn-primary btn-block text-uppercase">Thêm
								ngay</button>
						</form>
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
<!-- END PRODUCT OLD -->
<!-- PRODUCT new -->
<div class="modal fade" id="product-new">
	<div class="modal-dialog">
		<div class="modal-content"
			style="WIDTH: 204%; margin-left: -240px; height: 928px; margin-top: 8px; padding-top: -21px;">
			<!-- Modal Header -->
			<!-- Modal body -->
			<div class="row">
				<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto"
					style="padding-top: 100px;">
					<div class="tm-bg-primary-dark tm-block tm-block-h-auto"
						style="padding-top: 7px; margin-top: -56px;">
						<div class="row">
							<div class="col-12">
								<h2 class="tm-block-title d-inline-block">Thêm sản phẩm mới</h2>
							</div>
						</div>
						<div class="row tm-edit-product-row">
							<form action="${pageContext.request.contextPath}/List-Product"
								class="tm-edit-product-form" method="post"
								enctype="multipart/form-data">
								<input value="${ LoginInfo.users_id}" type="hidden"
									name="nhanvien_id">
								<input name="product_id" value="${newId}" type="hidden"
									data-large-mode="true">
								<div class="col-xl-6 col-lg-6 col-md-12  ">
									<div class="form-group mb-3">
										<label for="name">Tên sản phẩm *</label>
										<input id="product_name" placeholder="Name..."
											name="product_name" type="text" class="form-control validate"
											required>
									</div>
									<div class="row">
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="expire_date">Giá *</label>
											<input name="product_price" min="1" type="number"
												class="form-control validate hasDatepicker"
												data-large-mode="true" required>
										</div>
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="stock">Giảm giá (%)</label>
											<input name="product_discount" max="100" min="0"
												type="number" class="form-control validate">
										</div>
									</div>
									<div class="form-group mb-3">
										<label for="category">Danh mục *</label>
										<select required name="product_danhmuc"
											class="custom-select tm-select-accounts" id="category">
											<option  selected>Select category</option>
											<c:forEach items="${listCate}" var="cate">
												<c:if test="${ cate.p_id ==0}">
													<c:forEach items="${listCate}" var="cate_con">
														<c:if test="${ cate_con.p_id == cate.category_id }">
															<option  value="${cate_con.category_id}">${ cate_con.category_name}</option>
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="form-group mb-3">
										<label for="category">Nhà cung cấp *</label>
										<select required name="MaNCC"
											class="custom-select tm-select-accounts">
											<option selected>Select supplier</option>
											<c:forEach var="ncc" items="${listNcc}">
												<option value="${ncc.getMaNCC() }">${ncc.getTenNCC() }</option>
											</c:forEach>
										</select>
									</div>
									<div class="row">
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="expire_date">Thương hiệu *</label>
											<input name="product_thuonghieu" type="text"
												class="form-control validate hasDatepicker"
												data-large-mode="true" required>
										</div>
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="stock">Nơi sản xuất *</label>
											<input name="product_sanxuat" type="text"
												class="form-control validate" required>
										</div>
									</div>
									<div class="row-hight"
										style="display: inline-flex; margin-right: -415px;">
										<div class="row" style="margin-right: 0px;">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Thành phần *</label>
												<input name="product_thanhphan" type="text"
													class="form-control validate hasDatepicker"
													data-large-mode="true" required>
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Nồng độ cồn</label>
												<input name="product_nongdocon" type="text"
													class="form-control validate">
											</div>
										</div>
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Lượng ga</label>
												<input name="product_luongga" type="text"
													class="form-control validate hasDatepicker"
													data-large-mode="true">
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Lượng đường</label>
												<input name="product_luongduong" type="text"
													class="form-control validate">
											</div>
										</div>
									</div>
									<div class="row-a"
										style="display: inline-flex; margin-right: -415px;">
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Thể tích (ml)*</label>
												<input name="product_thetich" type="text"
													class="form-control validate hasDatepicker"
													data-large-mode="true" required>
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Bảo quản *</label>
												<input name="product_baoquan" type="text"
													class="form-control validate" required>
											</div>
										</div>
										<div class="form-group mb-3" style="margin-left: 18px;">
											<label for="description">Mô tả *</label>
											<textarea name="product_content"
												class="form-control validate" rows="3"
												style="height: 50px; width: 398px;" required></textarea>
										</div>
									</div>
									<div class="row-a"
										style="display: inline-flex; margin-right: -415px;">
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Ngày sản xuất *</label>
												<input style="width: 174px; margin-left: -80px;"
													min="2020-01-01" max="${nsx}" required
													pattern="\d{4}-\d{2}-\d{2}" name="product_nsx" type="date"
													class="form-control validate hasDatepicker"
													data-large-mode="true">
												<span class="validity"></span>
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Hạn sử dụng *</label>
												<input style="width: 174px;" required
													pattern="\d{4}-\d{2}-\d{2}" min="${hsd }" max="2100-01-01"
													name="product_hsd" type="date"
													class="form-control validate">
												<span class="validity"></span>
											</div>
										</div>
										<div class="form-group mb-3" style="margin-left: 113px;">
											<label for="description">Hướng dẫn sử dụng *</label>
											<textarea name="product_sudung" class="form-control validate"
												rows="3" style="height: 50px; width: 300px;" required></textarea>
										</div>
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="stock">Số lượng *</label>
											<input required name="product_soluongtonkho" min="1"
												type="number" class="form-control validate"
												style="width: 270px;">
										</div>
									</div>
									<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4"
										style="left: 9px; padding-top: 32px; margin-right: -400px !important; TOP: -748px;">
										<div class="tm-product-img-dummy mx-auto">
											<i class="fas fa-cloud-upload-alt tm-upload-icon"
												onclick="document.getElementById('fileInput_add').click();"></i>
										</div>
										<div class="custom-file mt-3 mb-3"
											style="padding-left: -73px; left: -185px; top: 59px;">
											<input id="fileInput_add" type="file" name="image"
												style="display: none;">
											<input type="hidden" name="product_image" />
											<input style="width: 350px;" type="button"
												name="product_image_btn"
												class="btn btn-primary btn-block mx-auto"
												value="UPLOAD PRODUCT IMAGE"
												onclick="document.getElementById('fileInput_add').click();">
										</div>
									</div>
								</div>
								<div class="col-12">
									<input type="hidden" name="action" value="insert">
									<button type="submit"
										style="margin-top: -120px; background-color: #ed1c24; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">THÊM
										NGAY</button>
								</div>
							</form>
						</div>
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
<!-- END PRODUCT new -->
<!--EDIT PRODUCT  -->
<div class="modal fade" id="product_update">
	<div class="modal-dialog">
		<div class="modal-content"
			style="WIDTH: 204%; margin-left: -240px; height: 928px; margin-top: 8px; padding-top: -21px;">
			<!-- Modal Header -->
			<!-- Modal body -->
			<div class="row">
				<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto"
					style="padding-top: 100px;">
					<div class="tm-bg-primary-dark tm-block tm-block-h-auto"
						style="padding-top: 7px; margin-top: -56px;">
						<div class="row">
							<div class="col-12">
								<h2 class="tm-block-title d-inline-block">Chỉnh sửa sản
									phẩm</h2>
							</div>
						</div>
						<div class="row tm-edit-product-row">
							<form action="${pageContext.request.contextPath}/List-Product"
								class="tm-edit-product-form" method="post"
								enctype="multipart/form-data">
								<input value="${ LoginInfo.users_id}" type="hidden"
									name="nhanvien_id">
								<div class="col-xl-6 col-lg-6 col-md-12  ">
									<input type="hidden" name="product_view"
										id="product_view_modal" value="${pros.product_view}" />
									<input type="hidden" name="product_purchased"
										id="product_purchased_modal" value="${pros.product_purchased}" />
									<div class="form-group mb-3">
										<label for="name">Tên Sản Phẩm *</label>
										<input id="product_name_modal" placeholder="Name..."
											name="product_name" type="text" class="form-control validate"
											required />
									</div>
									<div class="row">
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="expire_date">Giá *</label>
											<input id="product_price_modal" name="product_price" min="1"
												type="number" class="form-control validate hasDatepicker"
												data-large-mode="true" required />
										</div>
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="stock">Giảm giá </label>
											<input id="product_discount_modal" name="product_discount"
												max="100" min="0" type="number"
												class="form-control validate" />
										</div>
									</div>
									<div class="form-group mb-3">
										<label for="category">Danh Mục *</label>
										<select required name="product_danhmuc"
											class="custom-select tm-select-accounts"
											id="product_danhmuc_modal">
											<option selected>Chọn Danh Mục</option>
											<c:forEach items="${listCate}" var="cate">
												<c:if test="${ cate.p_id ==0}">
													<c:forEach items="${listCate}" var="cate_con">
														<c:if test="${ cate_con.p_id == cate.category_id }">
															<option value="${cate_con.category_id}">${ cate_con.category_name}</option>
														</c:if>
													</c:forEach>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="form-group mb-3">
										<label for="category">Nhà cung cấp *</label>
										<select required name="MaNCC" id="MaNCC_modal"
											class="custom-select tm-select-accounts">
											<option selected>Select supplier</option>
											<c:forEach var="ncc" items="${listNcc}">
												<option value="${ncc.getMaNCC() }">${ncc.getTenNCC() }</option>
											</c:forEach>
										</select>
									</div>
									<div class="row">
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="expire_date">Thương Hiệu *</label>
											<input id="product_thuonghieu_modal"
												name="product_thuonghieu" type="text"
												class="form-control validate hasDatepicker"
												data-large-mode="true" required />
										</div>
										<div class="form-group mb-3 col-xs-12 col-sm-6">
											<label for="stock">Nhà sản xuất *</label>
											<input id="product_sanxuat_modal" name="product_sanxuat"
												type="text" class="form-control validate" required />
										</div>
									</div>
									<div class="row-hight"
										style="display: inline-flex; margin-right: -415px;">
										<div class="row" style="margin-right: 0px;">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Thành phần *</label>
												<input id="product_thanhphan_modal" name="product_thanhphan"
													type="text" class="form-control validate hasDatepicker"
													data-large-mode="true" required>
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Nồng độ cồn</label>
												<input id="product_nongdocon_modal" name="product_nongdocon"
													type="text" class="form-control validate">
											</div>
										</div>
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Nồng độ Ga</label>
												<input id="product_luongga_modal" name="product_luongga"
													type="text" class="form-control validate hasDatepicker"
													data-large-mode="true">
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Lượng đường </label>
												<input name="product_luongduong"
													id="product_luongduong_modal" type="text"
													class="form-control validate">
											</div>
										</div>
									</div>
									<div class="row-a"
										style="display: inline-flex; margin-right: -415px;">
										<div class="row">
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="expire_date">Thể tích thực *</label>
												<input id="product_thetich_modal" name="product_thetich"
													type="number" min=0
													class="form-control validate hasDatepicker"
													data-large-mode="true" required>
											</div>
											<div class="form-group mb-3 col-xs-12 col-sm-6">
												<label for="stock">Bảo quản *</label>
												<input id="product_baoquan_modal" name="product_baoquan"
													type="text" class="form-control validate">
											</div>
										</div>
										<div class="form-group mb-3" style="margin-left: 18px;">
											<label for="description">Mô tả *</label>
											<textarea id="product_content_modal" name="product_content"
												class="form-control validate" rows="3" required
												style="height: 50px; width: 398px;"></textarea>
										</div>
									</div>
							
									<!-- HÌNH ẢNH -->
									<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4"
										style="left: 9px; padding-top: 32px; margin-right: -400px !important; TOP: -748px;">
										<div class="tm-product-img-dummy mx-auto">
											<i class="fas fa-cloud-upload-alt tm-upload-icon"
												onclick="document.getElementById('fileInput_modal').click();"></i>
										</div>
										<div class="custom-file mt-3 mb-3"
											style="padding-left: -73px; left: -185px; top: 59px;">
											<input id="fileInput_modal" type="file" name="image"
												style="display: none;">
											<input type="hidden" name="product_image"
												id="product_image_modal">
											<input style="width: 350px;" id="product_image_name_modal"
												type="button" class="btn btn-primary btn-block mx-auto"
												value="UPLOAD PRODUCT IMAGE" name='product_image_btn'
												onclick="document.getElementById('fileInput_modal').click();">
										</div>
									</div>
								</div>
								<div class="col-12">
									<input type="hidden" name="action" value="update">
									<button type="submit"
										style="margin-top: -120px; background-color: #ed1c24; border-color: #ed1c24;"
										class="btn btn-primary btn-block text-uppercase">Cập
										Nhập Sản Phẩm</button>
									<input type="hidden" name="product_id" id="product_id_modal" />
								</div>
							</form>
						</div>
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
<!-- END EDIT PRODUCT  -->
<!-- The Modal DEL-->
<div class="modal fade" id="myModaldel">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Xóa sản phẩm</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body" id="title_product_del"></div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<form action="del-product/" method="post" id="url_product_del"
					class="tm-edit-product-form">
					<button style="width: 100%; background-color: red;" type="submit"
						class="btn btn-primary btn-block text-uppercase deleteCate"
						id="btnDel">Xóa ngay</button>
					<!-- <input type="hidden" name="product_id" id="product_id_del" /> -->
				</form>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal DEL -->
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
<%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
<!-- END FOOTER -->
<!-- THÔNG BÁO THÊM/SỬA/XOÁ -->
<%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp"%>
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
<!-- thaotacthanhcong -->
<c:if test="${ not empty thaotacSuccess }">
	<script type="text/javascript">
	thaotacSuccess();
	</script>
	<%
		session.removeAttribute("thaotacSuccess");
	%>
</c:if>
<!-- thaotacthatbai -->
<c:if test="${ not empty thaotacFail }">
	<script type="text/javascript">
	thaotacFail();
	</script>
	<%
		session.removeAttribute("thaotacFail");
	%>
</c:if>
<!-- DELETE SCRIPT -->
<script type="text/javascript">
		$('#dataTable').on('click', '.delete', function(){	
			let product_id = $(this).parent().find("input[id='product_id']").val();
			let product_name = $(this).parent().find("input[id='product_name']").val();			
			
			console.log(product_id)
			/* TRUYỀN THÔNG TIN SẢN PHẨM VÀO MODAL DEL */
			//TITLE MODAL DEL
			let modal_title_del = $('#title_product_del');
			modal_title_del[0].innerText = "Bạn có chắc chắn muốn xoá [" + product_name + "] ?";
			
			//VALUE MODAL DEL
			//let modal_value_del = $('#product_id_del');
			//modal_value_del.val(product_id)

			//URL MODAL DEL
			let url_product_del = $('#url_product_del');
			url_product_del[0].action = "del-product/"+ product_id
			
		})
	</script>
<!-- EDIT DINH CAO -->
<script>
		$("input[type='file']").on('click', function(){
			let product_image_modal = $(this).parent().find("input[name='product_image']");
			let product_image_btn_modal = $(this).parent().find("input[name='product_image_btn']");
			$(this).on("change", ()=>{
				let img_name = $(this).val().replace(/^.*[\\\/]/,'');
				product_image_modal.val(img_name);
				product_image_btn_modal.val(img_name);
				console.log(img_name);
				
			})
		})
		
		$('#dataTable').on('click', '.edit', function(){	
			console.log('click datatable')
			let product_id = $(this).parent().find("input[id='product_id']").val();
			let product_name = $(this).parent().find("input[id='product_name']").val();	
			let product_price = $(this).parent().find("input[id='product_price']")[0].value;
			let product_discount = $(this).parent().find("input[id='product_discount']")[0].value;
			let product_danhmuc = $(this).parent().find("input[id='product_danhmuc']")[0].value;
			
			let product_image = $(this).parent().find("input[id='product_image']")[0].value;
			
			
			let product_view = $(this).parent().find("input[id='product_view']")[0].value;
			let product_purchased = $(this).parent().find("input[id='product_purchased']")[0].value;
			let product_trangthai= $(this).parent().find("input[id='product_trangthai']")[0].value;
			let MaNCC = $(this).parent().find("input[id='MaNCC']")[0].value;
			let product_thuonghieu = $(this).parent().find("input[id='product_thuonghieu']")[0].value;
			
			let product_sanxuat = $(this).parent().find("input[id='product_sanxuat']")[0].value;
			let product_thanhphan = $(this).parent().find("input[id='product_thanhphan']")[0].value;
			let product_luongga = $(this).parent().find("input[id='product_luongga']")[0].value;
			let product_luongduong = $(this).parent().find("input[id='product_luongduong']")[0].value;
			let product_thetich = $(this).parent().find("input[id='product_thetich']")[0].value;
			
			let product_baoquan = $(this).parent().find("input[id='product_baoquan']")[0].value;
			let product_sudung = $(this).parent().find("input[id='product_sudung']")[0].value;
			
			
			let product_content = $(this).parent().find("input[id='product_content']")[0].value;
			/* .
			. Tự xử tiếp
			. */
			
			
			//MODAL
			$('#product_id_modal').val(product_id);
			$('#product_name_modal').val(product_name);
			$('#product_price_modal').val(product_price);
			$('#product_discount_modal').val(product_discount);
			$('#product_danhmuc_modal').val(product_danhmuc);
			
			$('#product_image_modal').val(product_image);
			$('#product_image_name_modal').val(product_image);
			
			$('#product_view_modal').val(product_view);
			$('#product_purchased_modal').val(product_purchased);
			$('#product_trangthai_modal').val(product_trangthai);
			$('#MaNCC_modal').val(MaNCC);
			$('#product_thuonghieu_modal').val(product_thuonghieu);
			
			$('#product_sanxuat_modal').val(product_sanxuat);
			$('#product_thanhphan_modal').val(product_thanhphan);
			$('#product_luongga_modal').val(product_luongga);
			$('#product_luongduong_modal').val(product_luongduong);
			$('#product_thetich_modal').val(product_thetich);
			
			$('#product_baoquan_modal').val(product_baoquan);
			$('#product_sudung_modal').val(product_sudung);
			
			
			$('#product_content_modal').val(product_content);				
			
		})		
	</script>
<!-- END EDIT DINH CAO -->