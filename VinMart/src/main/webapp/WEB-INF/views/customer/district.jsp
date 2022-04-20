<%@page import="VinMart.entities.ConnectionToDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<body>
								 <div class="clearfix large_form ">
                                <label  id="district_id" class="field-label"><i class="icon-login icon-envelope "></i>Quận/Huyện</label>
                               <select  name="district"  id="district" class="field-input"  required>
                            <option value="0"   >--Chọn Quận/Huyện--</option>
                             <%
                           		int province_id = Integer.parseInt(request.getParameter("province_id")); ;
                        		Connection con = ConnectionToDB.getConnect();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select *  from district where province_id ="+province_id+" " );
                                while (rs.next()) {
                            %>
                             <option   value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                            <%
                                }
                            %>
                       			 </select>
                        	
                        	</div>
                        	
				
    
    <script type="text/javascript">
    $(document).ready(function() {
        $("#district").on("change", function() {
            var district_id = $("#district").val();
            	
            	$.ajax({
            		url: "${pageContext.request.contextPath}/ward",
            		data: {district_id: district_id},
            		method: "POST",
            		success: function (data)
            		{
            			$("#ward_name").html(data);
            		}
            	});
        });
    });
</script>
</body>
</html>
 
	