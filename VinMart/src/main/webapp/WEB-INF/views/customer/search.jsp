<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi-VN" class="">
<head>
        <title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
       <%@include file="/WEB-INF/views/layouts/customer/decorators/title.jsp" %>
     	<%@include file="/WEB-INF/views/layouts/customer/decorators/head.jsp" %>
     	<style>
	.combofilter{
	width: 97%; important!
	
	}
	</style>
	
</head>

<body class=" new2019">
   
    <!-- HEADER HIDE -->
   		<%@include file="/WEB-INF/views/layouts/customer/header/header.jsp" %>
	<!-- END HEADER HIDE -->
	
	<!-- BODY -->
					<%
                    	request.setCharacterEncoding("UTF-8");
                    	String q = request.getParameter("q");
                    	ResultSet rs = con.selectData("select * from product where product_trangthai =1 and product_name like N'%" + q +"%'");
                    	ResultSet logo = con.selectData("select * from logothuonghieu ");
                    	ResultSet logo1 = con.selectData("select * from logothuonghieu ");
                    %>
		<section >
    <aside class="colcontent" data-select2-id="8">
        <h1 class="resulttext">Tìm thấy <b></b>kết quả phù hợp với từ khóa <b><%=q %></b></h1>
        <div class="manufacture top">
            <ul>
            <%while(logo.next()){ %>
                    <li>
                        <a >
                                <img width="65" height="40" src="${pageContext.request.contextPath}/assets/images/<%=logo.getString("logothuonghieu_img") %>" >
                            <em></em>
                            <i class="bhx-checkmanu"></i>
                        </a>
                    </li>
             <%} %>
            </ul>
        </div>
               
        <div class="choosedfilter" style="display:none;">
            <span></span>
            <a class="clearall" href="javascript:;" onclick="pagesearch.deleteAllTag();"><i class="bhx-clearfil"></i></a>
        </div>
    <div class="boxproduct">
            <ul class="cate">
            <%while(rs.next()){ %>
                <li class=" product hasNotUnit "  data-personalize="false">
                    <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/<%=rs.getString("product_id") %>" title="<%=rs.getString("product_name") %>">
                        <div class="boximg" title="Nước ngọt Coca Cola 2.25 lít">
                               <img width="160" height="160" 
                               src="${pageContext.request.contextPath}/assets/images/<%=rs.getString("product_image") %>" alt="<%=rs.getString("product_name") %>">
                        </div>
                            <h3 class="product-name"><%=rs.getString("product_name") %></h3>
                        <div class="removepoint">
                            <span>HSD còn 4 tháng</span>
                        </div>
                        <div class="price">
                            <strong><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=rs.getInt(3)-rs.getInt(3)*rs.getInt(4)/100 %>" />₫</strong>
                                <span><fmt:formatNumber type = "number" groupingUsed = "true" 
							value="<%=rs.getInt(3)%>" />₫</span>
                             <label>-<%=rs.getInt(4)%>%</label>
                        </div>                                         
                    </a>
    
                    <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}" class="buy ">Xem chi tiết</a>
                    <div class="updown ">
                        <div class="down"><span></span></div>
                        <input class="number" value="0" maxlength="50" pattern="[0-9]*" type="number">
                        <div class="up"><span></span><span></span></div>
                    </div>
    
                </li>
          <%} %>
                
            </ul>
        </div>
           
        
    
        <div class="manufacture bot">
            <ul>
                    <%while(logo1.next()){ %>
                    <li>
                        <a title="Coca Cola">
                                <img width="65" height="40" src="${pageContext.request.contextPath}/assets/images/<%=logo1.getString("logothuonghieu_img") %>" >
                            <em></em>
                            <i class="bhx-checkmanu"></i>
                        </a>
                    </li>
             <%} %>
            </ul>
        </div>
    
        
   
    
        </aside>
            <div class="clr"></div>
        </section>
	<!-- END BODY -->

   
  	<!--  FOOTER -->
  	<%@ include file="/WEB-INF/views/layouts/customer/footer/footer.jsp" %>
 
	<%@ include file="/WEB-INF/views/layouts/customer/decorators/footer.jsp" %>
   <!-- END FOOTER -->
    </body>
	<!-- END BODY  -->
</html>