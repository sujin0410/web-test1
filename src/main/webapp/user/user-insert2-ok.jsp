<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uiId = request.getParameter("uiId");
String uiPwd = request.getParameter("uiPwd");
String uiName = request.getParameter("uiName");
%>

<%="아이디: " + uiId%><br>
<%="비밀번호: " + uiPwd%><br>
<%="이름: " + uiName%><br>
