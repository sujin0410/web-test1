<%@page import="test.web.common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- user-insert-ok.jsp -->

<%
request.setCharacterEncoding("UTF-8");
String uiName = request.getParameter("uiName");
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiGender = request.getParameter("uiGender");
String uiBirth = request.getParameter("uiBirth");
uiBirth = uiBirth.replace("-","");
String[] uiHobbies = request.getParameterValues("uiHobby");
String uiHobby = "";
for(int i=0;i<uiHobbies.length;i++){
	uiHobby += uiHobbies[i] + ",";
}
uiHobby = uiHobby.substring(0,uiHobby.length()-1);

String uiDesc = request.getParameter("uiDesc");


	Connection con = DBCon.getCon();
	Statement stmt = con.createStatement();
	String sql = "INSERT INTO user_info\n"
			+"(UI_NAME, UI_ID, UI_PWD, UI_GENDER,\n"
			+"UI_BIRTH, UI_HOBBY, UI_DESC)\n"
			+"VALUES(\n"
			+"?,?,?,?,\n"
			+"?,?,?)";
	 PreparedStatement ps = con.prepareStatement(sql);	
	 ps.setString(1,uiName);
	 ps.setString(2,uiId);
	 ps.setString(3,uiPwd);
	 ps.setString(4,uiGender);
	 ps.setString(5,uiBirth);
	 ps.setString(6,uiHobby);
	 ps.setString(7,uiDesc);
	 
	 int result = ps.executeUpdate();
		if(result==1){
%>
			<script>
				alert('정상적으로 회원가입되었습니다!');
				location.href='/user2/user-list.jsp';
			</script>
		<%
			}
		%>

