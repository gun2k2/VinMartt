
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="VinMart.entities.Users"%>
 <%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check != null){
	 response.sendRedirect("trang-chu");
 }
 %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1"><title>Cổng Truy Cập Định Danh</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600&amp;display=swap">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"><link rel="icon" href="https://identity.teko.vn/favicon.png">
		<%@include file="/WEB-INF/views/layouts/customer/decorators/headlogin.jsp" %>
		<style type="text/css">
     	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
     	</style>
</head>
<body>
<div id="toast"></div>
	<div id="root">
      <div class="app">
        <div class="background">
          <div class="form-container">
            <div class="form-content">
              <div class="MuiPaper-root form-layout MuiPaper-elevation1 MuiPaper-rounded">
                <img src="https://i.imgur.com/4p090Et.png" alt="Vinmart Web Desktop" class="app-logo mb-12">
                <h6 class="MuiTypography-root color-gray mb-12 MuiTypography-subtitle2"></h6>
                <h5 class="MuiTypography-root mb-36 MuiTypography-h5">Tạo tài khoản</h5>
                
                <div class="flex-center my-12">
                  <hr class="MuiDivider-root flex-1">
                  <span class="mx-12 color-gray text-bolder">Nhập thông tin tài khoản</span>
                  <hr class="MuiDivider-root flex-1">
                </div>
                
              <form:form action="register" method="POST" modelAttribute="user">
              
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                   
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <form:input required="true" aria-invalid="false" type="email" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" path="users_email" placeholder="Email" />
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6 "><span >Email </span></legend>
                      </fieldset>
                       
                    </div>
                  </div>
                </div>
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                   
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <form:input aria-invalid="false"  required="true" type="password" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" path="users_password" placeholder="Mật khẩu" />
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Mật khẩu</span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>
			<form:form action="register" method="POST" modelAttribute="customer">
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                   
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <form:input aria-invalid="false" required="true" type="text" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense"   path="name" placeholder="Tên" />
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Tên</span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>
				<div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                   
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <form:input aria-invalid="false" required="true" type="text" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" path="sdt" placeholder="Số điện thoại" />
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Số điện thoại</span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>
                
                <div class="MuiFormControl-root MuiFormControl-fullWidth">
                  <p class="MuiTypography-root justify-content-center MuiTypography-body2">
                    <a class="MuiTypography-root MuiLink-root jss26 MuiLink-underlineNone MuiTypography-colorPrimary">Kích hoạt tài khoản

                    </a>
                  </p>
                </div>
                <div class="mb-24">

                </div>
                <div class="MuiFormControl-root mb-24 MuiFormControl-fullWidth">
                  <button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" tabindex="0" type="submit">
                    <span class="MuiButton-label"> Tạo tài khoản</span>
                    <span class="MuiTouchRipple-root"></span>
                  </button>
                </div>
                </form:form >
                </form:form>
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <p class="MuiTypography-root justify-content-end MuiTypography-body1">
                    <a class="MuiTypography-root MuiLink-root jss26 MuiLink-underlineNone MuiTypography-colorPrimary" type="submit" 
                    href="<c:url value="login"/>">Đăng nhập

                    </a>
                  </p>
                </div>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
     <%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp" %>
   <c:if test="${ not empty resThanhCong }">
	<script type="text/javascript">
	resThanhCong();	    
	 </script>
	 <%session.removeAttribute("resThanhCong");    %> 
	</c:if>
	
	<c:if test="${ not empty resThatBai }">
	<script type="text/javascript">
	resThatBai();	    
	 </script>
	 <%session.removeAttribute("resThatBai");    %> 
	</c:if>
	
	 <c:if test="${ not empty emailFail }">
	<script type="text/javascript">
	emailFail();	    
	 </script>
	 <%session.removeAttribute("emailFail");    %> 
	</c:if>
</body>
</html>
