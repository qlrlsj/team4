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
		display: none;
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
					<input type="number" name="packageAmount" class="form-control amount" placeholder="인원수" min=1 max="20">						
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
		<input type="hidden" value="${p.packageNo }"/>
		<input type="hidden" value="${p.memberId }"/>
		<input type="hidden" name="packageDate"/>
		<input type="hidden" name=""/> <!-- 총인원 -->
		<input type="hidden" name=""/> <!-- 금액 -->
		<div class="input-group mb-3">
			<button type="button" class="btn btn-primary" id="paymentButton">구매하기</button>
		</div>
	</form>

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
		var packagePrice =  ${p.packagePrice };
		var totalPrice = (amount * packagePrice);
		let result = totalPrice.toLocaleString();
		let result1 = result+"원";
		$('#totalPrice').val(result1);
	});
	
	$("#datepicker1").change(function(){
		var datepicker = $("#datepicker1").val();
		console.log(datepicker);
		$("[name=packageDate]").val(datepicker);
		
		let test11 = '${sessionScope.m.memberId}';
		console.log(test11);
// 		sessionStorage.setItem("memberId",memberId);
// 		sessionStorage.getItem("memberId");
// 		const test11 = $(session.m.memberId);
// 		consoel.log(test11);
		
		$('#dateChk').text("여행 출발일 : "+datepicker);
	});
	
	$("#sumButton").click(function(){
		$('#paymentButton').show();
	});
	
	//결제부분 처리(아임포트 라이브러리)
	$("#paymentButton").click(function(){
		const price = $("#totalPrice").text();
		//거래 고유ID생성을 위해 현재 결제 날짜를 이용해서 처리
		const d = new Date();
		const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
		
		IMP.init("imp25949733");	//결제 API 사용을 위한 식별코드입력
		IMP.request_pay({//결제 정보
			merchant_uid : "상품코드_"+date, 		//거래 ID(위에서 초단위까지 만들어놓았던 겹치지 않는 date)
			name : "KTRIP 패키지 구매",					//결제이름
			amount : price,							//결제금액
			buyer_email : "email@email.com",	//구매자 email 주소
			buyer_name : "이름",//$(sessionScope.m.memberName),				//구매자 이름
			buyer_tel : "010-3333-2222",//$(sessionScope.m.memberPhone),		//구매자 전화번호
			buyer_addr : "서울시 영등포구 당산동", 	//구매자 주소
			buyer_postcode : "12345"			//구매자 우편번호
			
		},function(rsp){//처리할 함수
			if(rsp.success){
				console.log("결제가 완료되었습니다.");
				console.log("고유 ID"+rsp.imp_uid);
				console.log("상점거래ID : "+rsp.merchant_uid);
				console.log("결제 금액 : "+rsp.paid_amount);
				console.log("카드승인번호 : "+rsp.apply_num);
				//추가 DB작업이 필요한 경우 이 부분에 결제내역을 DB에 저장하는 코드 작성을 하면 된다 (ajax로 보내던지, form태그로 전송해주던지)
			}else{
				alert("에러내용 : "+rsp.err_msg);
			}
		});
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>