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
/* 	.noticeListbtn{ */
/* 		text-align: left; */
/* 	} */
	.formClass{
		display: flex;
		flex-direction: row;
		justify-content: left;
	}
	#uuu, #ddd{
		margin-right: 3px;
	}
	.qcqc{
		display: flex;
		flex-direction: row;
		justify-content: left;
	}
	.logo{
		vertical-align: middle;
		margin-top: 13px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="div-content"><br><br>
			<!-- 관리자로 로그인 했을 때, 회원관리 버튼 보이도록 -->
			<c:set var="grade" value="${sessionScope.m.memberGrade }"/> <!-- 로그인한 사용자의 회원등급 -->
			<c:set var="questionId" value="${q.memberId }"/>			<!-- 글작성자의 아이디 -->
			<c:set var="memberId" value="${sessionScope.m.memberId }"/> <!-- 로그인한 사용자의 아이디  -->
			<div class="content-title" id="content">FAQ</div>
			
			<c:choose>
				<c:when test="${grade eq '0'}"> <!-- 로그인한 사용자의 회원등급이 '0'(관리자) -->
					<tr scope="row">
						<th id="buttons" colspan="8">
<%-- 							<a class="btn btn-primary" href="/questionUpdateFrm.kt?questionNo=${q.questionNo}">수정</a> --%>
							<form action="/questionUpdateFrm.kt" method="post" class="formClass">
								<input type="hidden" name="questionNo" value='${q.questionNo }'>
								<input type="hidden" name="questionTitle" value='${q.questionTitle }'>
								<input type="hidden" name="questionContent" value='${q.questionContent }'>
								<button class="btn btn-primary" type="submit" id="uuu">수정</button>
								<button class="btn btn-secondary" onclick="questionDelete(${q.questionNo});" id="ddd">삭제</button>
								<div class="noticeListbtn">
									<button class="btn btn-light" id="noticeListbtn" onclick="noticeList1()" type="button">처음으로</button>
								</div>
							</form>
						</th>
					</tr>
				</c:when>
				<c:when test="${memberId == questionId}"> <!-- 로그인한 이용자와 글작성자의 아이디가 같을때 -->
					<tr scope="row">
						<th id="buttons" colspan="8">
							<form action="/questionUpdateFrm.kt" method="post" class="formClass">
								<input type="hidden" name="questionNo" value='${q.questionNo }'>
								<input type="hidden" name="questionTitle" value='${q.questionTitle }'>
								<input type="hidden" name="questionContent" value='${q.questionContent }'>
								<button class="btn btn-primary" type="submit" id="uuu">수정</button>
								<button class="btn btn-secondary" onclick="questionDelete(${q.questionNo});" id="ddd">삭제</button>
								<div class="noticeListbtn">
									<button class="btn btn-light" id="noticeListbtn" onclick="noticeList1()" type="button">처음으로</button>
								</div>
							</form>
<%-- 							<a class="btn btn-primary" href="/questionUpdateFrm.kt?questionNo=${q.questionNo}&questionTitle=${q.questionTitle}&questionContent=${q.questionContent}">수정</a> --%>
						</th>
					</tr>
				</c:when>
				<c:otherwise>
					<div class="noticeListbtn">
						<button class="btn btn-light" id="noticeListbtn" onclick="noticeList()" type="button">처음으로</button>
					</div>
				</c:otherwise>
			</c:choose><br>
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
<%-- 			<h2>${q.questionTitle }</h2> --%>
<%-- 			<h2>코멘트 타이틀 : ${c.qcComment }</h2> --%>
<div>
	<!-- 관리자 로그인 했을때 && comment가 달려있지 않은 글만 아래의 답글작성 버튼이 활성화 -->
	<c:choose>
		<c:when test="${sessionScope.m.memberGrade eq '0' && c eq null }">
						<form method="post" action="/insertComment.kt">
		        <div class="qcqc">
		            <img src="/resources/img/logo.png" height="100px" class="logo">
		            <textarea rows="5" cols="158" name="qcComment"></textarea>
		            <input type="hidden" name="questionNo" value="${q.questionNo }"/>
		        </div>
	    		<button type="submit">답글작성</button>
			</form>
		</c:when>
		<c:when test="${c eq null}"> <!-- K-TRIP의 답변이 아직 달리지 않은 상태 -->
			<h3>K-TRIP의 답변을 잠시만 기다려주세요 </h3>
		</c:when>
		<c:otherwise>
			<div class="qcqc">
            	<img src="/resources/img/logo.png" height="100px" class="logo">
            	<textarea rows="5" cols="158" name="qcComment" readonly>${c.qcComment }</textarea>
			</div>
		</c:otherwise>
	</c:choose>
</div>
			

<!-- -------------------------------------- -->			
	</div>
		
	<script>
		function noticeList(){
			location.href="/questionList.kt?reqPage=1";
		}
		function noticeList1(){
			location.href="/questionList.kt?reqPage=1";
		}
		function questionDelete(questionNo){
			if(confirm("해당 게시글을 삭제 하시겠습니까?")){
				location.href="/questionDelete.kt?questionNo="+questionNo;
				alert("게시글이 삭제 되었습니다.");
			}else{
				location.href="/questionList.kt?reqPage=1"
				alert("삭제요청이 취소 되었습니다.");
			}
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>