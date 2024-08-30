<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%
   
   request.setCharacterEncoding("UTF-8");
   String hiName = request.getParameter("hiName");
   String hiArea = request.getParameter("hiArea");
   String hiRmName = request.getParameter("hiRmName");
   String hiPrice = request.getParameter("hiPrice");
   String hiRmCapa = request.getParameter("hiRmCapa");
   
   Connection con = DBCon.getCon();
   
   String sql = "INSERT INTO HOTEL_INFO(HI_NAME, HI_AREA, HI_ROOMNAME,HI_PRICE,HI_ROOMCAPACITY)";
		   sql += "VALUES(?,?,?,?,?)";
		   PreparedStatement ps = con.prepareStatement(sql);	
		   ps.setString(1,hiName);
		   ps.setString(2,hiArea);
		   ps.setString(3,hiRmName);
		   ps.setString(4,hiPrice);
		   ps.setString(5,hiRmCapa);
		   
	int result = ps.executeUpdate();
			
	if(result==1){
		%>
			<script>
				alert('저장성공!');
				location.href='/hotel/hotel-list.jsp';
			</script>
		<%
			}
		%>
   
   
   
   %>