<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
                <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

hostel조회결과 :  <br>
제목 : ${hostel.hostelName } <br>
주소 : ${hostel.hostelAddress } <br>
평점 : ${hostel.hostelScore }<br>
소개 : ${hostel.hostelIntro }<br>
안내 : ${hostel.hostelUsage }<br>
 


		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>