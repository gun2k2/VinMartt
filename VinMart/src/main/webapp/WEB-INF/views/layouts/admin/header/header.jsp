<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="VinMart.entities.Users"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.phieunhapDao"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<nav class="navbar navbar-expand-lg navbar-absolute navbar-transparent">
	<div class="container-fluid">
		<div class="navbar-wrapper">
			<div class="navbar-toggle d-inline">
				<button type="button" class="navbar-toggler">
					<span class="navbar-toggler-bar bar1"></span>
					<span class="navbar-toggler-bar bar2"></span>
					<span class="navbar-toggler-bar bar3"></span>
				</button>
			</div>
			<a class="navbar-brand" href="javascript:void(0)">Table List</a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navigation" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-bar navbar-kebab"></span>
			<span class="navbar-toggler-bar navbar-kebab"></span>
			<span class="navbar-toggler-bar navbar-kebab"></span>
		</button>
		<div class="collapse navbar-collapse" id="navigation">
			<ul class="navbar-nav ml-auto">
				<li class="dropdown nav-item">
					<div class="hiscart shownoti" style="margin-top: 12px;">
						<a style="background-color: white;"
							href="${pageContext.request.contextPath}/List-Phieu-Nhap"
							class="temcart no">
							<div>
								<i class=" tim-icons icon-bag-16"></i>
								<span class="">
									<%
										ArrayList<Products> phieuNhap = new phieunhapDao().getPhieuNhap();
									float tongcong = 0;
									int sum = 0;
									for (int i = 0; i < phieuNhap.size(); i++) {
										sum += phieuNhap.get(i).getProduct_soLuongMua();
										tongcong += (phieuNhap.get(i).getProduct_price()
										- phieuNhap.get(i).getProduct_price() * phieuNhap.get(i).getProduct_discount() / 100)
										* phieuNhap.get(i).getProduct_soLuongMua();
									%>
									<input type="hidden"
										value="<%=phieuNhap.get(i).getProduct_soLuongMua()%>" />
									<%
										}
									%>
									<%=phieuNhap.size()%>
								</span>
							</div>
						</a>
						<div class="header-cart-detail">
							<div class="header-cart-products" style="display: grid;">
								<%
									if (phieuNhap.size() > 0) {
									for (int i = 0; i < phieuNhap.size(); i++) {
								%>
								<div class="row header-cart-item">
									<div class="col-xs-3 header-cart-item-img">
										<img class="notify-img"
											src="${pageContext.request.contextPath}/assets/images/<%out.print(phieuNhap.get(i).getProduct_image()); %>">
									</div>
									<div class="col-xs-9 header-cart-item-section">
										<div class="row">
											<a title="<%out.print(phieuNhap.get(i).getProduct_name());%>"
												class="col-xs-12 header-cart-item-name">
												<%
													out.print(phieuNhap.get(i).getProduct_name());
												%>
											</a>
										</div>
										<div class="row mt5"
											style="display: flex; justify-content: space-between;">
											<div class="col-xs-4 text-left header-cart-qty"
												style="padding-right: 72px;">
												x<%=phieuNhap.get(i).getProduct_soluongtonkho()%>
											</div>
											<div class="col-xs-8 text-right header-cart-price colormoney">
												<fmt:formatNumber type="number" groupingUsed="true"
													value="<%=(phieuNhap.get(i).getProduct_price()
		- phieuNhap.get(i).getProduct_price() * phieuNhap.get(i).getProduct_discount() / 100)%>" />
												đ
											</div>
											<!-- XOA THEO ID -->
											<form style="float: right; background: transparent;"
												accept-charset="UTF-8"
												action="${pageContext.request.contextPath}/xoa-phieu-nhap/<%=phieuNhap.get(i).getProduct_id() %>"
												method="post" enctype="multidata/form-data">
												<input type="hidden" name="product_id"
													value="<%=phieuNhap.get(i).getProduct_id()%>">
												<input type="hidden" name="product_soluongtonkho"
													value="<%=phieuNhap.get(i).getProduct_soluongtonkho()%>">
												<button type="submit"
													style="background: transparent; border: none;">
													<i class='tim-icons icon-simple-remove'
														style='font-size: 20px; color: red'></i>
												</button>
											</form>
											<!-- END XOA THEO ID -->
										</div>
									</div>
								</div>
								<%
									}
								%>
								<%
									} else {
								%>
								<h1 class="nocart"
									style="font-size: 14px; color: rgb(39, 41, 61);">
									<b>KHÔNG CÓ SẢN PHẨM TRONG PHIẾU NHẬP</b>
								</h1>
								<%
									}
								%>
							</div>
							<div class="header-cart-total-row"
								style="justify-content: center;">
								<div class="header-cart-total-text">
									Có tổng số
									<%=phieuNhap.size()%>
									sản phẩm
								</div>
							</div>
							<%
								if (phieuNhap.size() > 0) {
							%>
							<form accept-charset="UTF-8"
								action="${pageContext.request.contextPath}/creat-phieu-nhap"
								method="post" enctype="multidata/form-data">
								<%
									for (int i = 0; i < phieuNhap.size(); i++) {
								%>
								<input hidden="true" name="product_id[]"
									value="<%out.print(phieuNhap.get(i).getProduct_id());%>">
								<input hidden="true" name="Soluongnhap[]"
									value="<%out.print(phieuNhap.get(i).getProduct_soluongtonkho());%>">
								<input hidden="true" name="Dongianhap[]"
									value="<%out.print(phieuNhap.get(i).getProduct_price());%>">
								<%
									}
								%>
								<button type="submit" style="margin-right: 54px;" color="white"
									class="header-cart-go-to-checkout">Hoàn thành phiếu
									nhập</button>
							</form>
							<%
								}
							%>
						</div>
					</div>
				</li>
				<li class="search-bar input-group">
					<button class="btn btn-link" id="search-button" data-toggle="modal"
						data-target="#searchModal">
						<i class="tim-icons icon-zoom-split"></i>
						<span class="d-lg-none d-md-block">Search</span>
					</button>
				</li>
				<li class="dropdown nav-item">
					<a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
						<div class="photo">
							<img
								src="${pageContext.request.contextPath}/assets/images/anime3.png"
								alt="Profile Photo">
						</div>
						<b class="caret d-none d-lg-block d-xl-block"></b>
						<p class="d-lg-none">Log out</p>
					</a>
					<ul class="dropdown-menu dropdown-navbar">
						<li class="nav-link">
							<a href="javascript:void(0)" class="nav-item dropdown-item">Profile</a>
						</li>
						<li class="nav-link">
							<a href="javascript:void(0)" class="nav-item dropdown-item">Settings</a>
						</li>
						<li class="dropdown-divider"></li>
						<li class="nav-link">
							<a href="${pageContext.request.contextPath}/logout" class="nav-item dropdown-item">Log
								out</a>
						</li>
					</ul>
				</li>
				<li class="separator d-lg-none"></li>
			</ul>
		</div>
	</div>
</nav>
<div class="modal modal-search fade" id="searchModal" tabindex="-1"
	role="dialog" aria-labelledby="searchModal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<input type="text" class="form-control" id="inlineFormInputGroup"
					placeholder="SEARCH">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<i class="tim-icons icon-simple-remove"></i>
				</button>
			</div>
		</div>
	</div>
</div>