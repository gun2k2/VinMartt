<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.cartDao"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.Users"%>
 <header class="sticky" data-isexitscookies="True" data-isexitsdistrict="True" 
 data-isexitsstore="True" data-isuserhadorder=""  data-isonedistrict="False" data-selectbyuser="True" style="top: 0px; position: fixed;">
        <div class="tophead">
        <%ArrayList<Products>  gioHang = new cartDao().getGioHang();%>
        
            <!--Logo-->
            <a href="${pageContext.request.contextPath}" class="logo" aria-hidden="true">
            <img style="width: 100%;margin-top: -24px;" src="https://vinmart.com/images/logo_2.png"> </a>
            <!-- End Logo-->
            <div class="locationContainer">
            <div class="locationUser">
            <div class="location_left"><i class="far fa-user-circle"></i>
            <div class="pulse"></div>
            <!-----kiem tra ton tai session de hien thi login--->
            <c:if test="${ empty LoginInfo }">
            	<div class="current_locate">
            <a class="login-res" href="${pageContext.request.contextPath}/login"><span class="shipto">Đăng nhập với: Vinmart </span></a>
	            <br>
	        <a class="login-res" href="${pageContext.request.contextPath}/register"><span class="shiptoHere">Đăng ký: Vinmart</span> </a>
	            
			</div>
            </c:if>
            
             <c:if test="${ not empty LoginInfo }">
            	<div class="current_locate">
            <span class="shipto">Chào bạn </span>
            <br>
            
	        <a class="login-res" href="${pageContext.request.contextPath}/logout"><span class="shiptoHere">Đăng xuất</span> </a>
	       	
	      <c:if test="${ LoginInfo.role_id  == 1 || LoginInfo.role_id  == 2 || LoginInfo.role_id  == 4 || LoginInfo.role_id  == 5 || LoginInfo.role_id  == 6 || LoginInfo.role_id  == 7 || LoginInfo.role_id  == 8 }">
	        	<a class="login-res" href="${pageContext.request.contextPath}/admin-page"><span class="shipto">ADMIN </span></a>
	   		</c:if>
            </div>
            </c:if>
            
            <div class="clr"></div>
            </div>
            </div>
            </div>
            <div class="popup-overlays"></div>
            
     		<!-- Header tìm kiếm và đơn hàng và đăng nhập và giỏ hàng  -->
            <div class="hiscart">
            				<!-- Search -->
                <form class="mainsearch" action="${pageContext.request.contextPath}/tim-kiem" method="get">
                    <div class="easy-autocomplete" style="width: 385px;">
                        <input type="text" name="q" id="search" placeholder="Bạn tìm gì..." maxlength="80"
                            aria-label="text-search" autocomplete="off" required>
                        <div class="easy-autocomplete-container" id="eac-container-text-search">
                            <ul></ul>
                        </div>
                    </div>
                    <div class="reset"><i class="bhx-closemenu"></i></div>
                    <button type="submit" aria-label="Search"> <i class="bhx-search"></i>
                        <div class="btn-search"><span>TÌM</span></div>
                    </button>
                </form>
                <%  ConnectionToDB con = new ConnectionToDB();
					ResultSet dm = null;     
                    String query = request.getParameter("q");
                                         	
                    String data;
                    if(query!=null)
                     {
                      data = "select * from product where name like '%"+query+"%'  ";
                      }else{
                      data = "select * from product order by id asc";
                      }                      	
                    
                         %>
                			<!-- END Search -->
                <c:if test="${ not empty LoginInfo }">
                <a href="${pageContext.request.contextPath}/lich-su-mua-hang/${ LoginInfo.users_id }" class="histories">Đơn hàng<br>của bạn</a>
                </c:if>
               <div class="hiscart shownoti">
                <a href="${pageContext.request.contextPath}/gio-hang" class="temcart no">
                    <div>
                    <i class="bhx-cart"></i> 
                     <span class="">  
                     <%float tongcong =0;  int sum=0; for(int i = 0;i<gioHang.size();i++){ 
                    	 sum+=gioHang.get(i).getProduct_soLuongMua();
                    	 tongcong +=(gioHang.get(i).getProduct_price()-gioHang.get(i).getProduct_price()*gioHang.get(i).getProduct_discount()/100)*gioHang.get(i).getProduct_soLuongMua();%>  
        			<input type="hidden" value="<%=gioHang.get(i).getProduct_soLuongMua() %>" />
                    <%} %>
                     <%=sum %>
                    </span>
                    
                    </div>
                    
                    <div ><b class="card">THANH TOÁN</b> <b class="sumorder"><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=tongcong%>"/>₫</b>
					</div>
                </a>
                
                   <div class="header-cart-detail" >
	            <div  class="header-cart-products" style="display: grid;">
	            <%if(gioHang.size()>0){ %>
	            	<%for(int i = 0;i<gioHang.size();i++){ %>
		            <div  class="row header-cart-item">
			            <div  class="col-xs-3 header-cart-item-img">
				            <img class="notify-img"   src="${pageContext.request.contextPath}/assets/images/<%out.print(gioHang.get(i).getProduct_image()); %>">
				        </div>
				            <div   class="col-xs-9 header-cart-item-section">
					            <div   class="row">
					            	<a   title="<%out.print(gioHang.get(i).getProduct_name()); %>" class="col-xs-12 header-cart-item-name"><%out.print(gioHang.get(i).getProduct_name()); %></a>
					            </div>
					            <div  class="row mt5" style="display: flex;justify-content: space-between;">
						            <div   class="col-xs-4 text-left header-cart-qty">
						                    x<%=gioHang.get(i).getProduct_soLuongMua() %>
						            </div>
						            <div   class="col-xs-8 text-right header-cart-price colormoney">
						                   <fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=(gioHang.get(i).getProduct_price()-gioHang.get(i).getProduct_price()*gioHang.get(i).getProduct_discount()/100)*gioHang.get(i).getProduct_soLuongMua()%>" />đ
						            </div>
					            </div>
				           </div>
		           </div>
		           <%} %>
		           <%}else{ %>
		           <h1 class="nocart"><b>KHÔNG CÓ SẢN PHẨM TRONG GIỎ HÀNG</b></h1>
		           <%} %>
	             </div>
	             <div   class="header-cart-total-row">
		             <div   class="header-cart-total-text">
		             	 Có tổng số <%=sum %> sản phẩm
		             </div>
		             <div   class="header-cart-total-price">
			              Tổng tiền
			              <span class="colormoney" >
			              <fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=tongcong%>"/>đ
			              </span>
			              
		              </div>
	              </div>
	           <%if(gioHang.size()>0){ %>   
	          <a href="${pageContext.request.contextPath}/gio-hang"  class="header-cart-go-to-cart">
	            Xem chi tiết
	          </a>
	          <a href="${pageContext.request.contextPath}/check-outs"  color="white" class="header-cart-go-to-checkout">
	            Thanh toán ngay
	          </a>
	          <%} %>
          </div>
                </div>
            </div>
            <!-- END Header tìm kiếm và đơn hàng và đăng nhập và giỏ hàng  -->
        </div>
        <aside class="colmenu sb-container menu2 sb-container-noscroll">
            <div class="sb-scrollbar-container">
                <div class="sb-scrollbar" style="height: 0px; top: 0px;"></div>
            </div>
            <div class="sb-content" style="max-height: 38px;">
                <nav class="menu-hover"> 
                    <span><i class="bhx-navmenu"></i> DANH MỤC SẢN PHẨM</span>
                    <ul class="colmenu-ul">
                      <!-- Ten danh muc -->
                      <c:forEach items="${cate}" var="item" >
         			 	<c:if test="${ item.p_id ==0}">
                    	<li >
                    		<!-- Danh Muc bac 0 -->
                    		<div class="nav-parent">${item.category_name}<i class="icon-Autumn"></i></div>
                    		<!-- END Danh Muc bac 0 -->
                    		<!-- Danh Muc bac 1 -->
                    		<div class="nav-item">
                    		<c:forEach items="${cate}" var="item_con" >	
                    			<c:if test="${ item_con.p_id == item.category_id }">
	                    		<div class="parent">
	                    			<a href="${pageContext.request.contextPath}/san-pham/${item_con.category_id}" class="link-hover" data-search="${item_con.category_name}" data-keyword=""> 
	                    			${item_con.category_name}
	                    			</a>
	                    		</div>
	                    		</c:if>
		                    </c:forEach>
                    		</div>
                    		<!-- END DANH Muc bac 1 -->
                    	</li>
                    </c:if>
                    </c:forEach>
                    	 <!-- end Ten danh muc -->
                        <li class="productpromo-count">
                            <a href="/khuyen-mai"><i class="bhx-productpromo"></i>
                                <strong class="number">1.202</strong> 
                                sản phẩm khuyến mãi
                            </a>
                        </li>
                        <li class="product-expired">
                            <a href="/khuyen-mai/xa-kho-gia-soc"><i class="bhx-productexpired"></i>Xả kho giá sốc</a>
                        </li>
                        <li class="store-count">
                            <a href="/he-thong-sieu-thi"><i class="bhx-storecount"></i>Danh sách <strong>1.755</strong> 
                            cửa hàng
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>
    </header>