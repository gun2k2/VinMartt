<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.text.NumberFormat"%>
<!DOCTYPE html>
<html lang="vi-VN" class="">
<head>
        <title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
        <%@include file="/WEB-INF/views/layouts/customer/decorators/title.jsp" %>
     	<%@include file="/WEB-INF/views/layouts/customer/decorators/head.jsp" %>
     	<style>
		.center-tab {
		  text-align: center;
		}
		
		.pagination {
		  display: flex;
    	  justify-content: center
		}
		
		.pagination a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		  transition: background-color .3s;
		  border: 1px solid #ddd;
		  margin: 0 4px;
		}
		
		.pagination a.active {
		  background-color: #4CAF50;
		  color: white;
		  border: 1px solid #4CAF50;
		}
		
		.pagination a:hover:not(.active) {background-color: #ddd;}
		</style>
		<style type="text/css">
	.btn-sapxep{
	
    background-color: white;
    color: black !important;
	
	}
	.btn-sapxep:hover{
	color: white !important;
	background-color: #ed1c24;
	
	}
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
</head>

<body class=" new2019" data-staticversion="2021030102">
		
		 <!-- HEADER -->
			<%@include file="/WEB-INF/views/layouts/customer/header/header.jsp" %>
		 <!-- End HEADER -->
		 
		 <!-- BODY  -->
		 
		 <section>
        <aside class="colcontent">
        		
                <div class="groupcate top">
                    <div class="groupcate-inline" data-parent="2488">
                        <div class="sub">
                                <a class="title-cate active catebreadcrumb" href="${pageContext.request.contextPath}">
                                        <h1>Trang chủ</h1>
                                </a>
                            
                                <a href="${pageContext.request.contextPath}/san-pham/${id}" class=" catebreadcrumb">
        
                                            <h2>${name }</h2>
                                </a>
                               
                        </div>
                    </div>
                    <a class="more" data-top="top"></a>
                   
                </div>
        
        		
                <div class="manufacture top maincate" style="" data-ismaincate="True" data-iscatesearch="False">
                		
                    <ul>
                    <%ResultSet logo = con.selectData("select * from logothuonghieu "); %>
                            <!-- THUONG HIEU -->
	               <%while(logo.next()){ %>
	                    <li>
	                        <a title="">
	                                <img width="65" height="40" src="${pageContext.request.contextPath}/assets/images/<%=logo.getString("logothuonghieu_img") %>" >
	                            <em></em>
	                            <i class="bhx-checkmanu"></i>
	                        </a>
	                    </li>
	             <%} %>
                            <!-- END THUONG HIEU -->
                    </ul>
                        
                </div>
                <c:if test="${ not empty ProductsPaginate }">
                 <div class="boxfilter stickysearch" >
                    <ul class="combofilter" style="display: flex;justify-content: center;" >
                        
                        <li class="subthree" style="display: flex;">
                        	<button id="km" name="category_id" value="${id}"  class="criteria-first btn-sapxep" >Khuyến mãi tốt nhất</button>
                        	<button id="bc" name="category_id" value="${id}" class="criteria-first btn-sapxep" >Bán chạy</button>
                        	<button id="moi" name="category_id" value="${id}" class="criteria-first btn-sapxep"  >Mới về</button>
                        	 
                            <button id="tangdan" name="category_id" value="${id}" class="criteria-first btn-sapxep"  >Gía Tăng dần</button>
                          
                            <button id="giamdan" name="category_id" value="${id}"class="criteria-first btn-sapxep" >Giá giảm dần</button>
                           
                            
                        </li>
                    </ul>
                </div>
                </c:if>
            <div class="choosedfilter" style="display:none;">
                <div></div>
                <a class="clearall" href="javascript:;" onclick="category.deleteAllTag();"><i class="bhx-clearfil"></i></a>
            </div>
        
       
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
                        <a href="${pageContext.request.contextPath}/chi-tiet-san-pham/${pros.product_id}"   class="saw-product ">Xem chi tiết</a>
                        
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
              
				<div class="center-tab">
				  <div class="pagination">
				   <c:forEach var="item" begin="1" end="${paginataInfo.totalPage}" varStatus="loop" >  
				   		<c:if test="${(loop.index ) == paginataInfo.currentPage }" > 
				   		 <a href="${pageContext.request.contextPath}/san-pham/${id}/${loop.index }" class="active">${loop.index }</a>	
				   		</c:if>
				   		<c:if test="${(loop.index) != paginataInfo.currentPage }" >
				   		 <a href="${pageContext.request.contextPath}/san-pham/${id}/${loop.index }" >${loop.index }</a>	
				   		</c:if> 	
				  </c:forEach>
				  </div>
				</div>
            <form action="/aj/Group/Products" id="submit-filter" method="post"><input data-val-required="" id="catid" name="frm.Info.Id" type="hidden" value="8958"><input data-val-number="" data-val-required="" id="listcatid" name="frm.CateListFilter" type="hidden" value="2443,8938"><input data-val-required="" id="manuid" name="frm.SelectedBrands.Id" type="hidden" value="0"><input data-val-required="" id="propidlist" name="frm.PropertyIdList" type="hidden" value=""><input data-val-number="" data-val-required="" id="pageIndex" name="frm.Query.Paging.PageIndex" type="hidden" value="2"><input data-val-required="" id="querySort" name="frm.Query.Sort" type="hidden" value=""><input data-val-number="" id="totalRecord" name="frm.CurrentData.Total" type="hidden" value="353"><input data-val-number="" data-val-required="" id="pageSize" name="frm.Query.Paging.PageSize" type="hidden" value="16"><input data-val-number="" data-val-required="" id="isCheckPromo" name="frm.IsPromotion" type="hidden" value="False"><input data-val-number="" data-val-required="" id="isMainCate" name="frm.IsMainCate" type="hidden" value="True"><input data-val-number="" data-val-required="" id="isLeaf" name="frm.IsLeaf" type="hidden" value="False"><input data-val-required="" id="ProvinceId" name="frm.Query.ProvinceId" type="hidden" value="3"><input data-val-required="" id="StoreId" name="frm.Query.StoreId" type="hidden" value="6463"><input data-val-required="" id="isLoadVideo" name="frm.IsLoadVideo" type="hidden" value="False"></form></div>              <div class="catesimilarfilter"></div>
                    <div class="categoryrelative-brand"></div>
                    <div class="other-categoryrelative-brand"></div>
        
        		
                <div class="manufacture bot maincate" style="" data-ismaincate="True" data-iscatesearch="False">
                        <!-- THUONG HIEU -->
                    <ul>                      
                            <%ResultSet logo1 = con.selectData("select * from logothuonghieu "); %>
                            <!-- THUONG HIEU -->
	               <%while(logo1.next()){ %>
	                    <li>
	                        <a title="">
	                                <img width="65" height="40" src="${pageContext.request.contextPath}/assets/images/<%=logo1.getString("logothuonghieu_img") %>" >
	                            <em></em>
	                            <i class="bhx-checkmanu"></i>
	                        </a>
	                    </li>
	             <%} %>
                    </ul>
                    	<!--  END THUONG HIEU -->                 
                </div>
        
                <div class="groupcate bot">
                    <div class="groupcate-inline" data-parent="2488">
                        <div class="sub">
                                 <a class="title-cate active catebreadcrumb" href="${pageContext.request.contextPath}">
                                        <h1>Trang chủ</h1>
                                </a>
                            
                                <a href="${pageContext.request.contextPath}/san-pham/${id}" class=" catebreadcrumb">
        
                                            <h2>${name }</h2>
                                </a>
                        </div>
                    </div>
                    <a class="more" data-top="bot"></a>
                   
                </div>
                    <div id="recomendcart"></div>
                    <input id="excludeProp" name="excludeProp" type="hidden" value="">
        </aside> 
                <div class="clr"></div>
            </section>
		 <!-- End BODY -->
	
   
  	<!--  FOOTER -->
  	
  	 <!-- LOADING -->
	<div class="loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
	</div>
	 <script>
        $(window).on("load",function(){
          $(".loader-wrapper").fadeOut(500);
        });
    </script>
	<!-- END LOADING -->
	<!-- CHAT -->
	<div class="container">
        <div class="chatbox">
            <div  style="position: fixed;top: 100; bottom: 39px;right: 69px;" class="chatbox__support">
                <div class="chatbox__header" style="position: unset;">
                    <div class="chatbox__image--header">
                        <img src="${pageContext.request.contextPath}/assets/images/chat.png" style="width:50px;" alt="image">
                    </div>
                    <div class="chatbox__content--header">
                        <h4 class="chatbox__heading--header">Chat support</h4>
                        <p class="chatbox__description--header">online                                                     </p>
                    </div>
                </div>
                <div  class="chatbox__messages"  >
                    <div class="boxx" id="textAreaMessage">
	                     <div class="messages__item messages__item--visitor">
	                           VinMart Supper Market 
	                     </div>
                        <div class="messages__item messages__item--visitor">
                           Chào bạn. Mình là nhân viên VinMart. Mình có thể giúp gì cho bạn không?
                        </div>
                        
                      
                       	
                        <div class="messages__item messages__item--typing">
                            <span class="messages__dot"></span>
                            <span class="messages__dot"></span>
                            <span class="messages__dot"></span>
                        </div>
                       
                       
                    </div>
                </div>
                <div class="chatbox__footer" style="position: unset;">
                    <img src="${pageContext.request.contextPath}/assets/images/icons/emojis.svg" alt="">
                    <img src="${pageContext.request.contextPath}/assets/images/icons/microphone.svg" alt="">
                    <input type="text" id="textMessage" placeholder="Write a message...">
                    <input class="chatbox__send--footer" onclick="sendMessageee();" value="Send" style="background-color:#ff2727;cursor: pointer;" type="button">
                    <img src="${pageContext.request.contextPath}/assets/images/icons/attachment.svg" alt="">
                </div>
            </div>
            <div style=" position: fixed;right: 66px;bottom: 4px;" class="chatbox__button">
                <button >button</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
			var websocket = new WebSocket("ws://localhost:8080/VinMart/chatRoomServer");
				websocket.onopen = function(message) {processOpen(message);};
				websocket.onmessage = function(message) {processMessage(message);};
				websocket.onclose = function(message) {processClose(message);};
				websocket.onerror = function(message) {processError(message);};

			
			function processMessage(message) {
				console.log(message);
				textAreaMessage.value += message.data + " \n";
			}
			function processClose(message) {
				textAreaMessage.value += "Server Disconnect... \n";
			}
			function processError(message) {
				textAreaMessage.value += "Error... " + message +" \n";
			}
				
			function sendMessageee() {
				var form=document.querySelector(".boxx")
				if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
					websocket.send(textMessage.value);
					//textMessage.value = "";
					console.log(form);
					
					 div = document.createElement("div");
					 div.className="messages__item messages__item--operator";
					  div.innerText = textMessage.value;
					  console.log(div);
					  form.appendChild(div);
					  textMessage.value = "";
				}
			}

		</script>
    <!-- END CHAT -->
   
	<!--  FOOTER -->
 <footer>
        <div class=boxfooter>
            <div class=benefits>
                <div><i class=bhx-sship></i>
                    <p>Đặt online <b>giao tận nhà ĐÚNG GIỜ</b><br>(nếu trễ tặng PMH 20.000₫)
                </div><a href=""><i
                        class=bhx-swap></i>
                    <p>Đổi, trả sản phẩm <b>trong 7 ngày</b></p>
                </a>
            </div>
            <div class=detail>
                <aside>
                    <div class=callcenter><i class=bhx-call></i> Tổng đài: <a href=tel:19001908>1900.1908</a> - <a
                            href=tel:02836229900>028.3622.9900</a> (7:00 - 21:30)</div>
                    <div class=linkstatic><a href="">Chính sách giao hàng</a> <a
                            href="">Chính sách đổi trả</a> <a
                            href="">Liên hệ</a> <a href="" target=_blank
                            rel=noopener>Hóa đơn điện tử</a> <a href="">Hướng dẫn mua hàng</a> <a
                            href="">Quy chế hoạt động</a> <a href=""
                            class=recruitment target=_blank rel=noopener>Tuyển dụng </a> <a
                            href="" class=hot-Job target=_blank
                            rel=noreferrer><strong>6.378</strong> công việc đang chờ bạn</a></div>
                    <div class=webmember>
                        <div class=logo-member><span>Website thành viên</span>
                            <div class=link-member><a href="https://www.thegioididong.com/" target=_blank
                                    aria-hidden=true rel=noopener><i class=bhx-tgdd></i></a> <a
                                    href="https://www.dienmayxanh.com/" target=_blank aria-hidden=true rel=noopener><i
                                        class=bhx-dmx></i></a> <a href="https://www.maiamtgdd.vn/" target=_blank
                                    aria-hidden=true rel=noopener><i class=bhx-maiam></i></a></div>
                        </div>
                    </div>
                </aside>
                <aside>
                    <div class=stores>
                        <div><i class=bhx-footer-purchase></i><a href="" class=purchaselink>Đăng ký chào
                                hàng vào Vinmart</a></div>
                        <div><i class=bhx-stores></i><a href="">Hệ thống <span>1.755</span> cửa hàng
                                Vinmart</a></div>
                    </div>
                    <div class=socail>
                        <div class=social-left><a
                                href="http://online.gov.vn/HomePage/CustomWebsiteDisplay.aspx?DocId=43376" target=_blank
                                class=bhx-bct aria-hidden=true rel=noopener></a> <a
                                href="https://www.dmca.com/Protection/Status.aspx?ID=ef7c58db-1070-4726-9941-843b4ef9a243&amp;refurl=https://www.bachhoaxanh.com/"
                                title="DMCA.com Protection Status" class=dmca-badge> <img width=100 height=20 class=lazy
                                    data-src="https://images.dmca.com/Badges/dmca-badge-w100-5x1-11.png?ID=ef7c58db-1070-4726-9941-843b4ef9a243"
                                    alt="DMCA.com Protection Status"> </a></div>
                        <div class=social-right>
                            <div class=fb-like data-href="https://www.facebook.com/sieuthibachhoaxanh/" data-width=90px
                                data-layout=button_count data-action=like data-size=small data-show-faces=false
                                data-share=false></div><a href=https://www.youtube.com/channel/UCF7OPnbn3u8OivdD4cqBkRQ
                                target=_blank aria-hidden=true rel=noopener>
                                <div class=g-ytsubscribe data-channelid=UCF7OPnbn3u8OivdD4cqBkRQ data-layout=default
                                    data-count=hidden></div>
                            </a>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
        <div class=copyright>© 2018. Công Ty Cổ Phần Dịch Vụ Thương Mại Tổng Hợp VinCommerce
            MSDN: 0104918404 do Sở Kế hoạch và Đầu tư TP. Hà Nội cấp lần đầu ngày 20/09/2010
            Đăng ký thay đổi lần thứ 42 do Sở Kế hoạch Đầu tư TP. Hồ Chí Minh ngày 13/02/2020. <a href="">Xem chính
                sách sử dụng web</a></div>
    </footer>
    <!--  END FOOTER -->
    <div id="back-top" style="display: block;">↑<span>Lên đầu trang</span></div>
    <div style="position: relative">
        <div id="mp-notification-DwGe8YX487" class="mp-notification-element-wrapper">
        <div class="mp-notification-element-button-wrapper">
            <div class="mp-notification-element ">
                <a href="javascript:void(0)"   id="mp-notification-button-open">
                    <img src="https://static.mepuzz.com/images/bell-icon.png" class="mp-notification-element-button-img">
                </a>
               
            </div>
        </div>
     
    </div>
    </div>
  
    <script>
    <%@include file="/WEB-INF/views/layouts/customer/js/Chat.js" %>
    </script>
     <script>
    <%@include file="/WEB-INF/views/layouts/customer/js/app.js" %>
    </script>
  	
  	<!-- END FOOTER -->
  	 	<script type="text/javascript">
  	 
    $(document).ready(function() {
        $('#km').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/khuyenmai",
                data: {category_id:${id}},
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#tangdan').click(function() {
        
            $.ajax({
            	method:"POST",
            	
                url: "${pageContext.request.contextPath}/tangdan",     
                data: {category_id:${id}},
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
    });
});
    
    $(document).ready(function() {
        $('#giamdan').click(function() {
        
            $.ajax({
            	method:"POST",
            	
                url: "${pageContext.request.contextPath}/giamdan",     
                data: {category_id:${id}},
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
    });
});
    
    $(document).ready(function() {
        $('#bc').click(function() {
        
            $.ajax({
            	method:"POST",
            	
                url: "${pageContext.request.contextPath}/banchay",     
                data: {category_id:${id}},
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
    });
});
    
    $(document).ready(function() {
        $('#moi').click(function() {
        
            $.ajax({
            	method:"POST",
            	
                url: "${pageContext.request.contextPath}/sapxepspmoi",     
                data: {category_id:${id}},
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
    });
});
  	
  	</script>
  	

	<%@ include file="/WEB-INF/views/layouts/customer/decorators/footer.jsp" %>
   <!-- END FOOTER -->
    </body>
	<!-- END BODY  -->
</html>