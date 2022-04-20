<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>
    <ul id="loadpro" class="cate cateproduct">  
		<c:forEach var="pros" items="${pro}">      
            <li class="productlist product fruit " > 
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

                 <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}" class="saw-product ">Xem chi tiết</a>
                <div class="updown ">
                    <div class="down"><span></span></div>
                    <input class="number" value="0" maxlength="50" pattern="[0-9]*" type="number">
                    <div class="up"><span></span><span></span></div>
                </div>
            </li>
            </c:forEach>
            </ul>