<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    <%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.cartDao"%>

 <%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sun.jdi.connect.Connector"%>
<%@page import="java.sql.Statement"%>
<%@page import="VinMart.entities.Users"%>

<%Users  user = (Users)session.getAttribute("LoginInfo");
 if(user == null){
		 response.sendRedirect("login");
 }
 else{
 %>
<!DOCTYPE html>
<html>
<head>


				<link rel="shortcut icon" href="//theme.hstatic.net/1000132959/1000362928/14/favicon.png?v=443" type="image/png">
				<title>
					Thanh toán đơn hàng
				</title>
	
					<meta name="description" content="Thanh toán đơn hàng">
				
			    <link href="//hstatic.net/0/0/global/checkouts.css?v=1.1" rel="stylesheet" type="text/css" media="all">
				<link href="//theme.hstatic.net/1000132959/1000362928/14/check_out.css?v=443" rel="stylesheet" type="text/css" media="all">
				<script type="text/javascript" async="" src="https://stats.hstatic.net/analyticsv3.min.js"></script><script src="//hstatic.net/0/0/global/jquery.min.js" type="text/javascript"></script>
				
				<script src="//hstatic.net/0/0/global/jquery.validate.js" type="text/javascript"></script>
				
				<style>
				

 form#form_update_shipping_method {
    position: relative;
}
.order-checkout__loading { position: static; }
.order-checkout__loading--box{
	position: absolute;
	left: 0;
	top: 0;
	z-index: -1;
	width: 100%;
	height: 100%;
	display: -webkit-flex;
	display: flex;
	opacity: 0;
	visibility: hidden;
	justify-content: center;
	align-items: center;
	padding: 0;
}
.order-checkout__loading--box.show {
	z-index: 2;
	visibility: visible;
	opacity: 1;
}
.order-checkout__loading--circle {
	border: 2px solid #f3f3f3;
	border-top: 2px solid #5cabe0;
	border-radius: 50%;
	width: 32px;
	height: 32px;
	margin: 0;
	-webkit-transform-origin: 50%;
	-o-transform-origin: 50%;
	-ms-transform-origin: 50%;
	transform-origin: 50%;
	-moz-animation: spin 700ms infinite linear;
	-ms-animation: spin 1.5s infinite linear;
	-webkit-animation: spin 700ms infinite linear;
	-o-animation: spin 700ms infinite linear;
	animation: spin 700ms infinite linear;
	z-index: 1;
}
.order-checkout__loading--box.show:after {
    content: "";
    position: fixed;
    width: 100%;
    height: 100%;
    left: 0;
    top: 0;
    z-index: 3;
}


.step-sections { position: relative; z-index: 3; }

@media (max-width: 767px){
  .order-checkout__loading--box{ position: fixed; }
  .order-checkout__loading--box.show:after { display: none; }
}


.order-checkout__loading--show .order-checkout__loading--box {
display:block;
}


@-moz-keyframes spin {
    100% {
        -moz-transform: rotate(360deg);
    }
}

@-webkit-keyframes spin {
    100% {
        -webkit-transform: rotate(360deg);
    }
}

@keyframes spin {
    100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
    }
}
				.redeem-login {
					display: flex;
					align-items: center;
					justify-content: space-between;
				}
				.redeem-login-title {
					position: relative;
					display: flex;
					flex-wrap: wrap;
				}
				.redeem-login-title h2 {
					color: #333;
					margin-right: 5px;
				}
				.redeem-login-btn a {
					display: inline-block;
					border-radius: 4px;
					font-weight: 500;
					padding: 13px 10px;
					background: #338dbc;
					color: #fff;
					width: 82px;
					text-align: center;
				}
				.redeem-form-used
				{
					padding-top : 10px;
				}
				.btn-redeem-loading .btn-redeem-spinner {
				   -webkit-animation: rotate 0.5s linear infinite;
				   animation: rotate 0.5s linear infinite;
				   opacity: 1;
				   -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=" 100 ")";
				   filter: alpha(opacity=100);
				}
				.icon-redeem-button-spinner {
					position: absolute;
					top: 0;
					opacity: 0;
					right: -25px;
					width: 12px;
					height: 12px;
					border: 2px solid #999999;
					border-bottom-color: transparent;
					border-radius: 100%;
				}
				.total-line-table-footer {
					white-space: nowrap;
				}
				.row-align-top {
					vertical-align: top;
				}
				</style>

				<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2, user-scalable=no">
					
		
<style>.grecaptcha-badge{visibility:hidden;}</style>

			</head>
<body style="">
				
 				
				<div class="content">
				
					<div class="wrap">
						<div class="sidebar">
							<div class="sidebar-content">
								<div class="order-summary order-summary-is-collapsed">
									<h2 class="visually-hidden">Thông tin đơn hàng</h2>
									<div class="order-summary-sections">
										<div class="order-summary-section order-summary-section-product-list" data-order-summary-section="line-items">
											<table class="product-table">
										
												<tbody>
												<%ArrayList<Products>  gioHang = new cartDao().getGioHang();%>
												 <%float tongcong =0;  for(int i = 0;i<gioHang.size();i++){ 
                    	
                    	 tongcong +=(gioHang.get(i).getProduct_price()-gioHang.get(i).getProduct_price()*gioHang.get(i).getProduct_discount()/100)*gioHang.get(i).getProduct_soLuongMua();%>  
        			<input type="hidden" value="<%=gioHang.get(i).getProduct_soLuongMua() %>" />
                    
														<tr class="product" >
															<td class="product-image">
																<div class="product-thumbnail">
																	<div class="product-thumbnail-wrapper">
							<img class="product-thumbnail-image" alt="<%=gioHang.get(i).getProduct_name() %>"
							 src="${pageContext.request.contextPath}/assets/images/<%=gioHang.get(i).getProduct_image() %>">
																	</div>
																	<span class="product-thumbnail-quantity" aria-hidden="true"><%=gioHang.get(i).getProduct_soLuongMua() %></span>
																</div>
															</td>
															<td class="product-description">
																<span class="product-description-name order-summary-emphasis"><%=gioHang.get(i).getProduct_name() %></span>
																
															</td>
															<td class="product-price">
																<span class="order-summary-emphasis">
												 <!-- Co giam gia -->
									<%if(gioHang.get(i).getProduct_discount()==0){ %> 			 
									<fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=(gioHang.get(i).getProduct_price())*gioHang.get(i).getProduct_soLuongMua()%>" />	VND
												<%}else{ %><!-- Khong giam gia -->
							
							<fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=(gioHang.get(i).getProduct_price()-gioHang.get(i).getProduct_price()*gioHang.get(i).getProduct_discount()/100)*gioHang.get(i).getProduct_soLuongMua()%>" />VND
							<%} %>
												
																</span>
															</td>
														</tr>
											<%} %>		
												</tbody>
											</table>
										</div>
										
										
											
										
										<div class="order-summary-section order-summary-section-total-lines payment-lines" data-order-summary-section="payment-lines">
											<table class="total-line-table">
												<thead>
													<tr>
														<th scope="col"><span class="visually-hidden">Mô tả</span></th>
														<th scope="col"><span class="visually-hidden">Giá</span></th>
													</tr>
												</thead>
												<tbody>
													<tr class="total-line total-line-subtotal">
														<td class="total-line-name">Tạm tính</td>
														
														<td class="total-line-price">
															<span class="order-summary-emphasis" >
															<fmt:formatNumber type = "number" groupingUsed = "true" 
															value="<%=tongcong%>"/>VND
															</span>
													
														</td>
													</tr>
													
													<tr class="total-line total-line-shipping">
														<td class="total-line-name">Phí vận chuyển</td>
														<td class="total-line-price">
															<span class="order-summary-emphasis" data-checkout-total-shipping-target="0">
																<%if(tongcong>=500000){ %>
														        <span>FREESHIP</span>
														        <%}else{ %>
														        <span>25.000VND</span>
														        <%} %>
															</span>
														</td>
													</tr>
													
												</tbody>
												<tfoot class="total-line-table-footer">
													<tr class="total-line">
														<td class="total-line-name payment-due-label">
															<span class="payment-due-label-total">Tổng cộng</span>
														</td>
														<td class="total-line-name payment-due">
															<span class="payment-due-currency">VND</span>
															<span class="payment-due-price" >
																<%if(tongcong>=500000){ %>
																	<fmt:formatNumber type = "number" groupingUsed = "true" 
															value="<%=tongcong%>"/>
																<%}else{ %>
																<fmt:formatNumber type = "number" groupingUsed = "true" 
															value="<%=tongcong+25000%>"/>
																<%} %>
															</span>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="main">
							<div class="main-header">
								<a href="${pageContext.request.contextPath}" class="logo">
									<h1 class="logo-text">Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</h1>
								</a>
								
									<ul class="breadcrumb">
										<li class="breadcrumb-item">
											<a href="${pageContext.request.contextPath}/gio-hang">Giỏ hàng</a>
										</li>
                                        
                                            <li class="breadcrumb-item breadcrumb-item-current">
                                                Thông tin giao hàng
                                            </li>                                  
									</ul>							
							</div>
							
							
				<form id="form_next_step" accept-charset="UTF-8"  action="${pageContext.request.contextPath}/Thanhtoan" method="post"  enctype="multidata/form-data">
                  		 <% for(int i = 0;i<gioHang.size();i++){ %>  	
                  			 <input hidden="true" name="product_idDel[]" value="<%out.print(gioHang.get(i).getProduct_id()); %>">
                  			 
                             <input hidden="true"  name="product_id[]" value="<%out.print(gioHang.get(i).getProduct_id()); %>">                                
                             <input hidden="true" name="soLuong[]" value="<%out.print(gioHang.get(i).getProduct_soLuongMua()); %>">
                             
                  			<%if(tongcong>=500000){ %>
                             <input hidden="true" name="thanhtien[]" 
                             value="<%=tongcong %>">
                             <%}else{ %>                   
                             <input hidden="true" name="thanhtien[]" 
                             value="<%=tongcong+25000 %>">
                         	 <%} %>   
                         <%} %>
							<!-- Table don hang -->
							
							<input hidden="true" name="nguoimua_id"  value="${ LoginInfo.users_id }" >
							<!-- END TABLE DON HANG -->
							<div class="main-content">							
									<div class="step">
										<div class="step-sections steps-onepage" step="1">
                                            
											
												<div class="section">
													<div class="section-header">
														<h2 class="section-title">Thông tin giao hàng</h2>
													</div>
													<% 
 				if(user !=null){
				ConnectionToDB conn = new ConnectionToDB();
            	 ResultSet khachhang = conn.selectData("select * from KHACHHANG where khachhang_id =  " + user.getUsers_id() );
            	 ResultSet khachhang1 = conn.selectData("select * from KHACHHANG where khachhang_id =  " + user.getUsers_id() );
            	 ResultSet khachhang2 = conn.selectData("select * from KHACHHANG where khachhang_id =  " + user.getUsers_id() );
            	 ResultSet khachhang3 = conn.selectData("select * from KHACHHANG where khachhang_id =  " + user.getUsers_id() );
            	 ResultSet nhanvien = conn.selectData("select * from nhanvien where nhanvien_id =  " + user.getUsers_id() );
            	 ResultSet nhanvien1 = conn.selectData("select * from nhanvien where nhanvien_id =  " + user.getUsers_id() );
            	 ResultSet nhanvien2 = conn.selectData("select * from nhanvien where nhanvien_id =  " + user.getUsers_id() );
            	 ResultSet nhanvien3 = conn.selectData("select * from nhanvien where nhanvien_id =  " + user.getUsers_id() );
            	
            	 %>
													<div class="section-content section-customer-information no-mb">
	
															<input type="hidden" name="email" value="${ LoginInfo.users_email }">
															
															<div class="logged-in-customer-information">
																<div class="logged-in-customer-information-avatar-wrapper">
																	<div class="logged-in-customer-information-avatar gravatar" style="background-image: url(//www.gravatar.com/avatar/1f9d9a9efc2f523b2f09629444632b5c.jpg?s=100&amp;d=blank);filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='//www.gravatar.com/avatar/1f9d9a9efc2f523b2f09629444632b5c.jpg?s=100&amp;d=blank', sizingMethod='scale')"></div>
																</div>
																<p class="logged-in-customer-information-paragraph">
															<%if(khachhang.next()){ %>	<%=khachhang.getString("khachhang_name") %>
															<%}%> 
															<%  if(nhanvien.next()){ %>
																<%=nhanvien.getString("nhanvien_name") %>
															 <%} %>  (${ LoginInfo.users_email })
																	<br>
																	<a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
																</p>
															</div>
														
														<div class="fieldset">
															
																<div class="field field-show-floating-label">
																	<div class="field-input-wrapper field-input-wrapper-select">
																		<label class="field-label" for="stored_addresses">Địa chỉ đã lưu trữ</label>
																		<select class="field-input" id="stored_addresses">
																		
																				<option>																					
																					<%if(khachhang1.next()){ %>	<%=khachhang1.getString("khachhang_name") %>
															<%}%> 
															<%  if(nhanvien1.next()){ %>
																<%=nhanvien1.getString("nhanvien_name") %>
															 <%} %> ,
										
																					70000
																					
																				</option>
																			
																		</select>
																	</div>
																</div>
															
															
																<div class="field field-required field-show-floating-label">
																	<div class="field-input-wrapper">
																		<label class="field-label" for="billing_address_full_name">Tên khách hàng</label>
																		<input placeholder="Họ và tên" autocapitalize="off" spellcheck="false" class="field-input" size="30" 
																		type="text" id="billing_address_full_name" name="name" 
																		<%if(khachhang2.next()){ %>	value="<%=khachhang2.getString("khachhang_name") %>"
															<%}%> 
															<%  if(nhanvien2.next()){ %>
																value="<%=nhanvien2.getString("nhanvien_name") %>"
															 <%} %>
																		>
																	</div>
																	
																</div>
															
										
																<div class="field field-required">
																	<div class="field-input-wrapper">
																		<label class="field-label" for="billing_address_phone">SĐT khách hàng</label>
																		<input placeholder="Số điện thoại"
																		 autocapitalize="off" spellcheck="false" class="field-input" 
																		 size="30" maxlength="11" type="tel" id="billing_address_phone" 
																		 name="sdt" <%if(khachhang3.next()){ %>	value="<%=khachhang3.getString("khachhang_sdt") %>"
															<%}%> 
															<%  if(nhanvien3.next()){ %>
																value="<%=nhanvien3.getString("nhanvien_sdt") %>"
															 <%} %>>
																	</div>
																	
																</div>
															
															
																<div class="field field-required">
																	<div class="field-input-wrapper">
																		<label class="field-label" for="billing_address_address1">Địa chỉ cụ thể</label>
																		<input required  placeholder="Địa chỉ cụ thể" autocapitalize="off" spellcheck="false" class="field-input" size="30" type="text" id="billing_address_address1" name="diachi" >
																	</div>
																	
																</div>
															
														</div>
													</div>
													<%}		 %>
													<div class="section-content">
														<div class="fieldset">

																<div class="order-checkout__loading--box">
																<div class="order-checkout__loading--circle"></div>  
																</div>
																
																<div class="field field-show-floating-label field-required field-third ">
																	<div class="field-input-wrapper field-input-wrapper-select">
																		<label class="field-label" for="customer_shipping_province"> Tỉnh / thành  </label>
																		<select class="field-input" id="province_id" name="province_id" required>
															<option data-code="null" value="0" >  Chọn tỉnh / thành </option>
																	 <%
										                           
										                        		Connection con = ConnectionToDB.getConnect();
										                                Statement st = con.createStatement();
										                                ResultSet rs = st.executeQuery("select * from province");
										                                while (rs.next()) {
										                            %>
										                 	<option value="<%=rs.getInt(1)%>"><%=rs.getString("province_name")%></option>
										                          	<%} %>
										                           									 
																			  
																		</select>
																	</div>
																	
																</div>
																
															
															<div class="field field-show-floating-label field-required field-third ">							
																<div class="field-input-wrapper field-input-wrapper-select">
													                 <label   id="district_id" class="icon-field"><i class="icon-login icon-envelope "></i></label>
													                 <select   hidden="true" class="custom-select" name="district"  >
													                 	 <option value="">--Chọn Quận/Huyện--</option>
													                 </select>
													            </div>
												             </div>
																		
															<div class="field field-show-floating-label   field-third  ">
																<div class="field-input-wrapper field-input-wrapper-select">
																	<label  id="ward_name"  class="icon-field" for="customer_shipping_ward"></label>
																	<select  hidden="true" class="custom-select"  name="ward">
																		<option value="" >Chọn phường / xã</option>																					
																	</select>
																</div>
																				
															</div>
															
														</div>
														
													</div>
                                                    <div id="change_pick_location_or_shipping">
                                                                <div id="section-shipping-rate">
                                                                    <div class="section-header">
                                                                        <h2 class="section-title">Phương thức vận chuyển</h2>
                                                                    </div>
                                                                    <div class="section-content">
                                                                        
                                                                        <div class="content-box  blank-slate">
                                                                            <i class="blank-slate-icon icon icon-closed-box "></i>
                                                                            <p> Đường bộ Đường sắt. Đường thủy (vận tải biển, thủy nội địa).</p>
                                                                        </div>
                                                                        
                                                                    </div>
                                                                </div>
                                                            
                                                            <div id="section-payment-method" class="section">
                                                                <div class="section-header">
                                                                    <h2 class="section-title">Phương thức thanh toán</h2>
                                                                </div>
                                                                <div class="section-content">
                                                                    <div class="content-box">
                                                                        
                                                                        
                                                                        <div class="radio-wrapper content-box-row">
                                                                            <label class="radio-label" for="payment_method_id_339865">
                                                                                <div  class="radio-input">
                                                                                    <input id="payment_method_id_339865" class="input-radio" name="payment_method_id" type="radio" value="339865" required>
                                                                                </div>
                                                                                <span class="radio-label-primary">Thanh toán khi giao hàng (COD)</span>
                                                                            </label>
                                                                        </div>
                                                                        
                                                                        
                                                                        <div class="radio-wrapper content-box-row">
                                                                            <label class="radio-label" for="payment_method_id_339867">
                                                                                <div class="radio-input">
                                                                                    <input id="payment_method_id_339867" class="input-radio" name="payment_method_id" type="radio" >
                                                                                </div>
                                                                                <span class="radio-label-primary">Chuyển khoản qua ngân hàng(Đang  xây dựng)</span>
                                                                            </label>
                                                                        </div>
                                                        
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        
                                                    </div>
												</div>
                                            
											
										</div>
										<div class="step-footer">
                                            
                                                
                                                    <input name="utf8" type="hidden" value="✓">
                                                    <button type="submit" class="step-footer-continue-btn btn">
                                                        <span class="btn-content">Hoàn tất đơn hàng</span>
                                                        <i class="btn-spinner icon icon-button-spinner"></i>
                                                    </button>
                                               
                                                <a class="step-footer-previous-link" href="${pageContext.request.contextPath}/gio-hang">
                                                    <svg class="previous-link-icon icon-chevron icon" xmlns="http://www.w3.org/2000/svg" width="6.7" height="11.3" viewBox="0 0 6.7 11.3"><path d="M6.7 1.1l-1-1.1-4.6 4.6-1.1 1.1 1.1 1 4.6 4.6 1-1-4.6-4.6z"></path></svg>
                                                    Giỏ hàng
                                                </a>
                                            
										</div>
									</div>
								
							</div>
				</form>
							<div class="main-footer">
							
							</div>
						</div>
					</div>
				
				</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("#province_id").on("change", function() {
            var province_id = $("#province_id").val();
            
            	$.ajax({
            		url: "${pageContext.request.contextPath}/district",
            		data: {province_id:province_id},
            		method: "POST",
            		
            		success: function (data)
            		{
            			$("#district_id").html(data);
            		} 
            	});
        });
    });
</script>
 
 <script type="text/javascript">
    $(document).ready(function() {
        $("#submit").on("click", function() {
            var province_id = $("#province_id").val();
            var district_id = $("#district").val();
            var ward_name = $("#ward").val();
            if(province_id == "" || province_id == null)
            	{
            	$("#error").html("All fields are madatory. ");
            	} 
            else{
            	
            	$.ajax({
            		url: "",
            		method : "POST",
            		data: {province_id: province_id , district_id: district_id,ward_name: ward_name},
            		success: function (data)
            		{
            			
            		$("#form").trigger("click");
            		}
            	}); 
            }
            	
        });
    });
</script>

</body>

</html>
<%}%>