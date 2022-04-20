<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.dao.cartDao"%>

					
                    <!DOCTYPE html>
<html>

<body>
   <div id="gun2k2"  class="boxproduct group ">
        
                <ul class="cate">           
                <!-- SAN PHAM -->
                <c:forEach var="pros" items="${ProductsPaginate}" varStatus="loop">   
                    <li class="hideExpired  product hasNotUnit " data-maxqtyonbill="0" data-priceonbill="30.000₫" data-personalize="false">           
                        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}" 
                        title="${pros.product_name}">
                            <div class="boximg" title="${pros.product_name}">
                              <img width="160" height="160" src="${pageContext.request.contextPath}/assets/images/${pros.product_image}" alt="${pros.product_name}">
                    		</div>
                                <h3 class="product-name">${pros.product_name}</h3>
                                    <div class="removepoint">
                        
                                    </div>
                            <div class="price">
                                <strong><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${pros.product_price-pros.product_price*pros.product_discount/100}" />₫</strong>
                                    <span><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="${pros.product_price}" />₫</span>
                                  <label>-${pros.product_discount}%</label>
                               
                            </div>                  
                        </a>
        				 
        				 <!-- BUTTON MUA SAN PHAM -->
                        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}" class="buy ">Xem chi tiết</a>
                        <div class="updown ">
                            <div class="down"><span></span></div>
                            <input class="number" value="0" maxlength="50" pattern="[0-9]*" type="number">
                            <div class="up"><span></span><span></span></div>
                        </div>
                        <!-- END BUTTON MUA SAN PHAM -->
                    </li>
                    <c:if test="${ (loop.index + 1) % 4 == 0 || (loop.index + 1)  == ProductsPaginate.size() }">
							</ul>
									
									<c:if test="${ (loop.index + 1) < ProductsPaginate.size() }">
										
											<ul class="cate">
									</c:if>
					</c:if>
                   
                    </c:forEach>
                    
                    </div>
                    <!-- END SAN PHAM -->
        </body>
</html>