<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.content-title{
		margin: 0 auto;
	}
	.mb-3{
		width: 700px;
		position: center;
		margin: 0 auto;
	}
	tr>th {
		text-align: center;
	}
	td{
		vertical-align: middle;
	}
	td>input{
		text-align: center;
	}
</style>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div class="div-content">
		<div class="content-title">전체회원 관리</div>
			<form action="#">
				<table border="1" class="table table-hover">
					<tr>
						<th>신고자</th><th>범인</th><th>신고 내용</th><th>블랙리스트로 변환</th>
					</tr>
					<c:forEach items="${list }" var="rp">
						<tr>
							<td align="center">${rp.reporterId }</td>
							<td align="center">${rp.reportedId }</td>
							<td align="center">${rp.reportContent }</td>
							<td>
								<button type="button" class="btn btn-danger blackMember">블랙리스트로 변경</button>
							</td>
						</tr>
					</c:forEach>
			</table>
		</form>
	</div>
	<script>
		//회원추방 기능
		$(".black").on("click",function(){
			var result = confirm('해당 회원을 블랙리스트로 변경하시겠습니까?');
			//확인 alert출력
			if(result){
				var memberNo = $(this).parent().parent().children().eq(1).text();
				//컨트롤러로 값 주면서 페이지 이동
				console.log(memberNo);
				location.href="/exileMember.kt?memberNo="+memberNo;
			}else{
				
			}
		});
	</script>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>