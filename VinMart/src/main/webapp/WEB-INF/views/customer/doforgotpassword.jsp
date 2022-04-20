<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="VinMart.entities.Users"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
 <%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check != null){
	 response.sendRedirect("../../trang-chu");
 }
 String  codemail = (String)session.getAttribute("authcode");
 String codetunhap =(String)session.getAttribute("code");
 if(codemail==null){
		response.sendRedirect("../../login"); 
	}
	else{
		if(!(codemail.equals(codetunhap))){
			System.out.println("codemail= "+ codemail);
			System.out.println("codetunhap= "+ codetunhap);
			 response.sendRedirect("../../login"); 
		}
		
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
                <h5 class="MuiTypography-root mb-36 MuiTypography-h5">Password Security</h5>
               
                <div class="flex-center my-12">
                  <hr class="MuiDivider-root flex-1">
                  <span class="mx-12 color-gray text-bolder">Thay đổi mật khẩu</span>
                  <hr class="MuiDivider-root flex-1">
                </div>
              <!-- form nhap email -->
              			<%
              			 ConnectionToDB con = new ConnectionToDB(); 
              			 String email = (String)session.getAttribute("email");
              			System.out.println("email = " + email);
                		 ResultSet pass = con.selectData("select * from users where users_email='"+email+"'");
                		
                	 	 while(pass.next()){
                		 
                		 if(pass.getString("users_email").equals(null)){ %>	
                		
                		 <% }else{
                		 %>
              <form action="${pageContext.request.contextPath}/change-password?action=xacthuc" method="POST"  accept-charset="UTF-8"  enctype="multidata/form-data">
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                   <input type="hidden" value ="<%=pass.getString("users_email")%>" name="users_email">
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <input required aria-invalid="false" name="password" type="password" class="pass-key MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" value="" placeholder="Nhập mật khẩu mới ">
                      <i class="fas fa-eye show" style="cursor: pointer;"></i>
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Nhập mật khẩu mới </span></legend>
                      </fieldset>
                    </div>
                    <div class="mb-24"></div>
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <input required aria-invalid="false" name="repassword" type="password" class="pass-key-re MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" value="" placeholder="Xác nhận lại mật khẩu mới">
                      <i class="fas fa-eye show-re" style="cursor: pointer;"></i>
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Xác nhận lại mật khẩu mới</span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>
                <%}} %>
			<!-- end form nhap email -->
                
               
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
                    <a href="${pageContext.request.contextPath}/login" class="MuiTypography-root MuiLink-root jss26 MuiLink-underlineNone MuiTypography-colorPrimary">Đăng nhập

                    </a>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
    const pass1 = document.querySelector('.pass-key-re');
    const showpass1 = document.querySelector('.show-re');
    showpass1.addEventListener('click', function(){
      if(pass1.type === "password"){
        pass1.type = "text";
       
        showpass1.style.color = "#3498db";
      }else{
        pass1.type = "password";
       
        showpass1.style.color = "#222";
      }
    });
  </script>
    <script>
    const pass = document.querySelector('.pass-key');
    const showpass = document.querySelector('.show');
    showpass.addEventListener('click', function(){
      if(pass.type === "password"){
        pass.type = "text";
       
        showpass.style.color = "#3498db";
      }else{
        pass.type = "password";
       
        showpass.style.color = "#222";
      }
    });
  </script>
	  <%@include file="/WEB-INF/views/layouts/customer/footer/toast.jsp" %>
	  <c:if test="${ not empty xacthucFail }">
		<script type="text/javascript">
		xacthucFail();	    
		 </script>
		 <%session.removeAttribute("xacthucFail");    %> 
		</c:if>
  
</body>
</html>