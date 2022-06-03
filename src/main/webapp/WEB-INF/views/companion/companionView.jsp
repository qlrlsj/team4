<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Companion View</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script>
	function chatOpen(){
		var chatCheck = confirm("동행신청을 위해 채팅해보실래용?");
		if(chatCheck){
			openwin();
		}
	}
	function openwin() {
		  window.open('about:blank','chat','width=570, height=700, resizable = no, scrollbars = yes');
		  document.f1.submit();
		}
	</script>
	<form name="f1" action="/chatOpen.kt" method="post" target="chat">
	  <c:choose>
	  	<c:when test="${sessionScope.m.memberNo gt com.memberNo}">
		  <input type="hidden" name="memberNo2" value="${sessionScope.m.memberNo }">
		  <input type="hidden" name="memberNo1" value="${com.memberNo }">
		  <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
	  	</c:when>
	  	<c:otherwise>
	  	  <input type="hidden" name="memberNo1" value="${sessionScope.m.memberNo }">
		  <input type="hidden" name="memberNo2" value="${com.memberNo }">
		  <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
	  	</c:otherwise>
	  </c:choose>
	</form>
	
	<h2>동행자 모집</h2>
	<div class="div-content">
	<table class="table table-striped table-hover">
		<tr>
			<td colspan="4">${com.companionTitle }</td>
		</tr>
		<tr>
			<th>작성자</th><td>${com.memberId }</td><th>작성일</th><td>${com.companionDate }</td>
		</tr>
		<tr>
			<th>지역</th><th>여행일</th><th>여행 테마</th><th>모집 여부</th>
		</tr>
		<tr>
			<td>${com.companionField }</td><td>${com.travleStart } ~ ${com.travleEnd }</td><td>${com.companionTheme }</td><td id="progress">${com.companionProgress }</td>
		</tr>
		<tr>
			<td colspan="4"><c:out value="${com.companionContent}" escapeXml="false"/></td>
		</tr>
		<c:choose>
			<c:when test="${sessionScope.m.memberId eq com.memberId }">
				<c:choose>
					<c:when test="${com.companionProgress eq '모집 완료' }">
						<tr>
							<td colspan="2"><a href="/companionUpdateFrm.kt?companionNo=${com.companionNo }">수정하기</a></td>
							<td colspan="2"><a onclick="return confirm('삭제하시겠습니까?');" href="/companionDelete.kt?companionNo=${com.companionNo }">삭제하기</a></td>
						</tr>
					</c:when>
					<c:when test="${com.companionProgress eq '모집 중' }">
						<tr>
							<td id="progressBtn" colspan="4"><button class="btn btn-primary btn-sm" onclick="progress(${com.companionNo});">모집 완료로 변경하기</button></td>
						</tr>
						<tr>
							<td colspan="2"><a href="/companionUpdateFrm.kt?companionNo=${com.companionNo }">수정하기</a></td>
							<td colspan="2"><a onclick="return confirm('삭제하시겠습니까?');" href="/companionDelete.kt?companionNo=${com.companionNo }">삭제하기</a></td>
						</tr>
					</c:when>					
				</c:choose>
			</c:when>
			<c:otherwise>
			<tr>
				<c:if test="${!empty sessionScope.m }">
					<td colspan="2"><button class="btn btn-primary btn-sm" onclick="chatOpen();">동행 신청하기!</button></td>
					<td colspan="2"><button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#reportModal" data-bs-whatever="@mdo">신고하기</button></td>
				</c:if>
			</tr>
			</c:otherwise>
		</c:choose>
	</table>	
	<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="reportModalLabel">New message</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">Recipient:</label>
	            <input type="text" class="form-control" id="reported" readonly="readonly" value="${com.memberNo }">
	          </div>
	          <div class="mb-3">
	            <label for="message-text" class="col-form-label">Message:</label>
	            <textarea class="form-control" id="report-content" placeholder="신고내용"></textarea>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
	        <button type="button" onclick="report(${sessionScope.m.memberNo})" class="btn btn-primary">신고하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	</div>
	<script>
	function progress(companionNo){
		var check = confirm("모집완료로 변경하시겠습니까?");
		if(check){
			progressChange(companionNo);
		}
	};	
	function progressChange(companionNo){
		$.ajax({
			url : "/companionProgress.kt",
			type: "post",
			data : {"companionNo":companionNo},
			success : function(data) {
				$("#progress").text(data);
				$("#progressBtn").remove();
			}
		});
	}
	function report(reporter){
		var reportCheck = confirm("신고하시겠습니까?");
		if(reportCheck){
			const reported = $('#reported').val();
			const reportContent = $('#report-content').val();
			console.log(reporter);
			console.log(reported);
			console.log(reportContent);
			$.ajax({
				url : "/reportInsert.kt",
				type : "post",
				data : {"reporter":reporter,"reported":reported,"reportContent":reportContent},
				success : function(data){
					alert(reporter+"님의 신고가 접수되었습니다. 감사합니다.");
				}
			});
		}else{
			alert("확인~");
		}
	}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>