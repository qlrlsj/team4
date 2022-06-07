<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.div-content2{
    align-self: center;
    flex-grow: 1;
    color: #383d40;
    min-width:800px;
}
.btn{
	min-width: 200px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
	function chatOpen(roomNo){
		  window.open('about:blank','chat','width=570, height=700, resizable = no, scrollbars = yes');
	}
	</script>
	<div class="div-content2">
		<table class="table table-striped table-hover">
			<tr>
				<th>${sessionScope.m.memberId }님의 채팅방 목록</th>
			</tr>
			<c:forEach items="${room }" var="cr" varStatus="i">
			<tr>
				<td>
					<form action="/chatOpenList.kt" method="post" target="chat">
						<button class="btn btn-primary " name="${cr.roomNo }" onclick="chatOpen(${cr.roomNo});" type="submit">${cr.roomName }</button>
						<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
						<input type="hidden" name="roomNo" value="${cr.roomNo }">
						<input type="hidden" name="memberNo1" value="${cr.memberNo1 }">
						<input type="hidden" name="memberNo2" value="${cr.memberNo2 }">
						<input type="hidden" name="roomName" value="${cr.roomName }">
						<input type="hidden" name="roomDate" value="${cr.roomDate }">
					</form>					
				</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<form name="f1" action="/chatOpen2.kt" method="post" target="chat">
		<input type="hidden" name="memberNo2" value="${cr.roomNo }">
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>