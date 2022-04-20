<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<!DOCTYPE html>
<html lang="vi-VN" class="">
<head>
        <title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
        <%@include file="/WEB-INF/views/layouts/customer/decorators/title.jsp" %>
     	<%@include file="/WEB-INF/views/layouts/customer/decorators/headcart.jsp" %>
     	<script type="text/javascript" src="https://code.jquery.com/jquery-latest.pack.js"></script>
     	
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
 
     	
     	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  		<!-- end modal -->
</head>

<body class=" new2019" id="asb" >
   <div id="toast">

    </div>
    <!-- HEADER HIDE -->
   		<%@include file="/WEB-INF/views/layouts/customer/header/headerhide.jsp" %>
	<!-- END HEADER HIDE -->
    
	
<!--  CONTENT BODY-->
        <!-- CART-->
        
        <div id="cart" class="cart-wrap" >
        
        <div class="">
     
          <div class="cart-content ">
          <div id="block1" class="">
          <div class="p-gender">
            Giỏ hàng của Bạn
        </div> 
        <div class="block">
        <div class="orderid"><span>Chỉnh sửa đơn hàng: </span> <label>#</label></div> 
        <%if(gioHang.size()>0){ %>
        <div class="lst-product discountShipFee">
        <div> 
	        <div class="lstproductbuy">
	        
	        <% int a= 0; for(int i = 0;i<gioHang.size();i++)
	        { 
	        %>
			    <div class="item">
			        <img alt="<%out.print(gioHang.get(i).getProduct_name()); %>" src="${pageContext.request.contextPath}/assets/images/<%out.print(gioHang.get(i).getProduct_image()); %>" width="60" height="60">
			        <div class="colinfo">
				        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%out.print(gioHang.get(i).getProduct_id()); %>" data-type="0" class="name"><%out.print(gioHang.get(i).getProduct_name()); %></a> 
				        <div class="expireddate"><span>Tồn kho: <%out.print(gioHang.get(i).getProduct_soluongtonkho()); %></span></div>
				        <div class="quantity">
					        <div class="quantitynum" style="display: flex;">
	<!--GIAM - SAN PHAM -->
	<input   min="1" name="product_id" max="50" type="button"  class="tanggiamsoluong giam_sp" value="-"   /> 
	
	<!--CHON SoluongL SAN PHAM -->					        
	<form id="form_input" action="${pageContext.request.contextPath}/XuLyMuaHang?product_id=<%=gioHang.get(i).getProduct_id()%>&action=update" method="post">
	<input   name="sl" type="number" min="1" max="50" value="<%out.print(gioHang.get(i).getProduct_soLuongMua()); %>" class="sl qty"> 
	<input type="text" hidden="true" value="<%=gioHang.get(i).getProduct_id()%>" id="product_id_<%=i%>" />
	<input type="text" name="soluong_tonkho" hidden="true" value="<%out.print(gioHang.get(i).getProduct_soluongtonkho()); %>" class="soluong_tonkho" />
	<input  value="Xác nhận" hidden="true" type="submit" class="toast--success xacnhan "/>
	<input type="text" hidden="true" value="<%out.print(gioHang.get(i).getProduct_soLuongMua()); %>" class="sl_bandau" name="sl_bandau"/>
	</form>
	
	<!--THEM + SAN PHAM -->
	<% if(gioHang.get(i).getProduct_soluongtonkho()==0) {%>
	
	<%}else{ %>
	<input  name="product_id" min="1" max="50" type="button" class="tanggiamsoluong them_sp" value="+"  /> 
		<%} %>			        
					        </div>
					          <a  class="delete xoa_sp" onclick="xoaSPGHthanhcong();" 
					        >Xóa</a>
					        <input type="hidden" value="<%out.print(gioHang.get(i).getProduct_id()); %>"  id="product_id"  />
				        </div>  <div class="npromotion"></div> 
			        </div>
			      
			        <div class="colmoney">
				        <div><strong>
				        	<fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=(gioHang.get(i).getProduct_price()-gioHang.get(i).getProduct_price()*gioHang.get(i).getProduct_discount()/100)*gioHang.get(i).getProduct_soLuongMua()%>" />₫</strong> 
					        <span class="price-discount">
					                    <fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=(gioHang.get(i).getProduct_price())*gioHang.get(i).getProduct_soLuongMua()%>" />₫
					        </span>
				         </div>
			         </div>
			        
			   </div>
			   <%} %>
	       </div>
	         </div>
         </div> 
         
        <div>
        <div class="discountship">
        <div class="muathem"><a href="${pageContext.request.contextPath}"> Mua thêm</a></div>
           sản phẩm (Ưu đãi giảm phí giao áp dụng khi mua với giá trị đơn hàng <b>trên 500k</b>)
        </div>  
        </div>
        <%}else{ %>
        <h1>Không có sản phẩm trong giỏ hàng !</h1>
        
        <%} %>
         
        <div class="billproBox cart-recommend"></div> 
	        <div class="summary">
		        <div class="row1">
			        <div class="col55">
				        <div class="cost">
					        <span>Tiền hàng: </span> 
					        
					        <label id="carttotal"><b>
					        <fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=tongcong%>"/>₫</b></label>
					      
				        </div>
				        <div class="shipfee">
					        <span>
						        <a class="inline-shipfree"><i class="bhx-qstshipfree"></i></a> 
						       
						        <b>Phí giao dự kiến</b>
						           :
					        </span> 
					   
					        <label class="rightshiping">
					        <%if(tongcong>=500000){ %>
					        <span>FREESHIP</span>
					        <%}else{ %>
					        <span>25.000₫</span>
					        <%} %>
					        </label>
				        </div>
				        <div class="text-shipfree">
					        <span class="text-green">
					      	  <a target="_blank" href="${pageContext.request.contextPath}" title="Chính sách giao hàng">(Phí sẽ được cập nhật sau khi có sản phẩm) </a>
					        </span>
				        </div>
				        <a href="javascript:;" class="couponlink">
				        	<i class="icon-use-voucher"></i> Dùng phiếu mua hàng
				        </a>
			        </div>
		        </div>
		        <div class="billproBox"></div> 
		        <div class="btn-order">
		        <%if(gioHang.size()>0){ %>
			        <a href="${pageContext.request.contextPath}/check-outs" type="button" class="btn-og btn-step">ĐẶT HÀNG</a> 
			        <%}else{ %>
			        <a href="${pageContext.request.contextPath}" type="button" class="btn-og btn-step">TIẾP TỤC MUA HÀNG</a> 
			        <%} %>
			        <form accept-charset="UTF-8"  action="Xoatatca" method="post"  enctype="multidata/form-data">		
			        <%  for(int i = 0;i<gioHang.size();i++)
				        {
				        %>
			        <input hidden="true" name="product_idDel[]" value="<%out.print(gioHang.get(i).getProduct_id()); %>">  
			        <%} %>      
			        <div class="clearall del-all"><button  type="submit" >XÓA GIỎ HÀNG</button></div>
			        </form>
		        </div>
	        </div> 
        <div class="clr"></div>
        </div> 
        
        <!-- San pham khuyen mai -->
        <div class="billproBox">
	        <div class="billpro">
		        <div class="bill-promotion-title">
		        <div class="box-title"><i class="icon-promotion"></i>ƯU ĐÃI ĐẶC BIỆT CHO bạn </div>
		        </div>
		        <div data-choose="2" class="bill-item">
		        <div class="text">Hoá đơn 50.000₫ được mua sản phẩm giá sốc</div> 
			        <div class="g-lst-item owl-lst-item owl-carousel owl-theme owl-loaded owl-drag">
				        <div class="owl-stage-outer">
					        <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all 0s ease 0s; width: 827px;">
						     
						      <!-- START -->
						      <% 
                    			ConnectionToDB conn = new ConnectionToDB();  
                                ResultSet rs = conn.selectData("select * from product where product_trangthai =1 ");
								%>
								<%while(rs.next()){%>  
                                 <%if(rs.getInt(4)!=0){ %>   
						        <div class="owl-item active" style="width: 206.667px;">
							        <div class="g-item">
								        <div class="it-top">
									        <img alt="<%=rs.getString(2)%>" 
							src="${pageContext.request.contextPath}/assets/images/<%=rs.getString("product_image")%>" width="100" height="100"> 
									        <div>- <%=rs.getInt(4)%>%</div>
								        </div>
								        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%=rs.getInt(1)%>" title="<%=rs.getString(2)%>" class="name">
								       		 <%=rs.getString(2)%>
								        </a>
								        <div class="pris">
									        <span class="pri">
									<fmt:formatNumber type = "number" groupingUsed = "true" 
									value="<%=rs.getInt(3)-rs.getInt(3)*rs.getInt(4)/100%>" />₫</span> 
									        <span class="li-pri"> 
									<fmt:formatNumber type = "number" groupingUsed = "true" 
									value="<%=rs.getInt(3)%>" />₫</span>
								        </div> 
								        <div class="bt">
									        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%=rs.getInt(1)%>"  class="buy-bill them"><span> XEM CHI TIẾT</span></a> 
									        <div class=""><small>Tối đa 50</small></div>
								        </div>
							        </div>
						        </div>
						        <%}} %>
						      <!-- END -->  
						      
					        </div>
				       </div>
			       
			       
			       	<div class="owl-dots">
			       	<div class="owl-dot active"><span></span></div>
			       	<div class="owl-dot"><span></span></div>
			       	</div>
			       	</div>
		       	</div>
	       	 </div> 
       	 <div class="banner-gift"></div>
      </div>
       <!-- END San pham khuyen mai -->
      
   </div>
      </div>
      
    </div> <div id="profiling"></div>
    </div>
        
         <!--LOADING-->
         <div class="ajaxLoading" style="display: none;">
            <div class="pageLoading"></div>
            <div class="loading">
                <div class="loader"></div>
                <div class="text">Đang xóa dữ liệu</div>
            </div>
        </div>
        <!--END LOADING-->

        <div class="popup-overlay" style="display: none;"></div>

        <div class="popup-addtocart">
            <div class="box-img">
                <p>
                    <i class="icon-success hidden"></i>
                    <img width="100" height="100">
                </p>
                <div>Đã thêm vào <b>giỏ hàng</b></div>
            </div>
            <a href="/gio-hang" class="gotocart">Bạn có thể vào xem và <b>THANH TOÁN</b><br>tại giỏ hàng</a>
        </div>


    <!-- END CONTENT BODY-->
   

    <div id="back-top" style="display: block;">↑<span>Lên đầu trang</span></div>
    
	
    <script defer async src="//cdn.tgdd.vn/bachhoaxanh/www/Scripts/min/home.min.v202103011406.js"></script>
	<%@ include file="/WEB-INF/views/layouts/customer/decorators/footer.jsp" %>
	<%@ include file="/WEB-INF/views/layouts/customer/footer/toast.jsp" %>

	<c:if test="${ not empty addThanhCong }">
	<script type="text/javascript">
	themSPthanhcong();    
	 </script>
	 <%session.removeAttribute("addThanhCong");    %> 
	</c:if>
	
	<c:if test="${ not empty giamThanhCong }">
	<script type="text/javascript">
	truSPthanhcong();	    
	 </script>
	 <%session.removeAttribute("giamThanhCong");    %> 
	</c:if>
	
	
	<c:if test="${ not empty updateThanhCong }">
	<script type="text/javascript">
	updateSPthanhcong();	    
	 </script>
	 <%session.removeAttribute("updateThanhCong");    %> 
	</c:if>
	
	<c:if test="${ not empty xoaThanhCong }">
	<script type="text/javascript">
	xoaSPGHthanhcong();	    
	 </script>
	 <%session.removeAttribute("xoaThanhCong");    %> 
	</c:if>
	
	<c:if test="${ not empty checkouts }">
	<script type="text/javascript">
	checkouts();	    
	 </script>
	 <%session.removeAttribute("checkouts");    %> 
	</c:if>
	
	
	<c:if test="${ not empty CartFail }">
	<script type="text/javascript">
	CartFail();	    
	 </script>
	 <%session.removeAttribute("CartFail");    %> 
	</c:if>
	
	<c:if test="${ not empty Thanhtoanfail }">
	<script type="text/javascript">
	Thanhtoanfail();	    
	 </script>
	 <%session.removeAttribute("Thanhtoanfail");    %> 
	</c:if>
	
	
   	  
	 <% for(int i = 0;i<gioHang.size();i++){
	 
		
	 %>
	 <script type="text/javascript">
	 var themNode = document.querySelectorAll(".them_sp");
	 var themElement = Array.prototype.slice.call(themNode);
	 themElement.forEach(function(item){
			 item.onclick = function(e){
				 var index = Array.from(themElement).indexOf(e.target);
				 var product_id = $('#product_id_' + index).val() ;
				
				 console.log(product_id);
				  $.ajax({
	            		url: "${pageContext.request.contextPath}/XuLyMuaHang?action=them&product_id=" + product_id,
	            		
	            		type: "GET",
	            		success: function (data)
	            		{ 
	            			
	            			$("#asb").html(data);
	            		}
	            	});
	                return false; 
			 }	 	 
		 })
	
	</script>
	<%}%>
	
	<% for(int i = 0;i<gioHang.size();i++){
	 
	 %>
  <script type="text/javascript">

 	 var giamNode = document.querySelectorAll(".giam_sp");
	 var giamElement = Array.prototype.slice.call(giamNode);
	 giamElement.forEach(function(item){
			 item.onclick = function(e){
				 var index = Array.from(giamElement).indexOf(e.target);
				 var product_id = $('#product_id_' + index).val() ;
				 console.log(product_id);
				  $.ajax({
	            		url: "${pageContext.request.contextPath}/XuLyMuaHang?action=giam&product_id=" + product_id,
	            		
	            		type: "GET",
	            		success: function (data)
	            		{ 
	            			
	            			$("#asb").html(data);
	            		}
	            	});
	                return false; 
			 }	 	 
		 })
   
    </script> 
    <%} %> 
    <% for(int i = 0;i<gioHang.size();i++){
	 
	 %>
  <script type="text/javascript">  
  var xoaNode = document.querySelectorAll(".xoa_sp");
	 var xoaElement = Array.prototype.slice.call(xoaNode);
	 xoaElement.forEach(function(item){
			 item.onclick = function(e){
				 var index = Array.from(xoaElement).indexOf(e.target);
				 var product_id = $('#product_id_' + index).val() ;
				 console.log(product_id);
				  $.ajax({
	            		url: "${pageContext.request.contextPath}/XuLyMuaHang?action=xoa&product_id=" + product_id,
	            		
	            		type: "GET",
	            		success: function (data)
	            		{ 
	            			
	            			$("#asb").html(data);
	            		}
	            	});
	                return false; 
			 }	 	 
		 })
    </script> 
    <%} %>
    
     <% for(int i = 0;i<gioHang.size();i++){
	 
	 %>
	 <script type="text/javascript">  
  var tangSl = document.querySelectorAll(".xacnhan");
	 var tangElement = Array.prototype.slice.call(tangSl);
	 tangElement.forEach(function(item){
			 item.onclick = function(e){
				 var index = Array.from(tangElement).indexOf(e.target);
				 var product_id = $('#product_id_' + index).val() ;
				 console.log(product_id);
				 var sl = $('.sl').val();  
				 var soluong_tonkho = $('.soluong_tonkho').val();
				 var sl_bandau = $('.sl_bandau').val();
				 console.log(sl);
				 console.log(soluong_tonkho);
				  $.ajax({
					 	type: "GET",
					  	url: "${pageContext.request.contextPath}/XuLyMuaHang?action=update&product_id=" + product_id,
	            		data: {sl: sl,soluong_tonkho: soluong_tonkho, sl_bandau: sl_bandau}
	            		
	            		success: function (data)
	            		{ 
	            			
	            			$("#asb").html(data);
	            		}
	            	});
	                return false; 
			 }	 	 
		 })
    </script> 

 <%} %>

    <script type="text/javascript">
        var cdn = '//cdn.tgdd.vn/bachhoaxanh/www';
        if ('serviceWorker' in navigator && typeof Promise !== "undefined" && Promise.toString().indexOf("[native code]") !== -1) {
            //navigator.serviceWorker.register('/sw.js');
            //navigator.serviceWorker.getRegistrations().then(function (rs) {
            //    for (var i = 0; i < rs.length; i++) {
            //        rs[i].unregister();
            //    }
            //})
        }
    </script>
    
    <input data-rder='phone' type="hidden" />
    
</body>
</html>