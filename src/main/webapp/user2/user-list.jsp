<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String uiName = request.getParameter("uiName");
if(uiName == null){
	uiName="";
}
%>

<table border="1">
	<tr>
	<th>No</th>
	<th>이름</th>
	<th>성별</th>
	<th>생일</th>
	<th>취미</th>
	<th>자기소개</th>
	</tr>

<%
Connection con = DBCon.getCon();
String sql ="select * from user_info";
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	out.println("<tr>");
	out.println("<td>" + rs.getString("UI_NUM") + "</td>");
	out.println("<td><a href='/user2/user-view.jsp?uiNum=" + rs.getString("UI_NUM")+ "'>" + rs.getString("UI_NAME") + "</a></td>");
	out.println("<td>" + rs.getString("UI_GENDER") + "</td>");
	out.println("<td>" + rs.getString("UI_BIRTH") + "</td>");
	out.println("<td>" + rs.getString("UI_HOBBY") + "</td>");
	out.println("<td>" + rs.getString("UI_DESC") + "</td>");
	out.println("</tr>");
}


%>











</body>
</html>