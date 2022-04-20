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
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="691715780779-0hg6vracpjl1mihtfo4evcd1vt9bh6pj.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
		<%@include file="/WEB-INF/views/layouts/customer/decorators/headlogin.jsp" %>
		<style type="text/css">
     	<%@ include file="/WEB-INF/views/layouts/customer/css/toast.css" %>
     	</style>
     	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
     	<style>

.google-btn {
  width: 176px;
  height: 42px;
  background-color: #4285f4;
  border-radius: 2px;
  box-shadow: 0 3px 4px 0 rgba(0,0,0,.25);
  cursor: pointer;
  }
  .google-icon-wrapper {
    position: absolute;
    margin-top: 1px;
    margin-left: 1px;
    width: 40px;
    height: 40px;
    border-radius: 2px;
    background-color: #fff;
  }
  .google-icon {
    position: absolute;
    margin-top: 11px;
    margin-left: -9px;
    width: 18px;
    height: 18px;
  }
  .btn-text {
    float: right;
    margin: 11px 11px 0 0;
    color: #fff;
    font-size: 14px;
    letter-spacing: 0.2px;
    font-family: "Roboto";
  }
  &:hover {
    box-shadow: 0 0 6px #4285f4;
  }
  &:active {
    background: #1669F2;
  }


@import url(https://fonts.googleapis.com/css?family=Roboto:500);
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
                <h5 class="MuiTypography-root mb-36 MuiTypography-h5">Đăng nhập</h5>
               

                <!--INPUT-->
                <form:form action="do-login" method="POST" modelAttribute="user">
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                   
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <form:input required="true" aria-invalid="false" type="email" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense" path="users_email" placeholder="Email "/>
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Email </span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>

                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <div class="MuiFormControl-root MuiTextField-root MuiFormControl-marginDense">
                    
                    <div class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-formControl MuiInputBase-marginDense MuiOutlinedInput-marginDense">
                      <form:input required="true" id="users_password" name="users_password" aria-invalid="false" type="password" class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputMarginDense MuiOutlinedInput-inputMarginDense pass-key" path="users_password" placeholder="Mật khẩu" />
                      <i class="fas fa-eye show" style="cursor: pointer;"></i>
                      
                      <fieldset aria-hidden="true" class="jss4 MuiOutlinedInput-notchedOutline">
                        <legend class="jss6"><span>Mật khẩu</span></legend>
                      </fieldset>
                    </div>
                  </div>
                </div>

                <div class="MuiFormControl-root MuiFormControl-fullWidth">
                  <p class="MuiTypography-root justify-content-end MuiTypography-body2">
                    <a href="${pageContext.request.contextPath}/forgot-password" class="MuiTypography-root MuiLink-root jss8 MuiLink-underlineNone MuiTypography-colorPrimary">Quên mật khẩu?                   
                    </a>
                    
                  </p>
                </div>

                <div class="mb-24"></div>
                <div class="MuiFormControl-root mb-24 MuiFormControl-fullWidth">
                  <button class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary" tabindex="0" type="submit">
                    <span class="MuiButton-label"> Đăng nhập</span>
                    <span class="MuiTouchRipple-root"></span>
                  </button>
                </div>
				</form:form>
				<div class="row" style="display: inline-grid;">
				<fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button>
&ensp;&ensp;&ensp; hoặc <div class="google-btn g-signin2" data-onsuccess="onSignIn">
						  <div class="google-icon-wrapper">
						    <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg"/>
						  </div>
						  <p class="btn-text"><b>Sign in with google</b></p>
						</div> &ensp;&ensp;&ensp;
				</div>
				
				
                <div class="MuiFormControl-root mb-12 MuiFormControl-fullWidth">
                  <p class="MuiTypography-root justify-content-center MuiTypography-body1"><a class="MuiTypography-root MuiLink-root jss8 MuiLink-underlineNone MuiTypography-colorPrimary"
                  type="submit" href="<c:url value="register"/>">Tạo tài khoản</a></p>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
	      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Name: ' + profile.getName());        
        console.log("Email: " + profile.getEmail());
       // window.location  = '${pageContext.request.contextPath}/do-login-mxh?action=google&name='+profile.getName()+'&email='+profile.getEmail()+'&id='+profile.getId();
        
   
      }
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
   <c:if test="${ not empty loginFail }">
	<script type="text/javascript">
	loginFail();	    
	 </script>
	 <%session.removeAttribute("loginFail");    %> 
	</c:if>
	
	<c:if test="${ not empty xacthuc }">
	<script type="text/javascript">
	xacthuc();	    
	 </script>
	 <%session.removeAttribute("xacthuc");    %> 
	</c:if>
	
	<c:if test="${ not empty loginBlock }">
	<script type="text/javascript">
	loginBlock();	    
	 </script>
	 <%session.removeAttribute("loginBlock");    %> 
	</c:if>
	
	<script>
  window.onscroll = function() {myFunction()};

  var navbar = document.getElementById("navbar");
  var sticky = navbar.offsetTop;

  function myFunction() {
    if (window.pageYOffset >= sticky) {
      navbar.classList.add("sticky")
    } else {
      navbar.classList.remove("sticky");
    }
  }
  

  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }
</script>
<script>

  function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
    console.log('statusChangeCallback');
    console.log(response);                   // The current login status of the person.
    if (response.status === 'connected') {   // Logged into your webpage and Facebook.
      testAPI();  
    } else {                                 // Not logged into your webpage or we are unable to tell.
      document.getElementById('status').innerHTML = 'Please log ' +
        'into this webpage.';
    }
  }


  function checkLoginState() {               // Called when a person is finished with the Login Button.
    FB.getLoginStatus(function(response) {   // See the onlogin handler
      statusChangeCallback(response);
    });
		  FB.api('/me',{fields:'name,email'},function(response){
		  console.log(response);
		  window.location.href = '${pageContext.request.contextPath}/do-login-mxh?action=Face&name='+response.name+'&email='+response.email+'&id='+response.id;
		 
		  }); 
  }


  window.fbAsyncInit = function() {
    FB.init({
      appId      : '163505385753662',
      cookie     : true,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v9.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
  };
 
  function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Successful login for: ' + response.name);
      document.getElementById('status').innerHTML =
        'Thanks for logging in, ' + response.name + '!';
    });
  }

</script>

	





<!-- Load the JS SDK asynchronously -->
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>