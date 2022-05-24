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
	<h2>동행자 모집</h2>
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
				<td colspan="2"><button class="btn btn-primary btn-sm" onclick="chat(${com.companionNo});">동행 신청하기!</button></td>
				<td colspan="2"><button class="btn btn-primary btn-sm" onclick="chat(${com.companionNo});">신고하기</button></td>
			</tr>
			</c:otherwise>
		</c:choose>
	</table>
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
	function deleteCheck(){
		
	}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>