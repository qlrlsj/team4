<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.pageNavi>*{
		margin: 5px;
		text-align: center;
	}
	
	div>a{
		text-decoration: none;
		font-size: 20px;
		
	}
	
	tr>th{
		text-align: center;
	}
	
	tr>td{
		text-align: center;
	}
	tr>td>a{
		text-decoration: none;
	}
	tr>th>a{
		text-decoration: none;
	}
	
	#pencil{
		width: 27px;
	}
	#btn{
		width: 37px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="div-content">
		<div class="content-title"><h1>홈페이지 관련 문의사항</h1></div>
		<hr>
		<table class="table table-hover">
			<tr>
				<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
			</tr>
			<c:forEach items="${list }" var="q" varStatus="i">
			<tr>
				<td>${(reqPage-1)*10 + i.count }</td> <!-- reqPage가 2이면 계산하면 1이되기에 i.count면 11,12,13,14,15,16,17,18,19,20 까지 나오게 된다 -->
				<td><a href="/questView.kt?questionNo=${q.questionNo }">${q.questionTitle }</a></td>
				<td>${q.memberId }</td>
				<td>${q.questionDate }</td>
			</tr>
			</c:forEach>
			<tr>
				<th class="page-item pageNavi" colspan="4">${pageNavi }</th>
			</tr>
		</table>
		<a href="questionWriteFrm.kt"><img id="pencil" src="/resources/img/pencil-square.svg"> write</a>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>