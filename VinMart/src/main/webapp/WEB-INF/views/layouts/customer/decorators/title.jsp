<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
    <link rel="icon" href="https://vinmart.com/images/favicon_1.ico">
   <meta name="keywords" content="">
        <meta name="description" content=".">
		 <link rel="canonical" href="" />
		 <meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
		<meta http-equiv="x-dns-prefetch-control" content="on">
		 <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,300;0,400;0,600;1,300&display=swap" rel="stylesheet">
		<meta charset="utf-8">
		<meta name="robots" content="index, follow" />
		<meta name="format-detection" content="telephone=no">
		<meta http-equiv="audience" content="General" />
		<meta name="resource-type" content="Document" />
		<meta name="distribution" content="Global" />
		<meta name="revisit-after" content="1 days" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta http-equiv="x-dns-prefetch-control" content="on">
		<meta property="fb:app_id" content="369722380436915">
		<meta property="og:site_name" content="" />
		<meta property="og:type" content="website" />
		<meta property="og:locale" content="vi_VN" />
		<meta property="og:url" itemprop="url" content="" />
        <meta property="og:title" content="" />
        <meta property="og:description" content="" />
        <meta property="og:image" content="" />
        <meta property="og:image:secure_url" content="" />
        <meta property="og:image:type" content="image/jpeg" />
        <meta property="og:image:width" content="600" />
     	<meta property="og:image:height" content="315" />
     	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" /> 	  	
     	<script type="text/javascript" src="https://code.jquery.com/jquery-latest.pack.js"></script>
     	
     	<style>
     	<%@include file="/WEB-INF/views/layouts/customer/css/chat.css" %>
     	</style>
     	<style>
     	<%@include file="/WEB-INF/views/layouts/customer/css/style.css" %>
     	</style>
     	<style>
     	<%@include file="/WEB-INF/views/layouts/customer/css/typing.css" %>
     	</style>
     	<style>
     	
.header-cart-detail {
    background: #fff;
    max-height: 405px;
    width: 320px;
    -webkit-box-shadow: 0 0 10px 0 #bbb;
    box-shadow: 0 0 10px 0 #bbb;
    position: absolute;
    top: 51px;
    left:auto;
    right: 145px;
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
     	
     	
     	</style>
     	<style>
     	
	 body {
  margin: 0;
  padding: 0;
  width:100vw;
  height: 100vh;
  background-color: #eee;
}
.content {
  display: flex;
  justify-content: center;
  align-items: center;
  width:100%;
  height:100%;
}
.loader-wrapper {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  background: var(--primaryGradient);
  display:flex;
  justify-content: center;
  z-index: 1000;
  }
.loader {
  display: inline-block;
  width: 30px;
  height: 30px;
  position: relative;
  border: 4px solid #Fff;
  top: 50%;
  animation: loader 2s infinite ease;
  
}

.loader-inner {
  vertical-align: top;
 
  display: inline-block;
  width: 100%;
  background-color: #fff;
  animation: loader-inner 2s infinite ease-in;
   
}

@keyframes loader {
  0% {
    transform: rotate(0deg);
  }
  
  25% {
    transform: rotate(180deg);
  }
  
  50% {
    transform: rotate(180deg);
  }
  
  75% {
    transform: rotate(360deg);
  }
  
  100% {
    transform: rotate(360deg);
  }
}

@keyframes loader-inner {
  0% {
    height: 0%;
  }
  
  25% {
    height: 0%;
  }
  
  50% {
    height: 100%;
  }
  
  75% {
    height: 100%;
  }
  
  100% {
    height: 0%;
  }
}
		</style>
     	