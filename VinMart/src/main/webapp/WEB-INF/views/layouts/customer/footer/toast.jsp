<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<script>
        function toast({
        title='',
        message='',
        type='info',
        duration= 3000
         }) {
            const main = document.getElementById('toast');
            if(main){
                const toast = document.createElement('div');
                //auto remove
               const autoRemoveId = setTimeout(function(){
                    main.removeChild(toast);
                },duration +1000); // công 1000 do thời gian

                //remove khi click X
                toast.onclick = function(e){
                    if(e.target.closest('.toast__close')){
                        main.removeChild(toast);
                        clearTimeout(autoRemoveId);
                    }
                }

                const icons = {
                    success: 'fas fa-check-circle',
                    info: 'fas fa-info-circle',
                    warning: 'fas fa-exclamation-circle',
                    error: 'fas fa-exclamation-circle' 
                };

                const icon = icons[type];
                const delay =(duration / 1000).toFixed(2);

                toast.classList.add('toast',`toast--\${type}`);
                toast.style.animation= `slideInleft ease .8s, fadeOut linear 3s \${delay}s forwards`;
                toast.innerHTML= `
                <div class="toast__icon">
                <i class="\${icon}"></i>
            </div>
            <div class="toast__body">
                <h3 class="toast__title">\${title}</h3>
                <p class="toast__msg">\${message}</p>
            </div>
            <div class="toast__close">
                <i class="fas fa-times"></i>
            </div>    
                `;
                main.appendChild(toast);
               
            }
        }
       
        function fixsp(){
            toast({
            title:"Đang cải thiện!", 
            message: 'Sản phẩm đang được bảo trì !',
            type: 'error',
            duration: 3000
        });
        }
        
        function themSPthanhcong(){
            toast({
            title:"Thêm thành công!", 
            message: 'Sản phẩm đã được thêm vào giỏ hàng',
            type: 'success',
            duration: 90000
        });
        }
        
        function updateSPthanhcong(){
            toast({
            title:"Cập nhập thành công!", 
            message: 'Sản phẩm đã được cập nhập vào giỏ hàng',
            type: 'success',
            duration: 3000
        });
        }
        function truSPthanhcong(){
            toast({
            title:"Xóa thành công!", 
            message: 'Sản phẩm đã được xóa bớt',
            type: 'info',
            duration: 3000
        });
        }
        function xoaSPGHthanhcong(){
            toast({
            title:"Xóa thành công!",
            message: 'Đã xóa sản phẩm ra khỏi giỏ hàng',
            type: 'success',
            duration: 3000
        });
        }
        <!-- mua thanh cong don hang -->
        function checkouts(){
            toast({
            title:"Mua thành công đơn hàng!", 
            message: 'Vui lòng kiểm tra đơn hàng của bạn !',
            type: 'info',
            duration: 3000
        });
        }
        <!-- end mua thanh cong don hang -->
        <!-- huy don hang -->
        function canceluser(){
            toast({
            title:"Hủy đơn hàng!", 
            message: 'Đơn hàng của bạn đã được hủy !',
            type: 'success',
            duration: 3000
        });
        }
        <!--  end huy don hang -->
        
        <!--  login thanh cong -->
        function login(){
            toast({
            title:"Success", 
            message: 'Đăng nhập thành công !',
            type: 'success',
            duration: 3000
        });
        }
        <!--  end login thanh cong -->
        
        <!--  login loginFail -->
        function loginFail(){
            toast({
            title:"Failed", 
            message: 'Đăng nhập thất bại !',
            type: 'warning',
            duration: 3000
        });
        }
        <!--  end login fail -->
        
        <!--  RES success -->
        function resThanhCong(){
            toast({
            title:"Success", 
            message: 'Đăng ký tài khoản thành công  !',
            type: 'success',
            duration: 3000
        });
        }
        <!--  end login fail -->
        
        
        <!--  login loginFail -->
        function resThatBai(){
            toast({
            title:"Failed", 
            message: 'Đăng ký tài khoản thất bại !',
            type: 'warning',
            duration: 3000
        });
        }
        <!--  end login fail -->
        
        <!--  Gui emaill thanh cong -->
        function guimail(){
            toast({
            title:"Success !", 
            message: 'Kiểm tra email để thay đổi mật khẩu !',
            type: 'success',
            duration: 3000
        });
        }
        <!--  end Gui emaill thanh cong -->
        
        <!--   Gui emaill Fail -->
        function guimailFail(){
            toast({
            title:"Error !", 
            message: 'Email không tồn tại !!',
            type: 'error',
            duration: 3000
        });
        }
        <!--  end Gui emaill Fail -->
        
        <!--  doi mat khau  Gui emaill thanh cong -->
        function xacthuc(){
            toast({
            	 title:"Success !", 
            message: 'Đổi mật khẩu thành công.', 
            type: 'success',
            duration: 3000
        });
        }
        <!--  end doi mat khau  Gui emaill thanh cong -->
        
        <!--  doi mat khau  Gui emaill Fail -->
        function xacthucFail(){
            toast({
            	 title:"Error !", 
            message: 'Nhập lại mật khẩu không chính xác !', 
            type: 'error',
            duration: 3000
        });
        }
        <!--  end doi mat khau  Gui emaill Fail -->
        
        <!--  Khong co quyen truy cap ROLE -->
        function role(){
            toast({
            title:"Error !", 
            message: 'Bạn không có quyền truy cập vào trang này !', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end Khong co quyen truy cap ROLE  -->
        
        <!--  ADD NV SUCCESS-->
        function addNV(){
            toast({
            title:"Success !", 
            message: 'Thêm thành viên thành công !', 
            type: 'success',
            duration: 90000
        });
        }
        <!--  end ADD NV SUCCESS  -->
        
        <!--  ADD NV FAIL-->
        function addNVFail(){
            toast({
            title:"Error !", 
            message: 'Thêm thành viên thất bại, vui lòng kiểm tra lại thông tin!', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end ADD NV FAIL  -->
        
        
        
        <!--  Xoa sp FAIL-->
        function xoaSPthatbai(){
            toast({
            title:"Error !",  
            message: 'Xóa không thành công. vui lòng thử lại !', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  Xoa sp FAIL  -->
        
        <!--  updateprofile success-->
        function updateSuccess(){
            toast({
            title:"Success !",  
            message: 'Cập nhật thông tin cá nhân thành công !', 
            type: 'success',
            duration: 90000
        });
        }
        <!--  end updateprofile success-L  -->
               
        <!--  updateprofile  FAIL-->
        function updateFail(){
            toast({
            title:"Error !",  
            message: 'Cập nhật thông tin cá nhân thất bại, vui lòng thử lại !', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end updateprofile  FAIL  -->
        
        <!--  them thanh cong success-->
        function themThanhCong(){
            toast({
            title:"Success !",  
            message: 'Thêm thành công !', 
            type: 'success',
            duration: 90000
        });
        }
        <!--  end them thanh cong success-  -->
        
        <!--  them fail-->
        function themThatBai(){
            toast({
            title:"Error !",  
            message: 'Thêm thất bại !', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end them fail  -->
        
        <!--  sua thanh cong success-->
        function suaThanhCong(){
            toast({
            title:"Success !",  
            message: 'Cập nhập thành công !', 
            type: 'success',
            duration: 90000
        });
        }
        <!--  end sua thanh cong success-  -->
        
        <!--  sua that bai-->
        function suaThatBai(){
            toast({
            title:"Error !",  
            message: 'Cập nhập thất bại !', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end sua that bai  -->

        <!--  xoa thanh cong success-->
        function xoaSPthanhcong(){
            toast({
            title:"Success !",  
            message: 'Xóa thành công !', 
            type: 'success',
            duration: 90000
        });
        }
        <!--  end xoa thanh cong success-  -->
        
        <!--  xoa that bai-->
        function xoaSPthatbai(){
            toast({
            title:"Error !",  
            message: 'Xóa thất bại !', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end xoa that bai  -->
        
        <!--  thao tac thành công-->
        function thaotacSuccess(){
            toast({
            title:"Success !",  
            message: 'Thao tác thành công !', 
            type: 'success',
            duration: 90000
        });
        }
        <!-- end thao tac thanh cong  -->
        
        <!--  thao tac that bai-->
        function thaotacFail(){
            toast({
            title:"Error !",  
            message: 'Đã xảy ra lỗi trong quá trình thao tác, vui lòng thử lại!', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end thao tac that bai  -->
        
        <!--  thao tac that bai-->
        function loginBlock(){
            toast({
            title:"Blocked !",  
            message: 'Tài khoản của bạn đã bị khóa, vui lòng liên hệ với Admin!', 
            type: 'warning',
            duration: 90000
        });
        }
        <!--  end thao tac that bai  -->
        
        <!--  email khong hop le-->
        function emailFail(){
            toast({
            title:"Error !",  
            message: 'Email hoặc Số điện thoại không hợp lệ, vui lòng thử lại!', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end email khong hop le  -->
        
        <!--  Loi khi them cart-->
        function CartFail(){
            toast({
            title:"Error !",  
            message: 'Đã xảy ra lỗi trong thao tác, vui lòng thử lại!', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end Loi khi them cart  -->
        
        <!--  Loi khi thanh toan -->
        function Thanhtoanfail(){
            toast({
            title:"Error !",  
            message: 'Mua chậm thôi, vui lòng thử lại!', 
            type: 'error',
            duration: 90000
        });
        }
        <!--  end Loi khi thanh toan  -->
        
    </script>