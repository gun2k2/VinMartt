<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="vi-VN" class="">
<head>
        <title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
        <%@include file="/WEB-INF/views/layouts/customer/decorators/title.jsp" %>
     	<%@include file="/WEB-INF/views/layouts/customer/decorators/head.jsp" %>
     	<style>
     	.saw-product{
	display: block;
    overflow: hidden;
    font-size: 15px;
    font-weight: bold;
   
    text-align: center;
    text-transform: uppercase;
    padding: 10px 0;
    position: absolute;
    left: 20px;
    right: 20px;
    bottom: 10px;
    cursor: pointer;
    border-radius: 4px;
    border: 1px solid #ed1c24;
    background-color: #ed1c24;
    color: white !important;
    height: 9%;
    }
     	</style>
     	<style type="text/css">
     	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
     	</style>
</head>
<body class=" new2019">

	<%@include file="/WEB-INF/views/layouts/customer/header/header.jsp" %>
<!-- Body -->
<div id="toast"></div>
	<section>
		
		<aside class="colcontent">
			<!-- SLIDE -->
            <div class="slide-home owl-carousel owl-theme owl-loaded owl-drag" data-lazy="True">
                <div class="owl-stage-outer">
                    <div class="owl-stage"
                        style="transform: translate3d(-3920px, 0px, 0px); transition: all 0.25s ease 0s; width: 10780px;">
                        <div class="owl-item active" style="width: 980px;"><a
                                href=""
                                style="background:#1D92D5" data-id="2532"> <img class="owl-lazy"
                                    data-src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/bat-nap-chai-uong-thoai-mai-cung-pepsi-giam-cuc-soc-den-25-1612202014435.jpg"
                                    alt="BẬT NẮP CHAI, UỐNG THOẢI MÁI CÙNG PEPSI GIẢM CỰC SỐC ĐẾN 25%" width="360"
                                    height="130" title="BẬT NẮP CHAI, UỐNG THOẢI MÁI CÙNG PEPSI GIẢM CỰC SỐC ĐẾN 25%"
                                    src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/bat-nap-chai-uong-thoai-mai-cung-pepsi-giam-cuc-soc-den-25-1612202014435.jpg"
                                    style="opacity: 1;"> </a>
                        </div>
                        <div class="owl-item" style="width: 980px;"><a
                                href=""
                                style="background:#1D92D5" data-id="2532"> <img class="owl-lazy"
                                    data-src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/bat-nap-chai-uong-thoai-mai-cung-pepsi-giam-cuc-soc-den-25-1612202014435.jpg"
                                    alt="BẬT NẮP CHAI, UỐNG THOẢI MÁI CÙNG PEPSI GIẢM CỰC SỐC ĐẾN 25%" width="360"
                                    height="130" title="BẬT NẮP CHAI, UỐNG THOẢI MÁI CÙNG PEPSI GIẢM CỰC SỐC ĐẾN 25%"
                                    src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/bat-nap-chai-uong-thoai-mai-cung-pepsi-giam-cuc-soc-den-25-1612202014435.jpg"
                                    style="opacity: 1;"> </a>
                        </div>
                        <div class="owl-item cloned" style="width: 980px;"><a
                                href="" style="background:#007251"
                                data-id="1776"> <img
                                    src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/rau-an-toan-4kfarm-05022021194131.jpg"
                                    alt="Rau An Toàn 4KFarm" width="360" height="130" title="Rau An Toàn 4KFarm"> </a>
                        </div>
                        <div class="owl-item cloned" style="width: 980px;"><a
                                href=""
                                style="background:#2D80CC" data-id="2741"> <img class="owl-lazy"
                                    data-src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/phu-nu-dieu-xai-hang-hieu-2602202115572.jpg"
                                    alt="PHỤ NỮ ĐIỆU XÀI HÀNG HIỆU" width="360" height="130"
                                    title="PHỤ NỮ ĐIỆU XÀI HÀNG HIỆU"
                                    src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/phu-nu-dieu-xai-hang-hieu-2602202115572.jpg"
                                    style="opacity: 1;"> </a>
                        </div>
                        <div class="owl-item cloned" style="width: 980px;"><a
                                href="" style="background:#FFFC01" data-id="2743">
                                <img class="owl-lazy"
                                    data-src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/hoa-don-50k-duoc-mua-gia-soc-010320219263.jpg"
                                    alt="HÓA ĐƠN 50K ĐƯỢC MUA GIÁ SỐC" width="360" height="130"
                                    title="HÓA ĐƠN 50K ĐƯỢC MUA GIÁ SỐC"
                                    src="https://cdn.tgdd.vn/bachhoaxanh/banners/2505/bat-nap-chai-uong-thoai-mai-cung-pepsi-giam-cuc-soc-den-25-1612202014435.jpg"
                                    style="opacity: 1;"> </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END SLIDE -->
            
            <!-- Nhom hang thuong mua -->
            <div class="groupcate">
                <div class="namegroup">Nhóm hàng thường mua</div>  
                <div class="listgroup" style=" display: flex; ">         
                  <c:forEach var="item" items="${Spbanchay}" >
								 <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${item.product_id}"> 
								 	<img width="45" class="lazy initial loaded" height="45" data-src="${pageContext.request.contextPath}/assets/images/${item.product_image}"
								 	 alt="${item.product_name}" src="${pageContext.request.contextPath}/assets/images/${item.product_image}" data-was-processed="true"> 
								 	<span>${item.product_name}</span> 
								 </a>
				</c:forEach>
                </div>         
            </div>
            <!-- End Nhom hang thuong mua -->
            
             <!--PRODUCT 1-->
        <div class="groupfeature groupfeaturefresh " data-group="0" id="group-0" data-cate="8686" data-reference="e437b2bc822e415886a7b5a4fe469a92" data-cachekey="bhx.webapi.Controllers.ProductController.GetHomeData__3,6463,0,null,False" data-source="NOCACHE" data-createcache="3/1/2021 9:51:43 PM">
                <div class="banner">
                   <%ArrayList<Products>  dsSanPhamm = new cartDao().getDsSanPham();%>
                    <div class="countproduct" style="left:51px;">
                    
                        <span class="totalproduct"><%=dsSanPhamm.size()%></span>
                        
                        <span class="text">sản phẩm</span>
                    </div>
                    <div class="location-apply" style="right:161px;">(Thử nghiệm tại Quận 9, Lê Văn Việt)</div>
                </div>
               
            <div class="cate-list">
             <c:forEach var="item" items="${cateTop8}">
             	<c:if test="${ item.p_id ==0}">
             		<c:forEach items="${cate}" var="item_con" >	
                    	<c:if test="${ item_con.p_id == item.category_id }">	
			                    <a href="${pageContext.request.contextPath}/san-pham/${item_con.category_id}" title="${item_con.category_name}" class="e437b2bc822e415886a7b5a4fe469a92  cate-item" >
			                        <span>
			                    ${item_con.category_name}  </span>
			                    </a>
                    	</c:if>
                    </c:forEach> 
                </c:if>
            </c:forEach>              
            </div>
           
        <ul id="loadpro" class="cate cateproduct">     
        <c:forEach var="pros" items="${pro}">      
            <li class="productlist product fruit " data-product="232886" data-sku="9934288000036"> 
                <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}" title="${pros.product_name}">
                        <div class="boximg center" title="${pros.product_name}">
                            <img width="160" height="160" src="${pageContext.request.contextPath}/assets/images/${pros.product_image}"/>" alt="${pros.product_name}">
                        </div>
                        <div class="product-name">${pros.product_name}</div>
                        <c:if	test="${pros.product_discount == 0 }">	
	                        <div class="price">
	                        <strong><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${pros.product_price}" />₫</strong>
	                        </div>
                        </c:if>
                        
                        <c:if test="${ pros.product_discount != 0 }">
	                        <div class="price">
	                        <strong><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${pros.product_price-pros.product_price*pros.product_discount/100}" />₫</strong>
	                        </div>
                        </c:if>
                </a>

                <a  class="saw-product "  title='Mua ngay' href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}">Xem chi tiết</a>
                <div class="updown ">
                    <div class="down"><span></span></div>
                    <input class="number" value="0" maxlength="50" pattern="[0-9]*" type="number">
                    <div class="up"><span></span><span></span></div>
                </div>
            </li>
            </c:forEach>
        </ul>
            <div onclick="loadMore();"  class="viewmore noafter" >
                Xem thêm 8 sản phẩm </div>
            
        </div>
            <!-- END PRODUCT 1-->
            
             <!-- PRO DUCT 2-->
            <div class="groupfeature"  data-cachekey="" data-source="" data-createcache="1/1/0001 12:00:00 AM">
                <h2 class="hometitle">Sản phẩm khuyến mãi</h2>
                <ul id="loadtraicay" class="cate cateproduct">
               
                <c:forEach var="pros" items="${proKm}">  
               
                    <li class="product combo producttraicay"  data-maxqtyonbill="0">
                        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}">
                            <div class="feature-image" title="${pros.product_name}">
                               
                                <div class="layout2">
                                <div class="product-box">
                                    <div class="combofeauture-name" style="color:#000">${pros.product_name}</div>
                                    <div class="product-line" style="border-color:#000"></div>
                                </div>
                                <div class="product-percent">-${pros.product_discount}%</div>
                                <div class="group-price">
                                    <span class="product-base-price" style="color:#000"><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${pros.product_price}" />₫</span> 
                                    <span class="product-price" style="color:#000"><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${pros.product_price-pros.product_price*pros.product_discount/100}" />₫</span>
                                </div>
                                <div class="box-image">
                                    <img class="lazy initial loaded" alt="${pros.product_name}" width="234" height="205" 
                                    data-src="<c:url value="/assets/images/${pros.product_image}"/>" 
                                    src="${pageContext.request.contextPath}/assets/images/${pros.product_image}"/>" data-was-processed="true">
                                </div>
                                </div>
                            </div>
                        </a> 
                        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}" class="saw-product ">Xem chi tiết</a>
                        <div class="updown"><div class="down"><span></span></div>
                            <input class="number" value="0" maxlength="50" pattern="[0-9]*" type="number">
                            <div class="up"><span></span><span></span></div>
                         </div>
                    </li>
                    
                    </c:forEach>
                   
                </ul>
                <div onclick="loadMore1();" class="viewmore noafter"  >Xem thêm 8 sản phẩm khuyến mãi</div>
            </div>     
            <!-- END PRO DUCT 2-->                 
        </aside>	
		<div class="clr"></div>
    </section>
    
    
   <!-- END Body -->
   <!--  FOOTER -->
	  	<%@ include file="/WEB-INF/views/layouts/customer/footer/footer.jsp" %>
	  	     	    <script defer async src="//cdn.tgdd.vn/bachhoaxanh/www/Scripts/min/product.min.v202103051029.js"></script>

 <script type="text/javascript">
 	function loadMore(){
 		var amount = document.getElementsByClassName("productlist").length;
 			$.ajax({
 				url:"${pageContext.request.contextPath}/Loads",
 				type:"get",
 				data: {
 					amount: amount
 				},
 				success:  function(data){
 					var row= document.getElementById("loadpro");
 					row.innerHTML +=data;
 				},
 				error: function(xhr){
 					 
 				}
 			});
 	}
 
 </script>
  <script type="text/javascript">
 	function loadMore1(){
 		var amount = document.getElementsByClassName("producttraicay").length;
 			$.ajax({
 				url:"${pageContext.request.contextPath}/LoadsTraiCay",
 				type:"get",
 				data: {
 					amount: amount
 				},
 				success:  function(data){
 					var row= document.getElementById("loadtraicay");
 					row.innerHTML +=data;
 				},
 				error: function(xhr){
 					 
 				}
 			});
 	}
 
 </script>
   	  	
		<%@ include file="/WEB-INF/views/layouts/customer/decorators/footer.jsp" %>
	   <!-- END FOOTER -->
	   <%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp" %>
   <c:if test="${ not empty login }">
	<script type="text/javascript">
	login();	    
	 </script>
	 <%session.removeAttribute("login");    %> 
	</c:if>
	
</body>
</html>

