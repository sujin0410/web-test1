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
String hiName = request.getParameter("hiName");
if(hiName == null){
	hiName="";
}
%>

<table border="1">
	<tr>
	<th>No</th>
	<th>호텔명</th>
	<th>지역</th>
	<th>객실명</th>
	<th>가격</th>
	<th>수용인원</th>
	</tr>


<%

Connection con = DBCon.getCon();
String sql = "SELECT HI_NUM,HI_NAME, HI_AREA, HI_ROOMNAME, HI_PRICE,HI_ROOMCAPACITY FROM HOTEL_INFO";
if(hiName != null && !hiName.equals("")){
	sql += " WHERE HI_NAME LIKE ?";
}
PreparedStatement ps = con.prepareStatement(sql);
if(hiName != null &&  !hiName.equals("")){
	ps.setString(1,"%" + hiName + "%");
}
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("HI_NUM") %></td>
		<td>
			<a href="/hotel/hotel-view.jsp?hiNum=<%=rs.getString("HI_NUM")%>"><%=rs.getString("HI_NAME") %></a>
		</td>
		<td><%=rs.getString("HI_AREA") %></td>
		<td><%=rs.getString("HI_ROOMNAME") %></td>
		<td><%=rs.getString("HI_PRICE") %></td>
		<td><%=rs.getString("HI_ROOMCAPACITY") %></td>
		
		
		
		
	</tr>
<%
}
%>
</table>
<button onclick="location.gref='/hotel/hotel-insert.jsp'">등록</button>

<script>
function geMenuInsert(){
	location.href='/hotel'
}

function 



</script>

</body>
</html>