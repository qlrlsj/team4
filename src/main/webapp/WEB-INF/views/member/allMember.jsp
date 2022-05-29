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
						<th>선택</th><th>번호</th><th>아이디</th><th>이름</th><th>회원레벨</th><th>등급</th><th>연락처</th><th>이메일</th><th>가입일</th><th>포인트</th><th>추방</th>
					</tr>
					<c:forEach items="${list }" var="m">
						<tr>
							<td><input type="checkbox" class="chk form-check-input"></td>
							<td align="center">${m.memberNo }</td>
							<td align="center">${m.memberId }</td>
							<td align="center">${m.memberName }</td>
							<td align="center">${m.memberLevel }</td>
							<td>
									<c:if test="${m.memberGrade == 0 }">
										<select class="form-select">
											<option value="0" selected>관리자</option>
											<option value="1">판매자</option>
											<option value="2">구매자</option>
										</select>
									</c:if>
									<c:if test="${m.memberGrade == 1 }">
										<select class="form-select">
											<option value="0">관리자</option>
											<option value="1" selected>판매자</option>
											<option value="2">구매자</option>
										</select>
									</c:if>
									<c:if test="${m.memberGrade == 2 }">
										<select class="form-select">
											<option value="0">관리자</option>
											<option value="1">판매자</option>
											<option value="2" selected>구매자</option>
										</select>
									</c:if>
							</td>
							<td align="center">${m.memberPhone }</td>
							<td>${m.memberEmail }</td>
							<td align="center">${m.enrollDate }</td>
							<td align="center">${m.memberPoint }</td>
							<td>
								<button type="button" class="btn btn-danger exileMember">추방!!</button>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<th colspan="12">
							<button class="btn btn-primary btn-lg checkedChangeLevel" style="width:100%">선택회원 등급변경</button>
						</th>
					</tr>
			</table>
		</form>
	</div>
	<script>
		//회원추방 기능
		$(".exileMember").on("click",function(){
			var result = confirm('해당 회원을 정말 추방 하시겠습니까?');
			//확인 alert출력
			if(result){
				const memberNo = $(this).parent().parent().children().eq(1).text();
				//컨트롤러로 값 주면서 페이지 이동
				console.log(memberNo);
				location.href="/exileMember.kt?memberNo="+memberNo;
			}else{
				
			}
		});
		
		//선택회원 등급변경
			$(".checkedChangeLevel").on("click",function(){
			const check = $(".chk:checked"); //chk중 선택된옵션
			if(check.length == 0){
				alert("선택된 회원이 없습니다.");
				return;//함수종료
			}
			const num = new Array();	//회원번호 저장용 배열
			const level = new Array();	//회원등급 저장용 배열
			check.each(function(index,item){
				num.push($(item).parent().next().text());
				//td의 부모인 tr의 후손들중 select태그를 가져와서 val값을 push
				level.push($(item).parent().parent().find("select").val());
			});
			console.log(num,level);
			//자바스크립트에서의 join은 여러개의 배열을 하나로 합쳐 구분자 / 를 주어 하나의 문자열로 리턴해주는 것
			//아래의 코드는 선택한 여러개를 하나의 배열로 구분자 / 로 넘겨주는 것
			location.href="/checkedChangeLevel.kt?num="+num.join("/")+"&level="+level.join("/");
		});
	</script>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>