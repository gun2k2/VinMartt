<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
   <style>
     	
.header-cart-detail {
    background: #fff;
    max-height: 405px;
    width: 360px;
    -webkit-box-shadow: 0 0 10px 0 #bbb;
    box-shadow: 0 0 10px 0 #bbb;
    position: absolute;
    top: 43px;
    left:auto;
    right: -23px;
    z-index: 2147483647;
    color: #333;
    display: none;
    transform-origin: calc( 100% - 20px ) top; /* định ra duoc cái tâm để hiện ra, top right là góc phải trên cùng  */;
    animation: headerNotifyGrowth ease-in .2s;
}
@keyframes headerNotifyGrowth {
     from{
         transform: scale(0); /* độ lớn lên */
         opacity: 0;
     }
     to {
         transform: scale(1);
         opacity: 1;
     }
 }
.notify-img{
    width: 48px; /* rộng 48 */
    object-fit: contain; /* ảnh không bị méo */
 }
.header-cart-detail:before {
    content: " ";
    height: 0;
    position: absolute;
    width: 0;
    top: -14px;
    right: 39px;
    border: 7px solid transparent;
    border-bottom-color: #fff;
    }
    .header-cart-products {
    max-height: 327px;
    overflow-y: auto;
    overflow-x: hidden;
    font-size: 13px;
}
.header-cart-item {
    margin: 0;
    padding: 7px 0;
}
.col-xs-3 {
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
    float: left;
}
.col-xs-12{
	color: #040404;
}
.col-xs-9 {
    position: relative;
    min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
    
}
.header-cart-total-row {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: justify;
    -ms-flex-pack: justify;
    justify-content: space-between;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    border-top: 1px solid #e8e8e8;
    border-bottom: 1px solid #e8e8e8;
    padding: 7px 15px;
}
 .header-cart-go-to-cart {
    border: 1px solid #d42333;
    color: #d42333!important;
    padding: 4px 30px;
    display: block;
    margin: 5px;
    float: left;
    font-size: 13px;
}
.header-cart-go-to-checkout {
    background: #d42333;
    padding: 5px 30px;
    display: block;
    margin: 5px;
    float: right;
    font-size: 13px;
    color: #fff;
}
.colormoney{
	color:#d42333;
	font-weight: 500;
}
.shownoti:hover .header-cart-detail{

	display:block;
}
     	
.hiscart .temcart .bhx-cart {
    background-position: -256px -33px;
    width: 24px;
    height: 22px;
}
[class^="bhx-"], [class*="bhx-"] {
    background-image: url(//cdn.tgdd.vn/bachhoaxanh/www/Content/images/desktop/bhxdesk@2x.v202103021017.png);
    background-repeat: no-repeat;
    background-size: 500px auto;
    display: inline-block;
    height: 30px;
    width: 30px;
    line-height: 30px;
    vertical-align: middle;
    background-color: #131c29;
}

 </style> 
 
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  
  <!-- Nucleo Icons -->

  <link type="text/css"  href="${pageContext.request.contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
 
  <link href="${pageContext.request.contextPath}/assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  
  
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
 
 <!-- MODAL -->
 