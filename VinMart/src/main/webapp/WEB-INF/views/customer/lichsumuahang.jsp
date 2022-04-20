<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="VinMart.entities.Users"%>
<%@page import="java.util.Date" %>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate" %>  
<%@page import="java.text.SimpleDateFormat" %>  
<%@page import="java.text.DateFormat" %>  
<%@page import="java.util.concurrent.TimeUnit" %> 
<!DOCTYPE html>
<%Users  check = (Users)session.getAttribute("LoginInfo");
int  idKhachHang = (Integer)session.getAttribute("idKhachHang");
 if(check == null){
		 response.sendRedirect("../login");
 }
 
 %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="vi-VN" class="">
<head>
        <title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
        <%@include file="/WEB-INF/views/layouts/customer/decorators/title.jsp" %>
     	<%@include file="/WEB-INF/views/layouts/customer/decorators/headinfo.jsp" %>
     	
     	
     	<style type="text/css">
     	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
     	</style>
     	
     	<style>
     	.tanggiamsoluong {
    float: left;
    padding: 0 7px;
    width: 15px;
    font-size: 16px;
    text-align: center;
    border: 1px solid #ededed;
    height: 26px;
    line-height: 26px;
    
    background: linear-gradient(#fff,#f7f7f7);
    font-style: normal;
     	
     	</style>
     	<%@include file="/WEB-INF/views/layouts/customer/decorators/modal.jsp" %>
     	
</head>

<body class=" new2019" id="asb" >
   <div id="toast">

    </div>
    <!-- HEADER HIDE -->
   		<%@include file="/WEB-INF/views/layouts/customer/header/headerhide.jsp" %>
	<!-- END HEADER HIDE -->
		
		 					<%
                         	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                          	Date date1 = null;	                   
                          	Date date2 = null;                    	
                        	%>
		<% if(check != null){
			 
		  %>
				<% 
				
            	ResultSet khachhang = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang1 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang2 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang3 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang4 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang5 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang6 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang7 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang8 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhang9 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhangGioitinh = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet khachhangGioitinh1 = con.selectData("select * from KHACHHANG where khachhang_id =  " + check.getUsers_id() );
				ResultSet nhanvien = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien1 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien2 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien3 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien4 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien5 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien6 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien7 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien8 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvien9 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvienGioitinh = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
				ResultSet nhanvienGioitinh1 = con.selectData("select * from nhanvien where nhanvien_id =  " + check.getUsers_id() );
            	 %>
            	 
<section>        
<div id="history" class="history" style="" data-id="<%=check.getUsers_id() %>">
    <div class="public-keycapcha-v3" data-key="6LfYlKYZAAAAAAHYuba0doTIvcfKWzCwz-G0dZGn"></div>
    <div class="account">
        <div>
            <span class="name"><%if(khachhangGioitinh1.next()){ 
            						if(khachhangGioitinh1.getInt(4)==1){%>
            					Anh
            					<%}else{ %>
            					Chị
            					<%}} %>
            					 <%if(nhanvienGioitinh1.next()){ 
            						if(nhanvienGioitinh1.getInt(4)==1){%>
            					Anh
            					<%}else{ %>
            					Chị
            					<%}} %>
            
            
            
            <%if(khachhang.next()){ %>	<%=khachhang.getString("khachhang_name") %>
															<%}%> 
															<%  if(nhanvien.next()){ %>
																<%=nhanvien.getString("nhanvien_name") %>
															 <%} %> </span>
            <div class="boxbtnhistory">
                <a href="javascript:;" class="editinfo"><i class="icon-edit"></i> Sửa thông tin</a>
                <a href="javascript:void(0)" class="btnlogout"><i class="iconlogout"></i> Thoát tài khoản</a>
            </div>
        </div>
    </div>
    <div class="choose">
        <h3 class="lsmh active" data-tab="orderlist">Lịch sử mua hàng</h3>
        <h3 class="mgg" data-tab="couponlist">Phiếu mua hàng</h3>
    </div>
    <div class="tcontent orderlist" data-tab="orderlist">
    
  
    			
    				<%                 
    				//ResultSet dh = con.selectData("select donhang_id from DonDatHang");
                    
                	ResultSet p,d,w,rs,ct_dh; 
                	%>
                	<%
               
                     rs = con.selectData("select  * from DonDatHang ORDER BY  donhang_id DESC"); //giam dan
                      while (rs.next()){
                    	if(rs.getInt("nguoimua_id")==check.getUsers_id()){
                    		if(rs.getInt("donhang_trangthai") != 0){
                    	
                     %>
                     
    <div class="order sso" data-id="<%=rs.getInt("donhang_id") %>" >
	    <div class="status">
			    <div class="createdate infoOther" data-id="<%=rs.getInt("donhang_id") %>" >			
				    <div class="orderid">
				   		 <label><b>ĐH #<%=rs.getInt("donhang_id") %></b></label>
				    </div>
				    
				    <!-- TRANG THAI DON HANG -->
				    <div class="orderstatus" data-id="<%=rs.getInt("donhang_id") %>">
					    <label class="complete statusdelivery"> <i class="tpl-status1"></i>
					    <%if(rs.getInt("donhang_trangthai")==1){ %>
					     Đã xác nhận 
					     <%}if(rs.getInt("donhang_trangthai")==2){ %>
					     Chờ xuất hàng 
					     <%}if(rs.getInt("donhang_trangthai")==3){ %>
					     Đang giao hàng
					     <%}if(rs.getInt("donhang_trangthai")==4){ %>
					   	 Giao thành công
					    <%} %>
					    </label>
					    <div class="list-status info-status hidden">
						    <div class="status">
						   		<%if(rs.getInt("donhang_trangthai")==1){ %>
							    <div class="actived"><i class="tpl-status1"></i> 
							    	<span>Đã xác nhận</span>
							    </div>
							     <div><i class="tpl-status2"></i> 
							    	<span>Chờ xuất hàng</span>
							    </div>
							    <div><i class="tpl-status6"></i> 
							    	<span>Đang giao hàng</span>
							    </div>
							    <div><i class="tpl-status7"></i>
							    	 <span>Giao thành công</span>
							     </div>
							     
							    <%}if(rs.getInt("donhang_trangthai")==2){ %>
							    <div><i class="tpl-status1"></i> 
							    	<span>Đã xác nhận</span>
							    </div>
							     <div class="actived"><i class="tpl-status2"></i> 
							    	<span>Chờ xuất hàng</span>
							    </div>
							    <div><i class="tpl-status6"></i> 
							    	<span>Đang giao hàng</span>
							    </div>
							    <div><i class="tpl-status7"></i>
							    	 <span>Giao thành công</span>
							     </div>
							    <%}if(rs.getInt("donhang_trangthai")==3){ %>
							    <div ><i class="tpl-status1"></i> 
							    	<span>Đã xác nhận</span>
							    </div>
							     <div><i class="tpl-status2"></i> 
							    	<span>Chờ xuất hàng</span>
							    </div>
							    <div class="actived"><i class="tpl-status6"></i> 
							    	<span>Đang giao hàng</span>
							    </div>
							    <div><i class="tpl-status7"></i>
							    	 <span>Giao thành công</span>
							     </div>
							    <%}if(rs.getInt("donhang_trangthai")==4){ %>
							    <div ><i class="tpl-status1"></i> 
							    	<span>Đã xác nhận</span>
							    </div>
							     <div><i class="tpl-status2"></i> 
							    	<span>Chờ xuất hàng</span>
							    </div>
							    <div><i class="tpl-status6"></i> 
							    	<span>Đang giao hàng</span>
							    </div>
							    <div class="actived"><i class="tpl-status7"></i>
							    	 <span>Giao thành công</span>
							     </div>
							     <%} %>
						     </div>
					     </div>
				     </div>
					
				      <!-- END TRANG THAI DON HANG -->
				     <div class="containerPayment">
					     <div class="row-text paymentinfo">
						     <span id="transactiontype_41819979"> <i class="icon-payment-cash"></i> 
						     <span>Thanh toán khi nhận hàng</span>
						     </span>
					     </div>
					     <a href="javascript:" class="btn-infostatus" onclick="return orderList.toggleOrStatus(this,<%=rs.getInt("donhang_id") %>);">Xem thêm</a>
				     </div>
				     
				     <!-- xem them -->
				     <div class="col70 info hidden">
				    
					     <div class="row-text">
						     <span class="text-left">Người nhận:</span> 
						     <span class="text-right"> <span id="gender_41819979">Anh/Chị</span>
						     <span id="name_41819979">
						      <%if(khachhang1.next()){ %>	<%=khachhang1.getString("khachhang_name") %>
															<%}%> 
															<%  if(nhanvien1.next()){ %>
																<%=nhanvien1.getString("nhanvien_name") %>
															 <%} %>
						     
						     </span> (<span id="phone_41819979">
						      <%if(khachhang2.next()){ %>	<%=khachhang2.getString("khachhang_sdt") %>
															<%}%> 
															<%  if(nhanvien2.next()){ %>
																<%=nhanvien2.getString("nhanvien_sdt") %>
															 <%} %>
						     </span>) 
						  
						     </span>
					     </div>
					     <div id="notify_receiver_41819979" class="notifyChangeReceiver hidden"></div>
					     <% ct_dh = con.selectData("select * from CT_DonHang where donhang_id = "+rs.getInt("donhang_id") + " "); 
					     
					     ct_dh.next();%>
					     <div class="row-text">
						     <span class="text-left">Địa chỉ giao:</span> 
						      <%p = con.selectData("select province_name from province where id = "+ct_dh.getInt("province"));
	                            p.next();
	                            String tenprovince = p.getString("province_name");
	                            
	                            d = con.selectData("select district from district where id = "+ ct_dh.getInt("district")+ " and province_id = " + ct_dh.getInt("province") );
                				d.next();
                				String tendistrict = d.getString("district");
                				
                				w = con.selectData("select ward from ward where id = "+ ct_dh.getInt("ward") );
                				w.next();
                				String tenward = w.getString("ward");
	                          %>
						     <span class="text-right"> <%=ct_dh.getString("diachi") %> - <%=tenward %> - <%=tendistrict %> - <%=tenprovince%> </span>
					     </div>
					    
				     </div>
				     <div class="ordertime">
				     <%if(rs.getString("donhang_ngaygiao")==null){ %>
				     	<%
				     	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM"); 
				     	 
				     	Calendar c1 = Calendar.getInstance();
				     	Calendar c2 = Calendar.getInstance();
				     	Date giao_truoc_ngay =  rs.getDate("donhang_ngaydat");
				     	
				     	c1.setTime(giao_truoc_ngay);
				     	c1.add(Calendar.DATE, 1);
				     	%>
				     	
				     	<span><span class="deliveryinfo">Giao lúc:</span> <b> Trước 14:00 <%=dateFormat.format(c1.getTime()) %></b>  </span>
				     <% }else{%>
				     <%
				     	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
				     	 
				     	Calendar c1 = Calendar.getInstance();
				     	
				     	Date ngay_giao =  rs.getDate("donhang_ngaygiao");
				     	
				     	c1.setTime(ngay_giao);
				     	
				     	%>
				     	<span><span class="deliveryinfo">Giao lúc:</span> <b><%=dateFormat.format(c1.getTime()) %></b> </span>
				     <%} %>
				     
					    
				     </div>
				    <!-- END xem them -->
			  </div>
		     <div class="clear"></div>
	     </div>
	     
	     <div class="status newrow-info"><div class="createdate"></div></div>
	     <!-- INFO DON HANG -->
	     
	     <%ResultSet a = con.selectData("select * from CT_DonHang where donhang_id = " +rs.getInt("donhang_id") );
	     while(a.next()){
	     ResultSet sp = con.selectData("select * from product where product_id =" +a.getString("product_id") + " and product_trangthai =1" );
	    
	     while(sp.next()){ 
	    	 
	    	 ResultSet lohang = con.selectData("SELECT  top 1 * FROM lohang where product_id = " + sp.getInt("product_id") + "  and trangthai =1 order by hansudung ASC");
	    	 lohang.next();
	    	 String nsx = lohang.getString("ngaysanxuat");
	    	 String hsd = lohang.getString("hansudung");
	    	 date1 = simpleDateFormat.parse(nsx);
	    	 date2 = simpleDateFormat.parse(hsd);
	    	 long getdays = date2.getTime()-date1.getTime();
        	 long day = TimeUnit.MILLISECONDS.toDays(getdays);
	     
	     %>     
	       <div class="item one" >
		     <div class="info">
			     <img src="${pageContext.request.contextPath}/assets/images/<%=sp.getString("product_image") %>"  class="" width="40" height="40">
			     <div>
			     <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%=sp.getString("product_id") %>"><%=sp.getString("product_name") %> </a> 
			     <span class="quantity">Số lượng: <%=a.getInt("soLuong") %></span>
			     
			     <p class="exp">(HSD còn <%=day %> ngày)</p>
			     </div>
		     </div>
		     <div class="price">
			     <span>
			     <fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=(sp.getInt(3)-sp.getInt(3)*sp.getInt(4)/100)*a.getInt(3) %>" />₫
				</span> 
			     <label>
			     <fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=sp.getInt(3)*a.getInt(3) %>" />₫
				</label>
		     </div>
	     </div>
	     <%}} %>
	     <%ResultSet b = con.selectData("select * from CT_DonHang where donhang_id = " +rs.getInt("donhang_id"));
	     b.next();
	     %>
	     <div class="itotal" >
	     <%if(b.getInt("thanhtien")>=500000){ %>
		     <div class="more">
		     	<div>Tiền hàng : <label><fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=b.getInt(4)%>" />₫</label></div>
		     </div>
		     <div class="more">
		     	<div>Phí giao hàng: <label>0₫</label></div>
		     </div>
		
		<%}else{ %> 
		  	 <div class="more">
		     	<div>Tiền hàng : <label><fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=b.getInt(4)-25000%>" />₫</label></div>
		     </div>
		     <div class="more">
		     	<div>Phí giao hàng: <label><fmt:formatNumber type = "number" groupingUsed = "true" 
				value="25000" />₫</label></div>
		     </div>
		 <%} %>
		     <div class="top-line">
		     	<div>Tổng tiền: <label><b>
		     	<fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=b.getInt(4)%>" />
		     	₫</b></label></div>
		     </div>
		    
		     <div class="clear"></div>
	     </div>
	     <!-- END INFO DON HANG -->
	     
	     <div class="paymentarea paymentarea_41819979">
			     <div id="paymentresult_41819979" class="group-info-payment history">
				     <div class="message-info-payment">
					     <div id="paycash_41819979" class="pay-cash">
						     <i class="icon-cash"></i> 
						     <span style="text-transform:capitalize">Anh/Chị  
						     <%if(khachhang3.next()){ %>	<%=khachhang3.getString("khachhang_name") %>
															<%}%> 
															<%  if(nhanvien3.next()){ %>
																<%=nhanvien3.getString("nhanvien_name") %>
															 <%} %>
						     </span> đã chọn hình thức thanh toán <b>tiền mặt khi nhận hàng</b>
					     </div>			     
				     </div>
			     </div>
		     <div id="show-payments_41819979" class="show-payments"><p>Anh/Chị  
		     <%if(khachhang4.next()){ %>	<%=khachhang4.getString("khachhang_name") %>
															<%}%> 
															<%  if(nhanvien4.next()){ %>
																<%=nhanvien4.getString("nhanvien_name") %>
															 <%} %>
		      có thể trả tiền bằng cách:</p></div>
		     <!-- HINH THUC THANH TOAN -->
		     <div id="payment_41819979" class="payments">
		     	<div class="wrapbtn">
				     <a onclick="updatePaymentOrder(41819979,0,'Tiền mặt khi nhận hàng',this)" class="btn-og btnpayhome"> 
				     	<i id="iconcash_41819979" class="icon-ordersuccess cash"></i> Tiền mặt khi nhận hàng 
				     </a> 
				     <a onclick="updatePaymentOrder(41819979,0,'Cà thẻ khi nhận hàng',this)" class="btn-og btnpayhome">
				     	<i id="iconcard_41819979" class="icon-ordersuccess card hidden"></i> Cà thẻ khi nhận hàng 
				     </a>
			     </div>
			     <div class="wrapbtn">
				     <a onclick="updatePaymentOrder(41819979,22,'',this,'','history')" class="btn-og btnatm">
					     <label>Thẻ <i class="icon-atm-small"></i></label> 
					     <span>(có internet banking)</span>
				     </a> 
				     <a onclick="updatePaymentOrder(41819979,23,'',this,'','history')" class="btn-og btnvisa">Thẻ 
				     	<i class="icon-visa-small"></i>
				     </a>
			     </div>
			     <div class="wrapbtn">
				     <a onclick="updatePaymentOrder(41819979,17,'',this,'','history')" class="btn-og btnmm">
					     <span>Thanh toán qua</span>
					     <label class="ic">
					     	<img height="40" src="//cdn.tgdd.vn/bachhoaxanh/www/Content/images/momo-logo.jpg" class="loading" data-was-processed="true">
					     </label>
				     </a> 
				     <a onclick="updatePaymentOrder(41819979,12,'',this,'','history')" class="btn-og btnzp">
					     <span>Thanh toán qua</span>
						     <label class="ic">
						     <img height="40" src="//cdn.tgdd.vn/bachhoaxanh/www/Content/images/zalopay-logo.jpg" class="loading" data-was-processed="true">
					     </label>
				     </a>
			     </div>
		     </div>
		     <!-- END HINH THUC THANH TOAN -->
		     <!-- BUTTON HUY -->
		     <div class="wrapbtn mrg10px">
 
  
  				</div>
		     <%if(rs.getInt(3)==1){ %>
		     <div class="edit-info edit-huy" style=" justify-content: center;display: flex;">		     
			     <div class="huy huywithpayment" style="background-color: black;">	    
			   
                    <a href="#myModaldel" data-toggle="modal"  class="rebuy cancelorder updatestatus" style="border: #000000;" >				
                    <span style="color: white;"> Hủy đơn hàng</span>
					</a>
					<input hidden="true" id="donhang_trangthai"  value="<%=rs.getInt("donhang_trangthai")-1 %>">
					<input hidden="true" id="donhang_id"  value="<%=rs.getInt("donhang_id") %>">
					
					<input hidden="true" id="nguoimua_id" 
					value="<%=check.getUsers_id() %>">						
				
			     </div>
		     </div>
		     <%} %>
		     <!-- END BUTTON HUY -->
		      <!-- The Modal DEL-->
  <div class="modal fade" id="myModaldel">
    <div class="modal-dialog modal-sm" style="padding: 10%; height: 300%;bottom: 16%;">
      <div class="modal-content" style=" width: 40%;height: -webkit-fill-available;left: 28%;height: 18%; ">
      
        <form action="${pageContext.request.contextPath}/huy-don-hang"
			     method="post"   enctype="multidata/form-data">
        <!-- Modal body -->
        <div class="modal-body">
	        	<div>
	         		 Vinmart mong nhận được góp ý của chị để cải thiện chất lượng dịch vụ được tốt hơn!
	         	</div>
	         	<ul style="margin-top: 20px;margin-bottom: 10px;">
		         	<li style="margin-bottom: 10px;">
			         	<input type="checkbox" id="checkbox_2" name="check_1" value="Tôi không còn nhu cầu" class="hidden" onclick="chooseCheckboxReason(this)"> 
			         	<label class="check-note" style="position: relative; padding-left: 1.95em;cursor: pointer;line-height: 19px;" for="checkbox_2">Tôi không còn nhu cầu</label>
		         	</li>
		         	<li style="margin-bottom: 10px;">
			         	<input type="checkbox" id="checkbox_1" name="check_2" value="Tôi muốn mua đơn hàng khác" class="hidden" onclick="chooseCheckboxReason(this)"> 
			         	<label for="checkbox_1">Tôi muốn mua đơn hàng khác</label>
		         	</li>
		         	<li style="margin-bottom: 10px;">
			         	<input type="checkbox" id="checkbox_3" name="check_3" value="Tôi tìm chỗ khác giá tốt hơn" class="hidden" onclick="chooseCheckboxReason(this)"> 
			         	<label for="checkbox_3">Tôi tìm chỗ khác giá tốt hơn</label>
		         	</li>
		         	<li style="margin-bottom: 10px;">
		         		<span>Hoặc nhập lý do khác</span>
		         	</li>
		         	<li style="margin-bottom: 10px;">
		         		<textarea class="reason" name="check_4" placeholder="Nhập nội dung góp ý"></textarea>
		         	</li>
	         	</ul>
	         	
        </div>
    
        <!-- Modal footer --> 
        <div style="display: flex;width: 100%; padding: 0px" class="modal-footer">
          <button style="padding: 3px 5px;
    border: 1px solid #008848;
    border-radius: 4px;
    background: #ed1c24;
    color: #fff;
    text-transform: uppercase;
    text-align: center;
    width: 100%;
    margin-top: 10px;
    font-weight: 600;
    min-width: unset;
    cursor: pointer;
    margin-left: 14px;
    margin-top: 2px;
    margin-right: 52px; " type="submit" class="">XAC NHAN <br> HUY DON HANG </button>
	          <input type="hidden" name="donhang_id"  id="donhang_id"  />
	          <input type="hidden" name="donhang_trangthai"  id="donhang_trangthai"  />
	          <input type="hidden" name="nguoimua_id"  id="nguoimua_id"  />
	         
          
          <button style="display: inline-block;
    overflow: hidden;
    padding: 10px 0;
    border: 1px solid #dfdfdf;
    border-radius: 4px;
    background: #dfdfdf;
    text-transform: uppercase;
    text-align: center;
    width: 100%;
    margin-top: 10px;
    font-weight: 600;
    min-width: unset;
    cursor: pointer;
    margin-left: 34px;
    margin-bottom: 7px;
    margin-right: 18px; " type="button" class=""  data-dismiss="modal">DONG</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <!-- END The Modal DEL -->
	     </div>
	     

	     <div class="happy-gift"></div>
     </div>
     <%}} }%>
     
     <!-- DON BI HUY -->
     				<%
               
                     rs = con.selectData("select  * from DonDatHang ");
                     while (rs.next()){
                    	if(rs.getInt("nguoimua_id")==check.getUsers_id()){
                    		if(rs.getInt("donhang_trangthai") == 0){
                    	
                     %>
     <div class="order sso" data-id="<%=rs.getInt("donhang_id") %>" >
	    <div class="status">
			    <div class="createdate infoOther" data-id="<%=rs.getInt("donhang_id") %>" >			
				    <div class="orderid">
				   		 <label><b>ĐH #<%=rs.getInt("donhang_id") %></b></label>
				    </div>
			     <div class="orderstatus" >			     
					     <i class="tpl-status4"></i> 
					     Huỷ giao hàng 			    	    
			     </div>
			     <div class="containerPayment">
				     <div class="row-text paymentinfo">
				     <span id="transactiontype_41819913"> 
				     	 <i class="icon-payment-check"></i> 
				    	 <span>Tiền mặt khi nhận hàng</span> 
				     </span>
				     </div>		
				 <a href="javascript:" class="btn-infostatus" onclick="return orderList.toggleOrStatus(this,<%=rs.getInt("donhang_id") %>);">Xem thêm</a>
				     	     
			     </div>
			   
			       <!-- xem them -->
				     <div class="col70 info hidden">
				    
					     <div class="row-text">
						     <span class="text-left">Người nhận:</span> 
						     <span class="text-right"> <span id="gender_41819979">Anh/Chị</span>
						     <span id="name_41819979"> 
						     <%if(khachhang5.next()){ %>	<%=khachhang5.getString("khachhang_name") %>
															<%}%> 
															<%  if(nhanvien5.next()){ %>
																<%=nhanvien5.getString("nhanvien_name") %>
															 <%} %>
						     </span> (<span id="phone_41819979">
						     <%if(khachhang6.next()){ %>	<%=khachhang6.getString("khachhang_name") %>
															<%}%> 
															<%  if(nhanvien6.next()){ %>
																<%=nhanvien6.getString("nhanvien_name") %>
															 <%} %>
						     </span>) 
						  
						     </span>
					     </div>
					     <div id="notify_receiver_41819979" class="notifyChangeReceiver hidden"></div>
					     <% ct_dh = con.selectData("select * from CT_DonHang where donhang_id = "+rs.getInt("donhang_id") + " "); 
					     
					     ct_dh.next();%>
					     <div class="row-text">
						     <span class="text-left">Địa chỉ giao:</span> 
						      <%p = con.selectData("select province_name from province where id = "+ct_dh.getInt("province"));
	                            p.next();
	                            String tenprovince = p.getString("province_name");
	                            
	                            d = con.selectData("select district from district where id = "+ ct_dh.getInt("district")+ " and province_id = " + ct_dh.getInt("province") );
                				d.next();
                				String tendistrict = d.getString("district");
                				
                				w = con.selectData("select ward from ward where id = "+ ct_dh.getInt("ward") );
                				w.next();
                				String tenward = w.getString("ward");
	                          %>
						     <span class="text-right"> <%=ct_dh.getString("diachi") %> - <%=tenward %> - <%=tendistrict %> - <%=tenprovince%> </span>
					     </div>					    
				     </div>			     
				    <!-- END xem them -->
			     <div class="ordertime">
			     <span><span class="deliveryinfo">Đã hủy lúc:</span> 12:36 14/03</span>
			     </div>
		     </div>
		     <div class="clear"></div>
	     </div>
	     <!-- INFO DON HANG -->
	     
	     <%ResultSet a = con.selectData("select * from CT_DonHang where donhang_id = " +rs.getInt("donhang_id") );
	     while(a.next()){
	    	 ResultSet sp = con.selectData("select * from product where product_id =" +a.getString("product_id") + " and product_trangthai =1" );
	 	    
		     while(sp.next()){ 
		    	 
		    	 ResultSet lohang = con.selectData("SELECT  top 1 * FROM lohang where product_id = " + sp.getInt("product_id") + "  and trangthai =1 order by hansudung ASC");
		    	 lohang.next();
		    	 String nsx = lohang.getString("ngaysanxuat");
		    	 String hsd = lohang.getString("hansudung");
		    	 date1 = simpleDateFormat.parse(nsx);
		    	 date2 = simpleDateFormat.parse(hsd);
		    	 long getdays = date2.getTime()-date1.getTime();
	        	 long day = TimeUnit.MILLISECONDS.toDays(getdays);   
	    	 
	     
	     %>     
	       <div class="item one" >
		     <div class="info">
			     <img src="${pageContext.request.contextPath}/assets/images/<%=sp.getString("product_image") %>"  class="" width="40" height="40">
			     <div>
			     <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%=sp.getString("product_id") %>"><%=sp.getString("product_name") %> </a> 
			     <span class="quantity">Số lượng: <%=a.getInt("soLuong") %></span>
			     <p class="exp">(HSD còn <%=day %> ngày)</p>
			     </div>
		     </div>
		     <div class="price">
			     <span>
			     <fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=(sp.getInt(3)-sp.getInt(3)*sp.getInt(4)/100)*a.getInt(3) %>" />₫
				</span> 
			     <label>
			     <fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=sp.getInt(3)*a.getInt(3) %>" />₫
				</label>
		     </div>
	     </div>
	     <%}} %>
	     <%ResultSet b = con.selectData("select * from CT_DonHang where donhang_id = " +rs.getInt("donhang_id"));
	     b.next();
	     %>
	     <div class="itotal" >
	     <%if(b.getInt("thanhtien")>=500000){ %>
		     <div class="more">
		     	<div>Tiền hàng : <label><fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=b.getInt(4)%>" />₫</label></div>
		     </div>
		     <div class="more">
		     	<div>Phí giao hàng: <label>0₫</label></div>
		     </div>
		
		<%}else{ %> 
		  	 <div class="more">
		     	<div>Tiền hàng : <label><fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=b.getInt(4)-25000%>" />₫</label></div>
		     </div>
		     <div class="more">
		     	<div>Phí giao hàng: <label><fmt:formatNumber type = "number" groupingUsed = "true" 
				value="25000" />₫</label></div>
		     </div>
		 <%} %>
		     <div class="top-line">
		     	<div>Tổng tiền: <label><b>
		     	<fmt:formatNumber type = "number" groupingUsed = "true" 
				value="<%=b.getInt(4)%>" />
		     	₫</b></label></div>
		     </div>
		    
		     <div class="clear"></div>
	     </div>
	     <!-- END INFO DON HANG -->
     </div>
     <%}}} %>
      <!-- END DON BI HUY -->
     </div>
    <div class="tcontent couponlist hidden" data-tab="couponlist"></div>
    <div class="tcontent wishlist hidden" data-tab="wishlist"></div>
    <div class="tcontent coronalist active hidden" data-tab="coronalist"></div>
    
</div>
		<!-- PROFILE -->
<div id="edit-profile" class="history" style="display: none;">
    <div class="profile edit">
        <div class="header">
            <a href="javascript:;" class="backhistory"><i class="icon-back"></i>Quay về lịch sử mua hàng</a>
        </div>
        <div class="frm-updateprofile">
        <!-- FORM THAY DOI THONG TIN CA NHAN -->
        
           <form action="${pageContext.request.contextPath}/update-profile" method="POST" class="profile profile-frm" id="profile-frm" >
            
            <div class="mainprofile">
       		<h3 class="title"><i class="icon-user"></i> Thông tin cá nhân</h3>
	        <div class="form-info">
	            <div class="row">
	                <div class="label">
	                <%if(khachhangGioitinh.next()){
	                	 if(khachhangGioitinh.getInt(4)==1){%>
	                
	                    <label class="genderlabel checked " data-gender="1"><i class="icon-radio"></i> Anh</label>
	                    <label class="genderlabel " data-gender="0"><i class="icon-radio"></i> Chị</label>
	                    <input class="hdgender" id="Gender" name="gioitinh" type="hidden" value="<%=khachhangGioitinh.getInt(4)%>">
	                    <%}else{%>
	                    <label class="genderlabel  " data-gender="1"><i class="icon-radio"></i> Anh</label>
	                    <label class="genderlabel checked" data-gender="0"><i class="icon-radio"></i> Chị</label>
	                    <input class="hdgender" id="Gender" name="gioitinh" type="hidden" value="<%=khachhangGioitinh.getInt(4)%>">
	                	<%  }} %>
	                
	                <%if(nhanvienGioitinh.next()){
	                	 if(nhanvienGioitinh.getInt(4)==1){%>
	                
	                    <label class="genderlabel checked " data-gender="1"><i class="icon-radio"></i> Anh</label>
	                    <label class="genderlabel " data-gender="0"><i class="icon-radio"></i> Chị</label>
	                    <input class="hdgender" id="Gender" name="gioitinh" type="hidden" value="<%=nhanvienGioitinh.getInt(4) %>">
	                    <%}else{%>
	                    <label class="genderlabel  " data-gender="1"><i class="icon-radio"></i> Anh</label>
	                    <label class="genderlabel checked" data-gender="0"><i class="icon-radio"></i> Chị</label>
	                    <input class="hdgender" id="Gender" name="gioitinh" type="hidden" value="<%=nhanvienGioitinh.getInt(4) %>">
	                	<%  }} %>
	                    
	                </div>
	            </div>
	            <div class="row js-float-label-wrapper populated">
	                <label class="required">Họ và tên</label>
	                <input required class="inputborder" id="Name" maxlength="50" name="name" placeholder="Nhập họ và tên của bạn" type="text" 
	               <%if(khachhang7.next()){ %>	value="<%=khachhang7.getString("khachhang_name") %>"
															<%}%> 
															<%  if(nhanvien7.next()){ %>
																value="<%=nhanvien7.getString("nhanvien_name") %>"
															 <%} %> >
	            </div>
	            <div class="row js-float-label-wrapper populated">
	                <label class="required">Số điện thoại</label>
	                <input class="inputborder inputblack" disabled="disabled" id="Phone" maxlength="50" name="sdt" 
	                placeholder="Nhập số điện thoại" type="text"
	                 <%if(khachhang8.next()){ %>	value="<%=khachhang8.getString("khachhang_sdt") %>"
															<%}%> 
															<%  if(nhanvien8.next()){ %>
																value="<%=nhanvien8.getString("nhanvien_sdt") %>"
															 <%} %>>
	            </div>
	            
	            <div class="row js-float-label-wrapper ">
	                <label class="required">Email </label>
	                <input required class="inputborder " id="Email"  maxlength="50" name="users_email" placeholder="Nhập email " type="email"
	               <%if(check != null){ %>  value="<%=check.getUsers_email() %>" <%} %>>
	            </div>
	            <h3><i class="icon-lock"></i> Thay đổi mật khẩu</h3>
	            <div class="row js-float-label-wrapper ">
	                <label class="required">Mật khẩu </label>
	                <input required class="inputborder " <%if(check != null){ %>  value="<%=check.getUsers_password() %>" <%} %> maxlength="50" name="users_password" placeholder="Nhập mật khẩu (Không bắt buộc)" type="password">
	            </div>
	            <input  name="users_id"  type="hidden"
	               <%if(check != null){ %>  value="<%=check.getUsers_id() %>" <%} %>>
	        </div>
    		</div>
		    <div>
		        <p class="error"></p>
		        <p class="success"></p>
			</div>
		    <div class="c-r">
		        <button type="submit"  class="btnupdprofile">Lưu thông tin chỉnh sửa</button>
		    </div>
		    
		    
   			 <div class="line"></div>
    
    		<div class="line"></div>
    		 </form >
               
			<!-- END FORM THAY DOI THONG TIN CA NHAN -->
			<div class="c-r">
		
   		 <!-- LOGOUT -->
    	<a href="javascript:void(0)" class="logout btnlogout">Thoát tài khoản</a>
    	 <!-- END LOGOUT -->
</div>

        </div>
    </div>
</div>
		<!-- END PROFILE -->

<div id="htmlloginotp" data-type="7"></div>
<div class="public-keycapcha-v3" data-key="6LfYlKYZAAAAAAHYuba0doTIvcfKWzCwz-G0dZGn"></div>
        <div class="clr"></div>
    </section>
    <%} %>
     	<!-- FOOTER -->
		<%@include file="/WEB-INF/views/layouts/customer/footer/footer.jsp" %>
		<%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp" %>
		<%@include file="/WEB-INF/views/layouts/customer/decorators/footerinfo.jsp" %>
     	<!-- END FOOTER -->
    <c:if test="${ not empty canceluser }">
	<script type="text/javascript">
	canceluser();	    
	 </script>
	 <%session.removeAttribute("canceluser");    %> 
	</c:if>
	
			<c:if test="${ not empty updateSuccess }">
		    	 <script type="text/javascript">
		    	 updateSuccess();	    
				 </script>
		    <%session.removeAttribute("updateSuccess");    %> 
		    </c:if>
		    
		    <c:if test="${ not empty updateFail }">
			    <script type="text/javascript">
			    updateFail();	    
				</script>
		    <%session.removeAttribute("updateFail");    %> 
		    </c:if>
		    
		    <c:if test="${ not empty CartFail }">
			<script type="text/javascript">
			CartFail();	    
			 </script>
			 <%session.removeAttribute("CartFail");    %> 
			</c:if>
		    
    <!--  UPDATE du lieu -->
   <script type="text/javascript">
	$(document).ready(function(){
		
		$('.updatestatus').on('click',function(){
			var donhang_id= $(this).parent().find('#donhang_id').val();
			var donhang_trangthai= $(this).parent().find('#donhang_trangthai').val();
			var nguoimua_id= $(this).parent().find('#nguoimua_id').val();
			
			
			 $.ajax({
				 
				 url: "${pageContext.request.contextPath}/view-huy/" +donhang_id,
				
				 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         		 type: "GET",
         		success: function (data)
         		{ 
         			$('#myModaldel #donhang_id').val(donhang_id);
         			$('#myModaldel #donhang_trangthai').val(donhang_trangthai);
         			$('#myModaldel #nguoimua_id').val(nguoimua_id);
         			
         			
         		}
         	});
             
		});
	 			
	});
	
	</script>
   <!--  END UPDATE du lieu -->

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>