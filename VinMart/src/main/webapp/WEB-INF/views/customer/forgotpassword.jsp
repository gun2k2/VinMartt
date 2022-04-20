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
                <h5 class="MuiTypography-root mb-36 MuiTypography-h5">Quên mật khẩu</h5>
                ${success }
                 ${error }
                <div class="flex-center my-12">
                  <hr class="MuiDivider-root flex-1">
                  <span class="mx-12 color-gray text-bolder">Nhập email để thay đổi mật khẩu</span>
                  <hr class="MuiDivider-root flex-1">
                </div>
              <!-- form nhap email -->
              <form action="${pageContext.request.contextPath}/change-password?action=guimail" method="POST"  accept-charset="UTF-8"  enctype="multidata/form-data">
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                   
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <input required aria-invalid="false" name="users_email" type="email" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" value="" placeholder="Enter email to change password">
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Enter email to change password</span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>

                
               
                <div class="mb-24">

                </div>
                <div class="MuiFormControl-root mb-24 MuiFormControl-fullWidth">
                  <button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" tabindex="0" type="submit">
                    <span class="MuiButton-label">TIẾP TỤC</span>
                    <span class="MuiTouchRipple-root"></span>
                  </button>
                </div>
                </form>
                <!-- END FORM NHAP EMAIL -->
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <p class="MuiTypography-root justify-content-end MuiTypography-body1">
                    <a href="login" class="MuiTypography-root MuiLink-root jss26 MuiLink-underlineNone MuiTypography-colorPrimary">Đăng nhập

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
   <c:if test="${ not empty guimail }">
	<script type="text/javascript">
	guimail();	    
	 </script>
	 <%session.removeAttribute("guimail");    %> 
	</c:if>
	
	<c:if test="${ not empty guimailFail }">
	<script type="text/javascript">
	guimailFail();	    
	 </script>
	 <%session.removeAttribute("guimailFail");    %> 
	</c:if>
</body>
</html>