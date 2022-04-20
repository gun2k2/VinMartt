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
                                <label  id="ward_name"  class="field-label"><i class="icon-login icon-envelope "></i>Phường / xã</label>
                               <select  name="ward"  id="district" class="field-input"  required>
                            <option value="0"   >Chọn phường / xã</option>
                            <%
                           		int district_id = Integer.parseInt(request.getParameter("district_id"));
                        		Connection con = ConnectionToDB.getConnect();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select * from ward where district_id="+ district_id +"  ");
                                while (rs.next()) {
                            %>
                             <option value="<%=rs.getInt(1)%>" ><%=rs.getString(2)%></option>
                            <%
                                }
                            %>
                        </select>
                            </div>
                        </div>
                            
					 
</body>
</html>