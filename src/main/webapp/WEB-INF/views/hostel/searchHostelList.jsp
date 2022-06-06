<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회결과</title>
</head>
<body>
<h2>키워드 검색결과</h2>
	<table border="1">
		<tr>
			<th>번호</th><th>제목</th><th>주소</th><th>평점</th><th>파일</th>
		</tr>
		<c:forEach items="${list }" var="hostel">
		
		<tr>
			<td>${hostel.hostelCode }</td>
			<td>${hostel.hostelName }</td>
			<td>${hostel.hostelAddress }</td>
			<td>${hostel.hostelScore }</td>
			<td><img src="/webapp/resources/upload/hostel/${hostel.hostelfilepath }">${hostel.hostelfilepath }</td>
		</tr>	
		</c:forEach>
	</table>

</body>
</html>