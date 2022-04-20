<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="VinMart.entities.ConnectionToDB"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.NumberFormat"%>
<%
	ConnectionToDB con = new ConnectionToDB();
%>
<!-- The Modal ADD -->
<div class="modal fade" id="myModalIN">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 170%; margin-left: -168px;">
			<div>
				Tel:
				<i
					style="text-decoration: underline; text-decoration-style: dotted;">0123456789</i>
				; Hotline:
				<i
					style="text-decoration: underline; text-decoration-style: dotted;">0799854546</i>
			</div>
			<!-- Modal Header -->
			<div class="modal-header">
				<div style="margin-left: 308px;">
					<h4>
						<b>PHIẾU NHẬP KHO</b>
					</h4>
					<div  style="margin-left: 183px;">
						Date:
						<i class="ngaynhap_modal"
							style="text-decoration: underline; text-decoration-style: dotted;"></i>
					</div>
					<div  style="margin-left: 183px;">
						Number:
						<i id="ma_pn_modal"
							style="text-decoration: underline; text-decoration-style: dotted;"></i>
					</div>
				</div>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<!-- Modal body -->
			<div class="modal-body">
				<div>
					Nhap tai kho: ${dsSpPN.product_name }
					<i
						style="text-decoration: underline; text-decoration-style: dotted;">
						<b>VinMart Le Van Viet</b>
					</i>
				</div>
				<table id="printTable" class="tablesorter">
					<thead>
						<tr>
							<th style="padding-right: 70px;">STT</th>
							<th style="padding-right: 70px;">MASP</th>
							<th style="padding-right: 70px;">TenSP</th>
							<th style="padding-right: 70px;">So luong</th>
							<th style="padding-right: 70px;">Don gia</th>
							<th style="padding-right: 70px;">%</th>
							<th style="padding-right: 70px;">Thanh tien</th>
						</tr>
					</thead>
					
					<tbody id = "tbody_modal">										
					</tbody>
				</table>
				<div class="row" style=" justify-content: space-around;">
				
				<div >TỔNG SỐ TIỀN BẰNG CHỮ: <b  style="text-transform: uppercase;" id="resposta">    </b> </div>
				<div style=" margin-left: 245px;"> <b id="thanhtien_modal">  </b></div>
				</div>
				<div
					style="border: 1px solid rgba(0, 0, 0, .2); border-radius: .3rem; outline: 0;"></div>
				<br>
				<div style="margin-left: 612px;">
					<%
						
					%>
					<div>Ngay <p class="ngaynhap_modal"> </p> </div>
					<div style="margin-left: 60px;">THU KHO</div>
					<div style="margin-left: 55px;">(Ky, ho ten)</div>
					<div style="margin-left: 30px;">Phan Hoai Phuong</div>
				</div>
			</div>
			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" onclick="window.print()" class="btn btn-danger" data-dismiss="modal">Printf</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- END The Modal ADD -->
	

      
