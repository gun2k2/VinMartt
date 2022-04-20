<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
<%@page import="VinMart.entities.Products"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>


                
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
                   
                