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
		padding-bottom: 15px;
	}
	#exampleFormControlTextarea1{
		height: 250px;
	}
	.identify{
		font-size: 14px;
		color: #f00;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="div-content">
		
		<form action="/signUp.kt" method="post">
			<div class="mb-3">
			<div class="content-title">회원가입</div>
				<label for="formGroupExampleInput" class="form-label" >ID<span class='identify'> *</span><span id="memberIdChk"></span></label><span id=idChk></span> 
				<input type="text" name="memberId" class="form-control"	id="memberId" placeholder="아이디를 입력해 주세요">
			</div>

			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label" >Password<span class='identify'> *</span><span id="memberPwChk"></span></label><span id=pwChk></span>
				 <input type="password" name="memberPw" class="form-control"
					id="memberPw" placeholder="비밀번호를 입력해 주세요">
			</div>
			
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label" >Password Confirm<span class='identify'> *</span><span id="memberPw2Chk"></span></label><span id=pw2Chk></span>
				<input type="password" name="memberPwRe" class="form-control"
					id="memberPwRe" placeholder="비밀번호를 다시 입력해 주세요">
			</div>
			
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label" >Name<span class='identify'> *</span><span id="memberNameChk"></span></label><span id=nameCHk></span>
				<input type="text" name="memberName" class="form-control"
					id="memberName" placeholder="이름을 입력해 주세요">
			</div>
			
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label" >Phone<span class='identify'> *</span><span id="memberPhoneChk"></span></label><span id=phoneChk></span> 
				<input type="text" name="memberPhone" class="form-control"
					id="memberPhone" placeholder="휴대폰 번호(010-0000-0000) ">
			</div>
			
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label" >Email address<span class='identify'> *</span><span id="memberEmailChk"></span></label><span id=emailChk></span> 
				<input type="email" name="memberEmail" class="form-control"
					id="memberEmail" placeholder="name@example.com">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlTextarea1" class="form-label" >자기소개</label>
				<textarea class="form-control" name="memberIntro" id="memberIntro"
					rows="3"></textarea><br>
			</div>
			<div class="mb-3">
				<div class="form-check" style="padding-bottom: 1px">
					<input class="form-check-input" type="checkbox" value=""
						id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault"> 각종 이벤트/혜택 SMS 수신 동의<span class="identify"> [선택]</span> </label>
				</div>
			</div>
			<div class="mb-3">
				<div class="form-check" style="padding-top: 1px">
					<input class="form-check-input" type="checkbox" value=""
						id="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault"> 각종 이벤트/혜택 이메일 수신 동의<span class="identify"> [선택]</span> </label>
				</div>
			</div>
			<div class="mb-3">
				<button type="button" class="btn btn-dark" id="signUpBtn" >Sign up</button>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	//중복아이디 체크 유효성 검사
	$("[name=memberId]").on("change",function(){ //"keyup"속성값을 사용하면 키 하나씩 누를때마다 검사
		const memberId = $(this).val(); //name이 memberId인 input창 그 자체의 값(value)
		//유효성검사(아이디 몇글자이상 영어 숫자조합)
		//유효성검사 통과된경우 DB에 중복체크
		$.ajax({
			url : "/idChk.kt",
			data : {memberId : memberId},
			success : function(data){
				if(data == "1"){
					$("#idChk").text("이미 사용중인 아이디입니다.");
					$("#idChk").css("color","#ff2e63");
					input.css("border", "1px solid #ff2e63");
				}else if(data == "0"){
					$("#idChk").text("사용가능한 아이디입니다.");
					$("#idChk").css("color","#00adb5");
					input.css("border", "1px solid #00adb5");
				}
			},
		});
	});
	
	//비밀번호 일치 유효성 검사
	$("[name=memberPwRe]").on("change",function (){
        var pwd1 = $("#memberPw").val();
        var pwd2 = $("#memberPwRe").val();
        
        if (pwd1 != "" && pwd2 == "") {
            null;
        }else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
            	$("#ajaxCheckResult1").text("비밀번호가 일치합니다.");
				$("#ajaxCheckResult1").css("color","#00adb5");
            } else {
            	$("#ajaxCheckResult1").text("비밀번호가 일치하지 않습니다.");
				$("#ajaxCheckResult1").css("color","#ff2e63");
            }
        }
    });
	
	
	$("#signUpBtn").on("click",function(){
		chkArr = [false, false, false, false, false, false];
		let count = 0;
		
// 		const categoryBox1Val = $("#category1 option:selected").val();
		
		
/////////////////////////////유효성검사/////////////////////////////
		const memberId = $("#memberId").val();
		const memberPw = $("#memberPw").val();
		const memberPwRe = $("#memberPwRe").val();
		const memberName = $("#memberName").val();
		const memberPhone = $("#memberPhone").val();
		const memberEmail = $("#memberEmail").val();
		
		//아이디 유효성 검사
		if(memberId==""){
			$("#memberIdChk").text("아이디를 입력하세요.");
			$("#memberIdChk").css("color","red");
			chkArr[0]=false;
		}else{
			$("#idChk").text("");
			chkArr[0]=true;
		};
		
		if(memberPw==""){
			$("#memberPwChk").text("비밀번호를 입력하세요.");
			$("#memberPwChk").css("color","red");
			chkArr[1]=false;
		}else{
			$("#pwChk").text("");
			chkArr[1]=true;
		};
		
		if(memberPw==""){
			$("#memberPw2Chk").text("비밀번호를 다시 입력하세요.");
			$("#memberPw2Chk").css("color","red");
			chkArr[2]=false;
		}else{
			$("#pw2Chk").text("");
			chkArr[2]=true;
		};
		
		if(memberName==""){
			$("#memberNameChk").text("이름을 입력하세요.");
			$("#memberNameChk").css("color","red");
			chkArr[3]=false;
		}else{
			$("#nameChk").text("");
			chkArr[3]=true;
		};
		
		if(memberPhone==""){
			$("#memberPhoneChk").text("전화번호를 입력하세요.");
			$("#memberPhoneChk").css("color","red");
			chkArr[4]=false;
		}else{
			$("#phoneChk").text("");
			chkArr[4]=true;
		};
		
		if(memberEmail==""){
			$("#memberEmailChk").text("이메일 주소를 입력하세요.");
			$("#memberEmailChk").css("color","red");
			chkArr[5]=false;
		}else{
			$("#emailChk").text("");
			chkArr[5]=true;
		};
		
		//전체 체크
	    for(let i = 0;i<chkArr.length;i++){
	        if(chkArr[i]){
	            count++;
	        }
	    }
	      if(count != 6){
          	alert("정보를 확인하세요");
	      }else{
	        $("#signUpBtn").prop("type","submit");
	        alert("회원가입에 성공 하였습니다.")
	      }
	});
	
	</script>
</body>
</html>