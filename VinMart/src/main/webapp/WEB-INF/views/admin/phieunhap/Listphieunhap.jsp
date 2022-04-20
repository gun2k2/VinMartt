<%Users  check = (Users)session.getAttribute("LoginInfo");
 if(check == null){
	 response.sendRedirect("trang-chu");	
 }
 else {
 %>

<%Users  user = (Users)session.getAttribute("LoginInfo");
 if((user.getRole_id() == 5) || (user.getRole_id() == 1) || (user.getRole_id() == 2)){
	 System.out.print("user: " + user.getRole_id());
		
 }
 else {
	 session.setAttribute("role","true");  
	 response.sendRedirect("admin-page");
 }
 %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/taglib/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>


  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/images/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/favicon.png">
 <title>Siêu thị VinMart - An Tâm Mua Sắm Mỗi Ngày</title>
  <link rel="icon" href="https://vinmart.com/images/favicon_1.ico">
  
	<!-- Head -->
		<%@include file="/WEB-INF/views/layouts/admin/decorators/head.jsp"%>
		<script src="${pageContext.request.contextPath}/assets/js/core/n2vi.min.js" type="text/javascript"></script>
	<!-- End Head -->
</head>
<body class="app">	
<%ConnectionToDB con = new ConnectionToDB();%>
	
	<div class="wrapper">
    <!--sidebar -->
   		<%@include file="/WEB-INF/views/layouts/admin/sidebarLeft/sidebar.jsp"%>
    <!-- end sidebar -->
    <div class="main-panel">
      <!-- Navbar -->
      	<%@include file="/WEB-INF/views/layouts/admin/header/header.jsp"%>
      <!-- End Navbar -->
      
      <!-- BODY CONTENT-->
      <div class="content">
        <div class="row">
          <!--TABLE 1-->
          <div class="col-md-12">
            <div class="card ">
              <div class="card-header">
                <h4 class="card-title">Quản lý phiếu nhập</h4>
              </div>
              <div class="card-body">
                <div class="table-responsive">					
                  <!--Table-->
                  <table id="dataTable" class="table tablesorter myTable" >
				                    <thead class=" text-primary">
					                    <tr>
											<th>ID Phiếu nhập</th>
                            				<th>Ngày nhập</th>                                               
											<th class="text-center">Hành động</th>											
										</tr> 
				                    </thead> 
				                                
									<tbody>								
										<% ResultSet rs = con.selectData("select * from PHIEUNHAP ");
                        				while(rs.next()){%> 
										<tr>
											<td>#<%=rs.getInt("MaPN") %></td>                        
                           					<td><%=rs.getString("NgayNhap") %></td>
											<td class="text-center">
											<div class="dropdown">
					                            <a class="btn btn-link font-24 p-0 line-height-1 no-arrow dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
					                              <i class="tim-icons icon-settings-gear-63"></i>
					                            </a>
					                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list" style="margin-right: 58px;background:snow">
					                            	
						     						<form  class="dropdown-item dropdown-item-font" action="${pageContext.request.contextPath}/chi-tiet-phieu-nhap/<%=rs.getInt("MaPN") %>" method="post"  enctype="multidata/form-data">
							                            <button style="border: none;padding: 0px;background: transparent;" type="submit" title="DETAIL">
							                           <i class="tim-icons icon-spaceship"></i> Xem chi tiết
							                            </button>
						                             <input hidden="true"  name="MaPN" value="<%=rs.getInt("MaPN") %>">
						                             </form>
						     						
						     						<!-- Xuat THEO ID -->
													<a  title="Xuất" class="dropdown-item dropdown-item-font showPN" href="#myModalIN" data-toggle="modal">
														<i class="tim-icons icon-paper"></i>Printf
														<input hidden="true" class="MaPN" name="MaPN" value="<%=rs.getInt("MaPN") %>">
														<input hidden="true" class="NgayNhap" name="NgayNhap" value="<%=rs.getString("NgayNhap") %>">
													  </a> 																									
				                            		
										             
					                            </div>
					                          </div>					
												
											</td>
										</tr>	
										<%} %>								
									</tbody>																
                  </table>
                  <!-- End Table-->
                </div>
              </div>
            </div>
          </div>
          <!--END TABLE 1-->		
        </div>
      </div>
    </div>
  </div>
    <!--END BODY-->
  		<jsp:include page="../phieunhap/modalAndajax.jsp"></jsp:include> 
     	
	<!--Footer-->
  <%@include file="/WEB-INF/views/layouts/admin/footer/footer.jsp"%>
    <!-- END Footer-->
  
  <!--DECORATOR FOOTER-->
  <%@include file="/WEB-INF/views/layouts/admin/decorators/footer.jsp"%>
  <!--END DECORATOR FOOTER-->
  
  <script type="text/javascript">
	
	$('#dataTable').on('click', '.showPN', 
			function() {
				//bỏ tất cả dòng dữ liệu đang có
				$('#tbody_modal')[0].innerHTML  = '';
				let MaPN = $(this).parent().find('.MaPN').val();
				let NgayNhap = $(this).parent().find('.NgayNhap').val();
				
				$('.ngaynhap_modal')[0].innerText =  NgayNhap ;
				$('#ma_pn_modal')[0].innerText =  "#"+ MaPN ;
				
				$.ajax("getListCtPN/" + MaPN,{
					dataType: "json",
					success: function(ct_pn){
						
						insertRowData(ct_pn);
						
					}
				}) 
		});
		 
	function insertRowData(ct_pn){
		
		let tongtien=0;
		for (let i = 0; i < ct_pn.product_id.length; i++){
			
			$.ajax('getListSpCtPN/'+ct_pn.product_id[i],{
				dataType: "json",
				success: function(product){
					console.log(product.product_name);
					tongtien+=(ct_pn.dongianhap[i]-ct_pn.dongianhap[i]*product.product_discount/100)*ct_pn.soluongnhap[i];
					let rowData = '';
					
					rowData +='<tr>'
					
					//stt
					rowData +='<td>'+ (i+1) +'</td>';
					
					//masp
					rowData +='<td>'+ct_pn.product_id[i]+'</td>';
					
					//tensp
					rowData +='<td>'+product.product_name+'</td>';
					
					//soluong
					rowData +='<td>'+ct_pn.soluongnhap[i]+'</td>';
					
					//dongia
					rowData +='<td>'+ct_pn.dongianhap[i]+'</td>';
					
					//giamgia
					rowData +='<td>'+product.product_discount+'</td>';
					
					//thanhtien
					rowData +='<td>'+(ct_pn.dongianhap[i]-ct_pn.dongianhap[i]*product.product_discount/100)*ct_pn.soluongnhap[i]+'</td>';
					
					rowData +='</tr>'
					
					$('#thanhtien_modal')[0].innerText =  tongtien ;
					$('#printTable').append(rowData)	
					convert_text(tongtien);
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
</body>
</html>
<%}%>