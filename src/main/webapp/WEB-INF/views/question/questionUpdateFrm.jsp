<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<title>Insert title here</title>
<script>
$(document).ready(function() {
	  $('.summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</head>
<body>
		<div class="div-content"><br><br>
			<div class="content-title" id="content">FAQ수정</div>
			<div class="content-title"><h1>게시글 작성(파일추가)</h1></div>
			<hr>
			<div style="width: 80%; margin: auto;">
				<form method="post" action="/questionUpdate.kt">
	<!-- 			<input type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br> -->
					<input type="text" name="questionTitle" style="width: 40%;" value="${questionTitle }"/>
					<br><br> 
					<textarea class="summernote" name="questionContent">${questionContent }</textarea>
					<input id="subBtn" type="submit" value="글 수정" style="float: right;" onclick="goWrite(this.form)"/>
					<input type="hidden" name="questionNo" value="${questionNo }"/>
<%-- 					<input type="hidden" name="memberId" value="${sessionScope.m.memberId }"> --%>
				</form>
			</div>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	function goWrite(frm) {
		var title = frm.questionTitle.value;
// 		var writer = frm.writer.value;
		var content = frm.questionContent.value;
		
		if (title.trim() == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		if (content.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		frm.submit();
}
</script>
</html>