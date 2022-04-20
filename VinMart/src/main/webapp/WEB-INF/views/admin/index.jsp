
<%
	Users check = (Users) session.getAttribute("LoginInfo");
if (check == null) {
	response.sendRedirect("trang-chu");
} else {
%>
<%
	Users user = (Users) session.getAttribute("LoginInfo");
if (user.getRole_id() == 3) {
	System.out.print("user: " + user.getRole_id());
	response.sendRedirect("trang-chu");

} else {

}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/taglib/taglib.jsp"%>
<!DOCTYPE html>
<html lang="vi">
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

<!-- DataTable -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/r-2.2.7/datatables.min.css"/>
 


<!-- Head -->
<%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp"%>
<!-- End Head -->
<style type="text/css">
<%@include file="/WEB-INF/views/layouts/customer/css/toast.css"%>
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
			<%
				ConnectionToDB con = new ConnectionToDB();
			ResultSet rs = null;
			int tongtien = 0;

			String ngaybatdau = null;
			String ngayketthuc = null;

			String type = request.getParameter("type");
			if (request.getParameter("ngaybatdau") != null) {
				ngaybatdau = request.getParameter("ngaybatdau");
				ngayketthuc = request.getParameter("ngayketthuc");

			}
			%>
			<div class="content">
				<div class="row">
					<div class="col-12">
						<div class="card card-chart">
							<div class="card-header ">
								<div class="row">
									<div class="col-sm-6 text-left">
										<h5 class="card-category">Total Shipments</h5>
										<form method="get" style="display: flex; width: 847px;">
											<input style="width: 164px;"
												class="btn btn-sm btn-primary btn-simple active" type=date
												name="ngaybatdau" max="<%=LocalDate.now()%>"
												value="<%=ngaybatdau%>" required>
											<input style="width: 164px;"
												class="btn btn-sm btn-primary btn-simple active" type=date
												name="ngayketthuc" value="<%=ngayketthuc%>" required>
											<select class="btn btn-sm btn-primary btn-simple active"
												name="type">
												<%
													if (type != null) {
												%>
												<%
													if (type.equals("donhang")) {
												%>
												<option class="btn btn-sm btn-primary btn-simple active "
													value="donhang">Đơn hàng</option>
												<option class="btn btn-sm btn-primary btn-simple active "
													value="product_id">Mã Sản Phẩm</option>
												<%
													} else {
												%>
												<option class="btn btn-sm btn-primary btn-simple active "
													value="product_id">Mã Sản Phẩm</option>
												<option class="btn btn-sm btn-primary btn-simple active "
													value="donhang">Đơn hàng</option>
												<%
													}
												} else {
												%>
												<option class="btn btn-sm btn-primary btn-simple active "
													value="donhang">Đơn hàng</option>
												<option class="btn btn-sm btn-primary btn-simple active "
													value="product_id">Mã Sản Phẩm</option>
												<%
													}
												%>
											</select>
											<input style="display: flex;"
												class="btn btn-sm btn-primary btn-simple active "
												type=submit value="Thống kê">
											<input type="button"
												class="btn btn-sm btn-primary btn-simple active"
												data-toggle="modal" data-target="#myModalbieudo1"
												value="Biểu đồ tròn">
											<input type="button"
												class="btn btn-sm btn-primary btn-simple active"
												data-toggle="modal" data-target="#myModalbieudo2"
												value="Biểu đồ Khu vực">
										</form>
										<h2 class="card-title">Performance</h2>
									</div>
									<div class="col-sm-6"
										style="max-width: 51% !important; flex: none;">
										<div class="btn-group btn-group-toggle " data-toggle="buttons">
											<label class="btn btn-sm btn-primary btn-simple active"
												id="0">
												<input type="radio" name="options" checked>
												<span
													class="d-none d-sm-block d-md-block d-lg-block d-xl-block">Accounts</span>
												<span class="d-block d-sm-none">
													<i class="tim-icons icon-single-02"></i>
												</span>
											</label>
											<label class="btn btn-sm btn-primary btn-simple" id="1">
												<input type="radio" class="d-none d-sm-none" name="options">
												<span
													class="d-none d-sm-block d-md-block d-lg-block d-xl-block">Purchases</span>
												<span class="d-block d-sm-none">
													<i class="tim-icons icon-gift-2"></i>
												</span>
											</label>
											<label class="btn btn-sm btn-primary btn-simple" id="2">
												<input type="radio" class="d-none" name="options">
												<span
													class="d-none d-sm-block d-md-block d-lg-block d-xl-block">Sessions</span>
												<span class="d-block d-sm-none">
													<i class="tim-icons icon-tap-02"></i>
												</span>
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body ">
								<div class="chart-area ">
									<canvas id="CountryChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">10 Sản phẩm được xem nhiều nhất</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-heart-2 text-primary"></i>
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartLinePurple"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">Daily Sales</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-delivery-fast text-info"></i>
									3,500€
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartBig1"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-category">Completed Tasks</h5>
								<h3 class="card-title">
									<i class="tim-icons icon-send text-success"></i>
									12,100K
								</h3>
							</div>
							<div class="card-body">
								<div class="chart-area">
									<canvas id="chartLineGreen"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="card ">
							<div class="card-header row"
								style="justify-content: space-around;">
								<h4 class="card-title">Thống Kê Table</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<!--Table-->
									<%
										if (ngaybatdau != null && ngayketthuc != null && type != null) {
									%>
									<table class="table tablesorter " id="thongkeTable">
										<%
											if (type.equals("donhang")) {
											ResultSet donhang = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau
											+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");
										%>
										<thead class=" text-primary">
											<tr>
												<th class="datatable-nosort">Mã đơn hàng</th>
												<th>Người mua</th>
												<th>Ngày mua</th>
												<th class="text-center">Thành tiền</th>
											</tr>
										</thead>
										<tbody>
										<%
											while (donhang.next()) {
											rs = con.selectData("select top (1) * from ct_donhang where donhang_id = " + donhang.getInt("donhang_id"));
											rs.next();
											int thanhtien = rs.getInt("thanhtien");
											ResultSet nguoimua = con
											.selectData("select  * from khachhang where khachhang_id = " + donhang.getInt("nguoimua_id"));
											ResultSet nguoimua_nv = con
											.selectData("select  * from nhanvien where nhanvien_id = " + donhang.getInt("nguoimua_id"));
										%>
										
											<tr>
												<th>
													#ĐH<%=rs.getInt("donhang_id")%></th>
												<th>
													<%
														if (nguoimua.next()) {
													%>
													<%=nguoimua.getString("khachhang_name")%>
													<%
														}
													%>
													<%
														if (nguoimua_nv.next()) {
													%>
													<%=nguoimua_nv.getString("nhanvien_name")%>
													<%
														}
													%>
												</th>
												<th><%=donhang.getString("donhang_ngaydat")%></th>
												<th class="text-center">
													<fmt:formatNumber type="number" groupingUsed="true"
														value="<%=thanhtien%>" />
												</th>
											</tr>
										
										<%}%>
										</tbody>
										<%
										} else {
										ResultSet donhang = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau + "' and '"
												+ ngayketthuc + "' and donhang_trangthai = 4");
										%>
										<thead>
											<tr>
												<th class="datatable-nosort">Mã sản phẩm</th>
												<th>Sản phẩm</th>
												<th>Đã bán</th>
												<th>Doanh thu</th>
											</tr>
										</thead>
										<tbody>
										<%
											while (donhang.next()) {
											ResultSet ct_dh = con.selectData("select * from ct_donhang where donhang_id =" + donhang.getInt("donhang_id"));
											while (ct_dh.next()) {
												ResultSet sanpham = con.selectData("select * from product where product_id =" + ct_dh.getInt("product_id"));

												int soluong = ct_dh.getInt("soLuong");

												while (sanpham.next()) {
											tongtien += (sanpham.getInt(3) - sanpham.getInt(3) * sanpham.getInt(4) / 100) * soluong;
										%>
										
											<tr>
												<th>
													#<%=sanpham.getInt("product_id")%></th>
												<th><%=sanpham.getString("product_name")%></th>
												<th><%=soluong%></th>
												<th>
													<fmt:formatNumber type="number" groupingUsed="true"
														value="<%=(sanpham.getInt(3) - sanpham.getInt(3) * sanpham.getInt(4) / 100) * soluong%>" />
												</th>
											</tr>
										
										<%}
										}
										}
										%>
										</tbody>
										<tfoot>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<th>
													Tổng tiền:
													<fmt:formatNumber type="number" groupingUsed="true"
														value="<%=tongtien%>" />
												</th>
											</tr>
										</tfoot>
										<%
											}
										%>
										
									</table>
									<%
										}
									%>
									<!-- End Table-->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bieu do  -->
	<!-- Modal -->
	<div class="modal fade" id="myModalbieudo1" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">BIỂU ĐỒ DOANH THU SẢN PHẨM THEO ĐƠN
						HÀNG</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="bieudo/bieudotron.jsp"></jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end bieu do -->
	<!-- Modal 2-->
	<div class="modal fade" id="myModalbieudo2" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">BIỂU ĐỒ DOANH THU SẢN PHẨM THEO ĐƠN
						HÀNG</h4>
				</div>
				<div class="modal-body">
					<jsp:include page="bieudo/bieudokhuvuc.jsp"></jsp:include>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end bieu do 2-->
	<%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp"%>
	<c:if test="${ not empty role }">
		<script type="text/javascript">
		role();	    
		 </script>
		<%
			session.removeAttribute("role");
		%>
	</c:if>
	<!--   Core JS Files   -->
	<script
		src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<!-- Place this tag in your head or just before your close body tag. -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB2Yno10-YTnLjjn_Vtk0V8cdcY5lC4plU"></script>
	<!-- Chart JS -->
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
	<script
		src="${pageContext.request.contextPath}/assets/js/black-dashboard.min.js?v=1.0.0"></script>
	<!-- Black Dashboard DEMO methods, don't include it in your project! -->
	<script type="text/javascript">
	  type = ['primary', 'info', 'success', 'warning', 'danger'];
	
	  demo = {
	    initPickColor: function() {
	      $('.pick-class-label').click(function() {
	        var new_class = $(this).attr('new-class');
	        var old_class = $('#display-buttons').attr('data-class');
	        var display_div = $('#display-buttons');
	        if (display_div.length) {
	          var display_buttons = display_div.find('.btn');
	          display_buttons.removeClass(old_class);
	          display_buttons.addClass(new_class);
	          display_div.attr('data-class', new_class);
	        }
	      });
	    },
	
	    initDocChart: function() {
	      chartColor = "#FFFFFF";
	
	      // General configuration for the charts with Line gradientStroke
	      gradientChartOptionsConfiguration = {
	        maintainAspectRatio: false,
	        legend: {
	          display: false
	        },
	        tooltips: {
	          bodySpacing: 4,
	          mode: "nearest",
	          intersect: 0,
	          position: "nearest",
	          xPadding: 10,
	          yPadding: 10,
	          caretPadding: 10
	        },
	        responsive: true,
	        scales: {
	          yAxes: [{
	            display: 0,
	            gridLines: 0,
	            ticks: {
	              display: false
	            },
	            gridLines: {
	              zeroLineColor: "transparent",
	              drawTicks: false,
	              display: false,
	              drawBorder: false
	            }
	          }],
	          xAxes: [{
	            display: 0,
	            gridLines: 0,
	            ticks: {
	              display: false
	            },
	            gridLines: {
	              zeroLineColor: "transparent",
	              drawTicks: false,
	              display: false,
	              drawBorder: false
	            }
	          }]
	        },
	        layout: {
	          padding: {
	            left: 0,
	            right: 0,
	            top: 15,
	            bottom: 15
	          }
	        }
	      };
	
	      ctx = document.getElementById('lineChartExample').getContext("2d");
	
	      gradientStroke = ctx.createLinearGradient(500, 0, 100, 0);
	      gradientStroke.addColorStop(0, '#80b6f4');
	      gradientStroke.addColorStop(1, chartColor);
	
	      gradientFill = ctx.createLinearGradient(0, 170, 0, 50);
	      gradientFill.addColorStop(0, "rgba(128, 182, 244, 0)");
	      gradientFill.addColorStop(1, "rgba(249, 99, 59, 0.40)");
	
	      myChart = new Chart(ctx, {
	        type: 'line',
	        responsive: true,
	        data: {
	          labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
	          datasets: [{
	            label: "Active Users",
	            borderColor: "#f96332",
	            pointBorderColor: "#FFF",
	            pointBackgroundColor: "#f96332",
	            pointBorderWidth: 2,
	            pointHoverRadius: 4,
	            pointHoverBorderWidth: 1,
	            pointRadius: 4,
	            fill: true,
	            backgroundColor: gradientFill,
	            borderWidth: 2,
	            data: [542, 480, 430, 550, 530, 453, 380, 434, 568, 610, 700, 630]
	          }]
	        },
	        options: gradientChartOptionsConfiguration
	      });
	    },
	
	    initDashboardPageCharts: function() {
	
	      gradientChartOptionsConfigurationWithTooltipBlue = {
	        maintainAspectRatio: false,
	        legend: {
	          display: false
	        },
	
	        tooltips: {
	          backgroundColor: '#f5f5f5',
	          titleFontColor: '#333',
	          bodyFontColor: '#666',
	          bodySpacing: 4,
	          xPadding: 12,
	          mode: "nearest",
	          intersect: 0,
	          position: "nearest"
	        },
	        responsive: true,
	        scales: {
	          yAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(29,140,248,0.0)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              suggestedMin: 60,
	              suggestedMax: 125,
	              padding: 20,
	              fontColor: "#2380f7"
	            }
	          }],
	
	          xAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(29,140,248,0.1)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              padding: 20,
	              fontColor: "#2380f7"
	            }
	          }]
	        }
	      };
	
	      gradientChartOptionsConfigurationWithTooltipPurple = {
	        maintainAspectRatio: false,
	        legend: {
	          display: false
	        },
	
	        tooltips: {
	          backgroundColor: '#f5f5f5',
	          titleFontColor: '#333',
	          bodyFontColor: '#666',
	          bodySpacing: 4,
	          xPadding: 12,
	          mode: "nearest",
	          intersect: 0,
	          position: "nearest"
	        },
	        responsive: true,
	        scales: {
	          yAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(29,140,248,0.0)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              suggestedMin: 60,
	              suggestedMax: 125,
	              padding: 20,
	              fontColor: "#9a9a9a"
	            }
	          }],
	
	          xAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(225,78,202,0.1)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              padding: 20,
	              fontColor: "#9a9a9a"
	            }
	          }]
	        }
	      };
	
	      gradientChartOptionsConfigurationWithTooltipOrange = {
	        maintainAspectRatio: false,
	        legend: {
	          display: false
	        },
	
	        tooltips: {
	          backgroundColor: '#f5f5f5',
	          titleFontColor: '#333',
	          bodyFontColor: '#666',
	          bodySpacing: 4,
	          xPadding: 12,
	          mode: "nearest",
	          intersect: 0,
	          position: "nearest"
	        },
	        responsive: true,
	        scales: {
	          yAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(29,140,248,0.0)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              suggestedMin: 50,
	              suggestedMax: 110,
	              padding: 20,
	              fontColor: "#ff8a76"
	            }
	          }],
	
	          xAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(220,53,69,0.1)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              padding: 20,
	              fontColor: "#ff8a76"
	            }
	          }]
	        }
	      };
	
	      gradientChartOptionsConfigurationWithTooltipGreen = {
	        maintainAspectRatio: false,
	        legend: {
	          display: false
	        },
	
	        tooltips: {
	          backgroundColor: '#f5f5f5',
	          titleFontColor: '#333',
	          bodyFontColor: '#666',
	          bodySpacing: 4,
	          xPadding: 12,
	          mode: "nearest",
	          intersect: 0,
	          position: "nearest"
	        },
	        responsive: true,
	        scales: {
	          yAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(29,140,248,0.0)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              suggestedMin: 50,
	              suggestedMax: 125,
	              padding: 20,
	              fontColor: "#9e9e9e"
	            }
	          }],
	
	          xAxes: [{
	            barPercentage: 1.6,
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(0,242,195,0.1)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              padding: 20,
	              fontColor: "#9e9e9e"
	            }
	          }]
	        }
	      };
	
	
	      gradientBarChartConfiguration = {
	        maintainAspectRatio: false,
	        legend: {
	          display: false
	        },
	
	        tooltips: {
	          backgroundColor: '#f5f5f5',
	          titleFontColor: '#333',
	          bodyFontColor: '#666',
	          bodySpacing: 4,
	          xPadding: 12,
	          mode: "nearest",
	          intersect: 0,
	          position: "nearest"
	        },
	        responsive: true,
	        scales: {
	          yAxes: [{
	
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(29,140,248,0.1)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              suggestedMin: 60,
	              suggestedMax: 120,
	              padding: 20,
	              fontColor: "#9e9e9e"
	            }
	          }],
	
	          xAxes: [{
	
	            gridLines: {
	              drawBorder: false,
	              color: 'rgba(29,140,248,0.1)',
	              zeroLineColor: "transparent",
	            },
	            ticks: {
	              padding: 20,
	              fontColor: "#9e9e9e"
	            }
	          }]
	        }
	      };
	
	      var ctx = document.getElementById("chartLinePurple").getContext("2d");
	
	      var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
	
	      gradientStroke.addColorStop(1, 'rgba(72,72,176,0.2)');
	      gradientStroke.addColorStop(0.2, 'rgba(72,72,176,0.0)');
	      gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
		
	<%ResultSet view = con.selectData("SELECT top 10 * FROM product ORDER BY  product_view DESC");
	ResultSet views = con.selectData("SELECT top 10 * FROM product ORDER BY  product_view DESC");%>
	      var data = {
	   	
	   		   labels: [<%while (view.next()) {%><%=view.getInt("product_id")%>,<%}%>],
	        
	        datasets: [{
	          label: "Lượt xem",
	          fill: true,
	          backgroundColor: gradientStroke,
	          borderColor: '#d048b6',
	          borderWidth: 2,
	          borderDash: [],
	          borderDashOffset: 0.0,
	          pointBackgroundColor: '#d048b6',
	          pointBorderColor: 'rgba(255,255,255,0)',
	          pointHoverBackgroundColor: '#d048b6',
	          pointBorderWidth: 20,
	          pointHoverRadius: 4,
	          pointHoverBorderWidth: 15,
	          pointRadius: 4,
	          data: [<%while (views.next()) {%><%=views.getInt("product_view")%>,<%}%> ],
	        }]
	      };
	
	      var myChart = new Chart(ctx, {
	        type: 'line',
	        data: data,
	        options: gradientChartOptionsConfigurationWithTooltipPurple
	      });
	
	
	      var ctxGreen = document.getElementById("chartLineGreen").getContext("2d");
	
	      var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
	
	      gradientStroke.addColorStop(1, 'rgba(66,134,121,0.15)');
	      gradientStroke.addColorStop(0.4, 'rgba(66,134,121,0.0)'); //green colors
	      gradientStroke.addColorStop(0, 'rgba(66,134,121,0)'); //green colors
	
	      var data = {
	        labels: ['JUL', 'AUG', 'SEP', 'OCT', 'NOV'],
	        datasets: [{
	          label: "My First dataset",
	          fill: true,
	          backgroundColor: gradientStroke,
	          borderColor: '#00d6b4',
	          borderWidth: 2,
	          borderDash: [],
	          borderDashOffset: 0.0,
	          pointBackgroundColor: '#00d6b4',
	          pointBorderColor: 'rgba(255,255,255,0)',
	          pointHoverBackgroundColor: '#00d6b4',
	          pointBorderWidth: 20,
	          pointHoverRadius: 4,
	          pointHoverBorderWidth: 15,
	          pointRadius: 4,
	          data: [90, 27, 60, 12, 80],
	        }]
	      };
	
	      var myChart = new Chart(ctxGreen, {
	        type: 'line',
	        data: data,
	        options: gradientChartOptionsConfigurationWithTooltipGreen
	
	      });
	
	
	
	      var chart_labels = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
	      var chart_data = [100, 70, 90, 70, 85, 60, 75, 60, 90, 80, 110, 100];
	
	
	      var ctx = document.getElementById("chartBig1").getContext('2d');
	
	      var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
	
	      gradientStroke.addColorStop(1, 'rgba(72,72,176,0.1)');
	      gradientStroke.addColorStop(0.4, 'rgba(72,72,176,0.0)');
	      gradientStroke.addColorStop(0, 'rgba(119,52,169,0)'); //purple colors
	      var config = {
	        type: 'line',
	        data: {
	          labels: chart_labels,
	          datasets: [{
	            label: "My First dataset",
	            fill: true,
	            backgroundColor: gradientStroke,
	            borderColor: '#d346b1',
	            borderWidth: 2,
	            borderDash: [],
	            borderDashOffset: 0.0,
	            pointBackgroundColor: '#d346b1',
	            pointBorderColor: 'rgba(255,255,255,0)',
	            pointHoverBackgroundColor: '#d346b1',
	            pointBorderWidth: 20,
	            pointHoverRadius: 4,
	            pointHoverBorderWidth: 15,
	            pointRadius: 4,
	            data: chart_data,
	          }]
	        },
	        options: gradientChartOptionsConfigurationWithTooltipPurple
	      };
	      var myChartData = new Chart(ctx, config);
	      $("#0").click(function() {
	        var data = myChartData.config.data;
	        data.datasets[0].data = chart_data;
	        data.labels = chart_labels;
	        myChartData.update();
	      });
	      $("#1").click(function() {
	        var chart_data = [80, 120, 105, 110, 95, 105, 90, 100, 80, 95, 70, 120];
	        var data = myChartData.config.data;
	        data.datasets[0].data = chart_data;
	        data.labels = chart_labels;
	        myChartData.update();
	      });
	
	      $("#2").click(function() {
	        var chart_data = [60, 80, 65, 130, 80, 105, 90, 130, 70, 115, 60, 130];
	        var data = myChartData.config.data;
	        data.datasets[0].data = chart_data;
	        data.labels = chart_labels;
	        myChartData.update();
	      });
	
	  	
	      var ctx = document.getElementById("CountryChart").getContext("2d");
	
	      var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);
	
	      gradientStroke.addColorStop(1, 'rgba(29,140,248,0.2)');
	      gradientStroke.addColorStop(0.4, 'rgba(29,140,248,0.0)');
	      gradientStroke.addColorStop(0, 'rgba(29,140,248,0)'); //blue colors
		
	      <%if (ngaybatdau != null || ngayketthuc != null || type != null) {%>
	      <%if (type.equals("donhang")) {
		ResultSet donhang = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau
				+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");
		ResultSet donhang_ = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau
				+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");%>
	      var myChart = new Chart(ctx, {
	        type: 'bar',
	        responsive: true,
	        legend: {
	          display: false
	        },
	        data: {
	       	
	    		
	          labels: [<%while (donhang.next()) {
			rs = con.selectData("select top (1) * from ct_donhang where donhang_id = " + donhang.getInt("donhang_id"));
			rs.next();%> '#ĐH<%=donhang.getString("donhang_id")%>', <%}%>],
	          datasets: [{
	            label: "Doanh thu",
	            fill: true,
	            backgroundColor: gradientStroke,
	            hoverBackgroundColor: gradientStroke,
	            borderColor: '#1f8ef1',
	            borderWidth: 2,
	            borderDash: [],
	            borderDashOffset: 0.0,
	            data: [<%while (donhang_.next()) {
	rs = con.selectData("select top (1) * from ct_donhang where donhang_id = " + donhang_.getInt("donhang_id"));
	rs.next();
	int thanhtien = rs.getInt("thanhtien");%><%=thanhtien%>, <%}%>],
	          }]
	        },
	        options: gradientBarChartConfiguration
	      }); 
	      <%} else {%> 
	     			<%ResultSet donhang = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau
			+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");
	ResultSet donhang_ = con.selectData("select * from DonDatHang where donhang_ngaydat between '" + ngaybatdau
			+ "' and '" + ngayketthuc + "' and donhang_trangthai = 4");%>
	      var myChart = new Chart(ctx, {
	          type: 'bar',
	          responsive: true,
	          legend: {
	            display: false
	          },
	          data: {
	         	
	      		
	            labels: [<%while (donhang.next()) {
		ResultSet ct_dh = con.selectData("select * from ct_donhang where donhang_id =" + donhang.getInt("donhang_id"));
		while (ct_dh.next()) {
			ResultSet sanpham = con.selectData("select * from product where product_id =" + ct_dh.getInt("product_id"));%><%while (sanpham.next()) {%> '<%=sanpham.getString("product_id")%>', <%}%><%}
	}%>],
	            datasets: [{
	              label: "Doanh thu",
	              fill: true,
	              backgroundColor: gradientStroke,
	              hoverBackgroundColor: gradientStroke,
	              borderColor: '#1f8ef1',
	              borderWidth: 2,
	              borderDash: [],
	              borderDashOffset: 0.0,
	              data: [<%while (donhang_.next()) {
	ResultSet ct_dh = con.selectData("select * from ct_donhang where donhang_id =" + donhang_.getInt("donhang_id"));
	while (ct_dh.next()) {
		ResultSet sanpham = con.selectData("select * from product where product_id =" + ct_dh.getInt("product_id"));
		int soluong = ct_dh.getInt("soLuong");%><%while (sanpham.next()) {%><%=(sanpham.getInt(3) - sanpham.getInt(3) * sanpham.getInt(4) / 100) * soluong%>, <%}%><%}
	}%>],
	            }]
	          },
	          options: gradientBarChartConfiguration
	        });
	      
	      
	      <%}
	} else {%>
	  		
	      var myChart = new Chart(ctx, {
	        type: 'bar',
	        responsive: true,
	        legend: {
	          display: false
	        },
	        data: {
	       	 
	          labels: ['USA', 'GER', 'AUS', 'UK', 'RO', 'BR','BR','BR','BR','BR','BR','BR','BR','BR'],
	          datasets: [{
	            label: "Countries",
	            fill: true,
	            backgroundColor: gradientStroke,
	            hoverBackgroundColor: gradientStroke,
	            borderColor: '#1f8ef1',
	            borderWidth: 2,
	            borderDash: [],
	            borderDashOffset: 0.0,
	            data: [53, 20, 10, 80, 100, 45,20,20,20,20,20,20,20,20],
	          }]
	        },
	        options: gradientBarChartConfiguration
	      }); <%}%>
	
	    },
	
	    initGoogleMaps: function() {
	      var myLatlng = new google.maps.LatLng(40.748817, -73.985428);
	      var mapOptions = {
	        zoom: 13,
	        center: myLatlng,
	        scrollwheel: false, //we disable de scroll over the map, it is a really annoing when you scroll through page
	        styles: [{
	            "elementType": "geometry",
	            "stylers": [{
	              "color": "#1d2c4d"
	            }]
	          },
	          {
	            "elementType": "labels.text.fill",
	            "stylers": [{
	              "color": "#8ec3b9"
	            }]
	          },
	          {
	            "elementType": "labels.text.stroke",
	            "stylers": [{
	              "color": "#1a3646"
	            }]
	          },
	          {
	            "featureType": "administrative.country",
	            "elementType": "geometry.stroke",
	            "stylers": [{
	              "color": "#4b6878"
	            }]
	          },
	          {
	            "featureType": "administrative.land_parcel",
	            "elementType": "labels.text.fill",
	            "stylers": [{
	              "color": "#64779e"
	            }]
	          },
	          {
	            "featureType": "administrative.province",
	            "elementType": "geometry.stroke",
	            "stylers": [{
	              "color": "#4b6878"
	            }]
	          },
	          {
	            "featureType": "landscape.man_made",
	            "elementType": "geometry.stroke",
	            "stylers": [{
	              "color": "#334e87"
	            }]
	          },
	          {
	            "featureType": "landscape.natural",
	            "elementType": "geometry",
	            "stylers": [{
	              "color": "#023e58"
	            }]
	          },
	          {
	            "featureType": "poi",
	            "elementType": "geometry",
	            "stylers": [{
	              "color": "#283d6a"
	            }]
	          },
	          {
	            "featureType": "poi",
	            "elementType": "labels.text.fill",
	            "stylers": [{
	              "color": "#6f9ba5"
	            }]
	          },
	          {
	            "featureType": "poi",
	            "elementType": "labels.text.stroke",
	            "stylers": [{
	              "color": "#1d2c4d"
	            }]
	          },
	          {
	            "featureType": "poi.park",
	            "elementType": "geometry.fill",
	            "stylers": [{
	              "color": "#023e58"
	            }]
	          },
	          {
	            "featureType": "poi.park",
	            "elementType": "labels.text.fill",
	            "stylers": [{
	              "color": "#3C7680"
	            }]
	          },
	          {
	            "featureType": "road",
	            "elementType": "geometry",
	            "stylers": [{
	              "color": "#304a7d"
	            }]
	          },
	          {
	            "featureType": "road",
	            "elementType": "labels.text.fill",
	            "stylers": [{
	              "color": "#98a5be"
	            }]
	          },
	          {
	            "featureType": "road",
	            "elementType": "labels.text.stroke",
	            "stylers": [{
	              "color": "#1d2c4d"
	            }]
	          },
	          {
	            "featureType": "road.highway",
	            "elementType": "geometry",
	            "stylers": [{
	              "color": "#2c6675"
	            }]
	          },
	          {
	            "featureType": "road.highway",
	            "elementType": "geometry.fill",
	            "stylers": [{
	              "color": "#9d2a80"
	            }]
	          },
	          {
	            "featureType": "road.highway",
	            "elementType": "geometry.stroke",
	            "stylers": [{
	              "color": "#9d2a80"
	            }]
	          },
	          {
	            "featureType": "road.highway",
	            "elementType": "labels.text.fill",
	            "stylers": [{
	              "color": "#b0d5ce"
	            }]
	          },
	          {
	            "featureType": "road.highway",
	            "elementType": "labels.text.stroke",
	            "stylers": [{
	              "color": "#023e58"
	            }]
	          },
	          {
	            "featureType": "transit",
	            "elementType": "labels.text.fill",
	            "stylers": [{
	              "color": "#98a5be"
	            }]
	          },
	          {
	            "featureType": "transit",
	            "elementType": "labels.text.stroke",
	            "stylers": [{
	              "color": "#1d2c4d"
	            }]
	          },
	          {
	            "featureType": "transit.line",
	            "elementType": "geometry.fill",
	            "stylers": [{
	              "color": "#283d6a"
	            }]
	          },
	          {
	            "featureType": "transit.station",
	            "elementType": "geometry",
	            "stylers": [{
	              "color": "#3a4762"
	            }]
	          },
	          {
	            "featureType": "water",
	            "elementType": "geometry",
	            "stylers": [{
	              "color": "#0e1626"
	            }]
	          },
	          {
	            "featureType": "water",
	            "elementType": "labels.text.fill",
	            "stylers": [{
	              "color": "#4e6d70"
	            }]
	          }
	        ]
	      };
	
	      var map = new google.maps.Map(document.getElementById("map"), mapOptions);
	
	      var marker = new google.maps.Marker({
	        position: myLatlng,
	        title: "Hello World!"
	      });
	
	      // To add the marker to the map, call setMap();
	      marker.setMap(map);
	    },
	
	    showNotification: function(from, align) {
	      color = Math.floor((Math.random() * 4) + 1);
	
	      $.notify({
	        icon: "tim-icons icon-bell-55",
	        message: "Welcome to <b>Black Dashboard</b> - a beautiful freebie for every web developer."
	
	      }, {
	        type: type[color],
	        timer: 8000,
	        placement: {
	          from: from,
	          align: align
	        }
	      });
	    }
	
	  };
	</script>
	<!-- Sharrre libray -->
	<script
		src="https://demos.creative-tim.com/black-dashboard/assets/demo/jquery.sharrre.js"></script>
	<script>
	   $(document).ready(function() {
	     $().ready(function() {
	       $sidebar = $('.sidebar');
	       $navbar = $('.navbar');
	       $main_panel = $('.main-panel');
	
	       $full_page = $('.full-page');
	
	       $sidebar_responsive = $('body > .navbar-collapse');
	       sidebar_mini_active = true;
	       white_color = false;
	
	       window_width = $(window).width();
	
	       fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();
	
	
	
	       $('.fixed-plugin a').click(function(event) {
	         if ($(this).hasClass('switch-trigger')) {
	           if (event.stopPropagation) {
	             event.stopPropagation();
	           } else if (window.event) {
	             window.event.cancelBubble = true;
	           }
	         }
	       });
	
	       $('.fixed-plugin .background-color span').click(function() {
	         $(this).siblings().removeClass('active');
	         $(this).addClass('active');
	
	         var new_color = $(this).data('color');
	
	         if ($sidebar.length != 0) {
	           $sidebar.attr('data', new_color);
	         }
	
	         if ($main_panel.length != 0) {
	           $main_panel.attr('data', new_color);
	         }
	
	         if ($full_page.length != 0) {
	           $full_page.attr('filter-color', new_color);
	         }
	
	         if ($sidebar_responsive.length != 0) {
	           $sidebar_responsive.attr('data', new_color);
	         }
	       });
	
	       $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
	         var $btn = $(this);
	
	         if (sidebar_mini_active == true) {
	           $('body').removeClass('sidebar-mini');
	           sidebar_mini_active = false;
	           blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
	         } else {
	           $('body').addClass('sidebar-mini');
	           sidebar_mini_active = true;
	           blackDashboard.showSidebarMessage('Sidebar mini activated...');
	         }
	
	         // we simulate the window Resize so the charts will get updated in realtime.
	         var simulateWindowResize = setInterval(function() {
	           window.dispatchEvent(new Event('resize'));
	         }, 180);
	
	         // we stop the simulation of Window Resize after the animations are completed
	         setTimeout(function() {
	           clearInterval(simulateWindowResize);
	         }, 1000);
	       });
	
	       $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
	         var $btn = $(this);
	
	         if (white_color == true) {
	
	           $('body').addClass('change-background');
	           setTimeout(function() {
	             $('body').removeClass('change-background');
	             $('body').removeClass('white-content');
	           }, 900);
	           white_color = false;
	         } else {
	
	           $('body').addClass('change-background');
	           setTimeout(function() {
	             $('body').removeClass('change-background');
	             $('body').addClass('white-content');
	           }, 900);
	
	           white_color = true;
	         }
	
	
	       });
	
	       $('.light-badge').click(function() {
	         $('body').addClass('white-content');
	       });
	
	       $('.dark-badge').click(function() {
	         $('body').removeClass('white-content');
	       });
	     });
	   });
	</script>
	<script>
	   $(document).ready(function() {
	     // Javascript method's body can be found in assets/js/demos.js
	     demo.initDashboardPageCharts();
	
	   });
	 </script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS &&
		  TrackJS.install({
		    token: "ee6fab19c5a04ac1a32a645abde4613a",
		    application: "black-dashboard-free"
		  });
	</script>
	<!-- DataTable scripts -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/ju/jszip-2.5.0/dt-1.10.24/b-1.7.0/b-html5-1.7.0/r-2.2.7/datatables.min.js"></script>
	<script>
	   $(document).ready(function() {
		   $('#thongkeTable').DataTable({
				scrollCollapse: true,
				autoWidth: false,
				responsive: true,
				columnDefs: [{
					targets: "datatable-nosort",
					orderable: false,
				}],
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"language": {
					"info": "_START_-_END_ of _TOTAL_ entries",
					searchPlaceholder: "Search",
					paginate: {
						next: '<i class="ion-chevron-right"></i>',
						previous: '<i class="ion-chevron-left"></i>'  
					}
				},
				dom: 'Bfrtp',
				buttons: [
		            { extend: 'excelHtml5', footer: true },
		            { extend: 'pdfHtml5', footer: true }
				]
			});
	   });
	 </script>
</body>
</html>
<%
	}
%>