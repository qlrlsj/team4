<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<form action="/signUp.kt" method="post">
			<div class="mb-3">
			<div class="content-title">회원가입</div>
				<label for="formGroupExampleInput" class="form-label" >ID</label> <input type="text" name="memberId" class="form-control"
					id="formGroupExampleInput" placeholder="아이디를 입력하세요">
			</div>
			
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label" >Password</label> <input type="password" name="memberPw" class="form-control"
					id="formGroupExampleInput" placeholder="비밀번호를 입력하세요">
			</div>
			
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label" >Name</label> <input type="text" name="memberName" class="form-control"
					id="formGroupExampleInput" placeholder="이름을 입력하세요">
			</div>
			
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label" >Phone</label> <input type="text" name="memberPhone" class="form-control"
					id="formGroupExampleInput" placeholder="010-0000-0000">
			</div>
			
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label" >Email address</label> <input type="email" name="memberEmail" class="form-control"
					id="exampleFormControlInput1" placeholder="name@example.com">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label" >자기소개</label>
				<textarea class="form-control" name="memberIntro" id="exampleFormControlTextarea1"
					rows="3"></textarea><br>
				<button type="submit" class="btn btn-dark">Sign up</button>
			</div>
			
		</form>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>