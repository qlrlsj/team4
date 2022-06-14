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
						<tr class="${rp.reported }">
							<td align="center">${rp.reporterId }</td>
							<td align="center">${rp.reportedId }</td>
							<td align="center">${rp.reportContent }</td>
							<td align="center">
								<button type="button" class="btn btn-danger" onclick="blackMember('${rp.reported}', '${rp.reportContent }');">블랙리스트로 변경</button>
							</td>
						</tr>
					</c:forEach>
			</table>
		</form>
	</div>
	<script>
		//회원 블랙
		function blackMember(reported,reportContent){
			var result = confirm("회원을 블랙리스트로 변경하시겠습니까?");
			if(result){
				$.ajax({
					url : "/insertBlack.kt",
					type: "post",
					data : {"reported":reported,"reportContent":reportContent},
					success : function(data) {
						location.reload();
					}
				});
			}
		}
	</script>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>