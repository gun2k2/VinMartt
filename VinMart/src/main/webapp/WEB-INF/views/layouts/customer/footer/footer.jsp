 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
	
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
    <!-- LOADING -->
	<div class="loader-wrapper">
    <span class="loader"><span class="loader-inner"></span></span>
	</div>
	<!-- END LOADING -->
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
        $(window).on("load",function(){
          $(".loader-wrapper").fadeOut(500);
        });
    </script>
    <script>
    <%@include file="/WEB-INF/views/layouts/customer/js/Chat.js" %>
    </script>
     <script>
    <%@include file="/WEB-INF/views/layouts/customer/js/app.js" %>
    </script>