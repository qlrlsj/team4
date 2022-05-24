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
	#exampleFormControlTextarea1{
		height: 250px;
	}
</style>
<body>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
			<div class="div-content">
				<div class="content-title">마이페이지</div>
					<form action="updateMember.kt" method="post">
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">회원번호</label> <input type="text" name="memberNo" class="form-control"
								id="formGroupExampleInput" value="${sessionScope.m.memberNo }">
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">아이디</label> <input type="text" name="memberId" class="form-control"
								id="formGroupExampleInput" placeholder="Example input placeholder" value="${sessionScope.m.memberId }">
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">비밀번호</label> <input type="password" name="memberPw" class="form-control"
								id="formGroupExampleInput" placeholder="Example input placeholder" value="${sessionScope.m.memberPw }">
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">이름</label> <input type="text" name="memberName" class="form-control"
								id="formGroupExampleInput" placeholder="Example input placeholder" value="${sessionScope.m.memberName }">
						</div>
						<div class="mb-3">
								<c:choose>
									<c:when test="${sessionScope.m.memberGrade eq '0'}">
										<label for="formGroupExampleInput" class="form-label">회원등급</label> <input type="text" name="memberGrade" class="form-control"
											id="formGroupExampleInput" placeholder="Example input placeholder" value="관리자">
									</c:when>
									<c:when test="${sessionScope.m.memberGrade eq '1'}">
										<label for="formGroupExampleInput" class="form-label">회원등급</label> <input type="text" name="memberGrade" class="form-control"
											id="formGroupExampleInput" placeholder="Example input placeholder" value="판매자">
									</c:when>
									<c:when test="${sessionScope.m.memberGrade eq '2'}">
										<label for="formGroupExampleInput" class="form-label">회원등급</label> <input type="text" name="memberGrade" class="form-control"
											id="formGroupExampleInput" placeholder="Example input placeholder" value="구매자">
									</c:when>
								</c:choose>
							</div>
						
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">전화번호</label> <input type="text" name="memberPhone" class="form-control"
								id="formGroupExampleInput" value="${sessionScope.m.memberPhone }">
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">이메일</label> <input type="text" name="memberEmail" class="form-control"
								id="formGroupExampleInput" value="${sessionScope.m.memberEmail }">
						</div>
						<div class="mb-3">
							<label for="formGroupExampleInput" class="form-label">자기소개</label> <input type="text" name="memberIntro" class="form-control"
								id="formGroupExampleInput" value="${sessionScope.m.memberIntro }">
						</div>
						<div class="mb-3">
							<input class="btn btn-primary" type="submit" value="Submit">
						</div>
		</form>
			</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>