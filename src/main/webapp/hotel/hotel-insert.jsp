<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="/hotel/hotel-insert-ok.jsp" method="get">
호텔명: <input type="text" name="hiName"><br>
지역: <input type="text" name="hiArea"><br>
객실명:<input type="text" name="hiRmName"><br>
가격:<input type="text" name="hiPrice"><br>
수용인원:<input type="text" name="hiRmCapa"><br>
<button>호텔 등록</button>
</form>


</body>
</html>