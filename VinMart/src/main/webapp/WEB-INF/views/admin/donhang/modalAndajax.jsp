<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
   	<script type="text/javascript">
  	 
    $(document).ready(function() {
        $('#chohang').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/cho-xuat-hang",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
                	//$("#trangthaidonhang").text("");
                	
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#xacnhan').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/xac-nhan-hang",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
                	
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#danggiao').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/dang-giao-hang",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
                	
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#thanhcong').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/giao-thanh-cong",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
        	return false;
    });
});
    
    $(document).ready(function() {
        $('#canceldh').click(function() {
        	
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/huy-giao-hang",
              
                success: function (data)
        		{
                	$("#gun2k2").html(data);
        		}
            });
        	return false;
    });
});
    </script>
    
   <script>
		$(document).ready(function() {
			$('.remove').click(function(event) {
				var donhang_id = $(this).attr("donhang_id");
				if(confirm("Bạn có muốn hủy mục này ?")){
					
					window.location = "${pageContext.request.contextPath}/huy-don-hang-admin/"+donhang_id;
					
				}else{
						return false;
				}
			});
		});
	</script> 
	
	 <script>
		$(document).ready(function() {
			$('.updatee').click(function(event) {
				var donhang_id = $(this).attr("donhang_id");
				if(confirm("Bạn có muốn Duyệt đơn này ?")){
					type: "POST",
					window.location = "${pageContext.request.contextPath}/update-trangthai/"+donhang_id;
					
				}else{
						return false;
				}
			});
		});
	</script> 
	
	<c:if test="${ not empty canceluser }">
	<script type="text/javascript">
	canceluser();	    
	 </script>
	 <%session.removeAttribute("canceluser");    %> 
	</c:if>
	
	 <c:if test="${ not empty CartFail }">
			<script type="text/javascript">
			CartFail();	    
			 </script>
			 <%session.removeAttribute("CartFail");    %> 
			</c:if>
   	<!-- Hoa don -->
     	<div class="modal fade" id="myModalIN">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style="width: 154%;margin-left: -72px;">
      
        <!-- Modal Header -->
        <div class="modal-header" style="border-bottom: none;">
        <div>
        <a style="background: #ed1c24;">
        <img src="https://vinmart.com/images/logo_2.png" alt=""  style=" width: 140px;"/>
        
        </a>
        <div style="font-size: 13px;"><i>Ngày bán: </i><i id="donhang_ngaydat_modal"> 07/07/2022</i></div>
        </div>
        <div style=" margin-left: 30px;">
          <h4 class="modal-title"><b>Cửa hàng VinMart</b></h4>
          <div style="font-size: 12px;">Đ/c: 120 Lê Văn Việt, Phường Hiệp Phú, Q9, Tp.HCM</div>
           <div style="font-size: 12px;">Hotline: 0123456789</div>
          </div>
          
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div style=" margin-left: 207px;"><b>HÓA ĐƠN BÁN HÀNG</b></div>
          <div style=" margin-left: 262px;"><b id="donhang_id_modal"></b></div>
          
          <div><b>Khách hàng: <b id="nguoimua_id_modal"></b></b></div>
          <table id="printTable" class="tablesorter" >
			  <thead>
			  <tr>
			    <th>Mặt hàng</th>
			    <th style="float: right;">Đơn giá</th>
			    <th style="text-align: center;">SL</th>
			    <th style="float: right;">Thành tiền</th>
			  </tr>
			  </thead>
			  <tbody id="tbody_modal"></tbody>
			  
			</table>
			
			<div style="border: 1px dashed;outline: 0;"></div>
			
			<div style="margin-left: 210px; padding-top: 20px;"> 
				<div><b>Cộng tiền hàng:</b> <b style="float: right;" id="tienhang_modal"> </b></div>
				<div style="justify-content: space-between;display: flex;">
					<div style="width: 102px;">
					<b style="float: right;">Tiền Ship:</b>
					</div>  
					<b style="float: right;" id="tienship_modal"> </b>
				</div>
				<div style="justify-content: space-between;display: flex;">
					<div style="width: 102px;">
					<b style="float: right;">Tong cong:</b>
					</div>  
					<b style="float: right;" id="tongtien_modal"> </b>
				</div>
				
				<div style="width: 153%;float: right;"><i style="text-transform: uppercase;" id="resposta">Một trăm hai lăm nghìn đồng chẵn</i></div>
			</div>
			 <div style="text-align: center; padding-top: 20px; padding-bottom: 20px;font-size: 15px;padding-top: 49px;">
			 <b>Xin cảm ơn quý khách, hẹn gặp lại!</b>
			 </div>
        </div>
        
        <!-- Modal footer -->
       
        <div class="modal-footer">
        	
         <form  class="tm-edit-product-form" method="post">
          <button onclick="window.print()" style="width: 100%;background-color: red;" type="submit" class="btn btn-primary btn-block text-uppercase deleteCate">OK ?</button>
          
          </form>
          
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
    <!-- End Hoa don -->
    
    <script type="text/javascript">
	
	$('#gun2k2').on('click', '.showPN', 
			function() {
				//bỏ tất cả dòng dữ liệu đang có
				$('#tbody_modal')[0].innerHTML  = '';
				let donhang_id = $(this).parent().find('.donhang_id').val();
				let donhang_ngaydat = $(this).parent().find('.donhang_ngaydat').val();
				let nguoimua_id = $(this).parent().find('.nguoimua_id').val();
				
				$('#donhang_id_modal')[0].innerText = "#"+ donhang_id ;
				$('#donhang_ngaydat_modal')[0].innerText =   donhang_ngaydat ;
				$('#nguoimua_id_modal')[0].innerText =   nguoimua_id ;
				
				$.ajax("getListCtDH/" + donhang_id,{
					dataType: "json",
					success: function(ct_dh){
						
						insertRowData(ct_dh);
						
					}
				}) 
				
		});
	
	function insertRowData(ct_dh){
		
		let tongtien=0;
		for (let i = 0; i < ct_dh.product_id.length; i++){
			
			$.ajax('getListSpCtdh/'+ct_dh.product_id[i],{
				dataType: "json",
				success: function(product){
					console.log(product.product_name);
					tongtien+=(product.product_price-product.product_price*product.product_discount/100)*ct_dh.soLuong[i];
					let rowData = '';
					
					rowData +='<tr>'
					
					//tensp
					rowData +='<td>'+product.product_name+'</td>';
					
					//dongia
					rowData +='<td style="float: right;">'+(product.product_price-product.product_price*product.product_discount/100)+'</td>';
					
					//soluong
					rowData +='<td style="text-align: center;">'+ct_dh.soLuong[i]+'</td>';
					
					//thanhtien
					rowData +='<td style="float: right;">'+(product.product_price-product.product_price*product.product_discount/100)*ct_dh.soLuong[i]+'</td>';
					
					rowData +='</tr>'
					if(tongtien>=500000){$('#tienship_modal')[0].innerText = "0";}
					else{$('#tienship_modal')[0].innerText = "25000";}
					$('#tienhang_modal')[0].innerText =   tongtien ;
					$('#tongtien_modal')[0].innerText =   ct_dh.thanhtien[i] ;
					let money = ct_dh.thanhtien[i];
					$('#printTable').append(rowData)	
					convert_text(money);
				}			
			})
			
			
		}
			
	}
	function convert_text(e) {
        var resposta = document.getElementById('resposta');
       
        	var a = to_vietnamese(e);
        	
        	resposta.innerHTML = to_vietnamese(e);
        
    }
	
</script>