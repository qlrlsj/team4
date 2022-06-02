<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table-light{
		width: 100px;
		text-align: center;
	}
	.content-title{
		text-align: center;
	}
	tr>td{
		background-color: #fffff;
	}
	#table-content{
		height: 500px;
	}
	.noticeListbtn{
		text-align: center;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="div-content"><br><br>
			<div class="content-title" id="content">FAQ</div>
			<table class="table tabel-hover" id="noticeView">
				<tr class="table-success">
					<th class="table-light" style="min-width: 100px;" id="table-light">제목</th>
					<td colspan="7">${q.questionTitle}</td>
				</tr>
				<tr class="table-success">
					<th class="table-light" id="table-light">작성자</th>
					<td>${q.memberId }</td>
					<th class="table-light" id="table-light">작성일</th>
					<td>${q.questionDate }</td>
				</tr>
				<tr class="table-success">
					<th class="table-light" id="table-content">내용</th>
					<td colspan="7" id="contentleft">
						<div id="noticeContent">${q.questionContent }</div>
					</td>
			</tr>
			</table>
			<div class="noticeListbtn">
				<button class="btn btn-light" id="noticeListbtn" onclick="noticeList()">처음으로</button>
			</div>
			<!-- 관리자로 로그인 했을 때, 회원관리 버튼 보이도록 -->
			<c:set var="grade" value="${sessionScope.m.memberGrade }"/> <!-- 로그인한 사용자의 회원등급 -->
			<c:set var="questionId" value="${q.memberId }"/>			<!-- 글작성자의 아이디 -->
			<c:set var="memberId" value="${sessionScope.m.memberId }"/> <!-- 로그인한 사용자의 아이디  -->
			<c:choose>
				<c:when test="${grade eq '0'}"> <!-- 로그인한 사용자의 회원등급이 '0'(관리자) -->
					<tr scope="row">
						<th id="buttons" colspan="8">
<%-- 							<a class="btn btn-primary" href="/questionUpdateFrm.kt?questionNo=${q.questionNo}">수정</a> --%>
							<form action="/questionUpdateFrm.kt" method="post">
								<input type="hidden" name="questionNo" value='${q.questionNo }'>
								<input type="hidden" name="questionTitle" value='${q.questionTitle }'>
								<input type="hidden" name="questionContent" value='${q.questionContent }'>
								<button class="btn btn-primary" type="submit">수정</button>
							</form>
							<button class="btn btn-secondary" onclick="questionDelete(${q.questionNo});">삭제</button>
						</th>
					</tr>
				</c:when>
				<c:when test="${memberId == questionId}"> <!-- 로그인한 이용자와 글작성자의 아이디가 같을때 -->
					<tr scope="row">
						<th id="buttons" colspan="8">
							<form action="/questionUpdateFrm.kt" method="post">
								<input type="hidden" name="questionNo" value='${q.questionNo }'>
								<input type="hidden" name="questionTitle" value='${q.questionTitle }'>
								<input type="hidden" name="questionContent" value='${q.questionContent }'>
								<button class="btn btn-primary" type="submit">수정</button>
							</form>
<%-- 							<a class="btn btn-primary" href="/questionUpdateFrm.kt?questionNo=${q.questionNo}&questionTitle=${q.questionTitle}&questionContent=${q.questionContent}">수정</a> --%>
							<button class="btn btn-secondary" onclick="questionDelete(${q.questionNo});">삭제</button>
						</th>
					</tr>
				</c:when>
			</c:choose>
			
			
	</div>
		
	<script>
		function noticeList(){
			location.href="/questionList.kt?reqPage=1";
		}
		function questionDelete(questionNo){
			if(confirm("해당 게시글을 삭제 하시겠습니까?")){
				location.href="/questionDelete.kt?questionNo="+questionNo;
				alert("게시글이 삭제 되었습니다.");
			}
		}
		
		
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>