<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 숫자포멧 라이브러리 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> <!-- 아임포트 라이브러리 -->
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="/resources/js/package/insertPackage.js"></script> <!-- datepicker / summernote 라이브러리 -->
<style>
	#datepicker1{
		max-width: 257px;
	}
	#option1{
 		color: black;
		background-color: #e9ecef;
   		border: 1px solid #ced4da;
		width: 200px;
		
	}
	#sumButton{
		width: 200px;
		font-weight: bold;
	}
	#totalPrice{
		font-size: 22px;
		color: #2b96ed;
		font-weight: bold;
	}
	#paymentButton{
		font-weight: bold;
		width: 150px;
		height: 50px;
/* 		display: none; */
	}
	.form-control{
		width: 200px;
	}
	.dropdown-menu{
		width: 200px;
		height: 100px;
	}
	.img-box{
		width: 100px;
		padding-bottom: 100px;
		text-align: center;
	}
	h4{
		font-weight: bold;
	}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="div-content">
	
	<div class="content-title">${p.packageTitle }</div>
	<div class="content-title"><fmt:formatNumber value="${p.packagePrice}" pattern="#,###,###,###"/>원 / 1인</div><br>
	<h3>옵션 선택</h3>
	<div class="input-group mb-3">
		<input type="text" class="form-control" name="packageStart" id="datepicker1" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" placeholder="날짜를 선택해주세요">
		<div class="btn-group">
			<button type="button" name="option1" id="option1" class="btn btn-secondary" data-bs-toggle="dropdown">옵션을 선택해주세요</button>
			<ul class="dropdown-menu">
				<div>
					<span id="dateChk"></span>
				</div>
				<!--인원수선택 -->
				<div class="col">
					<input type="number" name="packagePrsnl" class="form-control amount" placeholder="인원수" min=1 max="20">						
				</div>
			</ul>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-primary calc" id="sumButton">금액 조회하기</button>
		</div>
	</div>
	<div class="input-group mb-3">
		<span class="input-group-text" id="inputGroup-sizing-default">총 여행 금액</span>
		<input type="text" id="totalPrice" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
	</div>
	<form action="/payment.kt">
		<input type="hidden" name="memberId" value="${sessionScope.m.memberId }"/>
		<input type="hidden" name="packagePrsnl"/>
		<input type="hidden" name="packageStart"/>
		<input type="hidden" name="packageNo" value="${p.packageNo }"/>
		<input type="hidden" name="reservePrice"/>
		<!-- 두 테이블 db에 등록이 다 되도록 데이터를 다 보내고 싹다 회원정보 session에서꺼내던 어떻게든해서 다보내고 -->
		<div class="input-group mb-3">
			<button type="submit" class="btn btn-primary" id="paymentButton">구매하기</button> <!-- 나중에 상단 style에서 주석풀것. -->
		</div>
	</form>
		<!-- 결제하기 버튼 -->
		<div class="input-group mb-3">
			<button style="display: none" type="button" class="btn btn-primary" id="paymentButton2">결제하기</button>
		</div>

	<div class="img-box">
		<c:forEach items="${f }" var="file">
			<img src="/resources/upload/package/${file.filepath }">
		</c:forEach>
	</div>
	
		<h1>${p.packageContent }</h1>
</div>


<script>
	$(".amount").change(function(){
	    if($(this).val()>20||$(this).val()<1){
	        alert("잘못된 입력입니다.");
	        $(this).val(1);
	    };
	});
	
	$(".calc").click(function(){
		var amount = $('.amount').val();
		console.log(amount);
		var packagePrice =  ${p.packagePrice };
		var totalPrice = (amount * packagePrice);
		let result = totalPrice;
		$('#totalPrice').val(result);
		var packagePrsnl = $('.amount').val();
		$("[name=packagePrsnl]").val(packagePrsnl);
		$("[name=reservePrice]").val(totalPrice);
	});
	
	$("#datepicker1").change(function(){
		var datepicker = $("#datepicker1").val();
		console.log(datepicker);
		$("[name=packageStart]").val(datepicker);
		let test11 = '${sessionScope.m.memberId}';
		console.log(test11);
		$('#dateChk').text("여행 출발일 : "+datepicker);
	});
	
	$("#sumButton").click(function(){
		$('#paymentButton2').show();
	});
	
	//결제부분 처리(아임포트 라이브러리)
	$("#paymentButton2").click(function(){
		const price = $("#totalPrice").val();
		console.log(price);
		//거래 고유ID생성을 위해 현재 결제 날짜를 이용해서 처리
		const d = new Date();
		const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
		
		IMP.init("imp25949733");	//결제 API 사용을 위한 식별코드입력
		IMP.request_pay({//결제 정보
			merchant_uid : "상품코드_"+date, 		//거래 ID(위에서 초단위까지 만들어놓았던 겹치지 않는 date)
			name : "KTRIP",					//결제이름
			amount : price,							//결제금액
			buyer_email : "email@email.com",	//'${sessionScope.m.memberEmail}',구매자 email 주소
			buyer_name : '${sessionScope.m.memberName}',				//구매자 이름
			buyer_tel : '${sessionScope.m.memberPhone}',		//구매자 전화번호
		},function(rsp){//처리할 함수
			if(rsp.success){
				console.log("결제가 완료되었습니다.");
				console.log("고유 ID"+rsp.imp_uid);
				console.log("상점거래ID : "+rsp.merchant_uid);
				console.log("결제 금액 : "+rsp.paid_amount);
				console.log("카드승인번호 : "+rsp.apply_num);
			    $("#paymentButton").trigger('click');//여기요
			}else{
				alert("에러내용 : "+rsp.err_msg);
			}
		});
	});
	
	$("#paymentButton").click(function(){
		alert("해당 패키지 상품의 결제가 완료 되었습니다.")
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>