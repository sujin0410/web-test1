<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  menu-list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String miName = request.getParameter("miName");
if(miName == null){
	miName="";
}
%>

<form>
	<input type="text" name="miName" value="<%=miName %>"><button>검색</button>

</form>


<table border="1">
	<tr>
		<th>번호</th>
		<th>메뉴명</th>
		<th>가격</th>
	</tr>
<%

Connection con = DBCon.getCon();
String sql = "SELECT MI_NUM,MI_NAME, MI_PRICE, MI_DESC FROM MENU_INFO";
if(miName != null && !miName.equals("")){
	sql += " WHERE MI_NAME LIKE ?";
}
PreparedStatement ps = con.prepareStatement(sql);
if(miName != null &&  !miName.equals("")){
	ps.setString(1,"%" + miName + "%");
}
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("MI_NUM") %></td>
		<td>
			<a href="/menu/menu-view.jsp?miNum=<%=rs.getString("MI_NUM")%>"><%=rs.getString("MI_NAME") %></a>
		</td>
		<td><%=rs.getString("MI_PRICE") %></td>
	</tr>
<%
}
%>
</table>
<button onclick="location.gref='/menu/menu-insert.jsp'">등록</button>

<script>
function geMenuInsert(){
	location.href='/menu'
}

function 



</script>

</body>
</html>