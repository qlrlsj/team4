<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 상품등록 ::</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
	.chk{
		font-size: 15px;
		margin: 0;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<form class="row g-3" action="/insertTicket.kt">
		<h4>1. 카테고리</h4>
		<div class="col-md-4">
			<select id="category1" class="form-select">
				<option value="0">1차 카테고리 선택</option>
			</select>
		</div>
		<div class="col-md-4">
			<select id="category2" class="form-select">
				<option value="0">2차 카테고리 선택</option>
			</select>
		</div>
		<pre class="chk" id="categoryChk1" >   </pre>
		
		<label for="expireDate"></label>
		<input class="col-md-4" type="hidden" id="expireDate" placeholder="유효기간(만료날짜) 입력(YYYY-MM-DD)">
		<pre class="chk" id="categoryChk2" >   </pre>
		
		<h4>2. 주소 입력</h4>
		<div class="col-md-4">
			<select id="local1" class="form-select">
				<option value="0">1차 카테고리 선택</option>
			</select>
		</div>
		<div class="col-md-4">
			<select id="local2" class="form-select">
				<option value="0">2차 카테고리 선택</option>
			</select>
		</div>
		<pre class="chk" id="localChk1" style="margin-top:0px;" >   </pre>
		
		<input class="col-md-4" type="text" id="sample6_postcode" placeholder="우편번호">
		<input class="col-md-4" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input class="col-md-4" type="text" id="sample6_address" placeholder="주소"><br>
		<input class="col-md-4" type="text" id="sample6_detailAddress" placeholder="상세주소">
		<input class="col-md-4" type="text" id="sample6_extraAddress" placeholder="참고항목">
		<pre class="chk" id="localChk2" >   </pre>
		
		<button type="button" id="insertBtn">제출</button>
	</form>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
	$(document).ready(function(){
		//1. 카테고리 데이터 불러오기
		const categoryBox1 = $("#category1");
		const categoryBox2 = $("#category2");
		
		$.ajax({
	         url : "/selectAllTicketCategory.kt",
	         success:function(list){
               for(let i=0;i<list.length;i++){
            	   if(list[i].parentCategoryId == 0){
            		   categoryBox1.append("<option value='"+list[i].categoryId+"'>"+list[i].categoryName+"</option>");
            	   }
               }
	         }
	      });
		
		//카테고리1차 선택시
		categoryBox1.on("change",function(){
			const categoryBox1Val = $("#category1 option:selected").val();
			categoryBox2.children().remove();
			if(categoryBox1Val!=0){
				$.ajax({
			         url : "/selectAllTicketCategory.kt",
			         success:function(list){
		               for(let i=0;i<list.length;i++){
		            	   if(list[i].parentCategoryId == categoryBox1Val){
		            		   categoryBox2.append("<option value='"+list[i].categoryId+"'>"+list[i].categoryName+"</option>");
		            	   }
		               }
			         }
			      });
			}else{
				categoryBox2.append("<option value='0'>2차 카테고리 선택</option>");
			}
			
			//카테고리1차-입장권시 유효기간 입력폼 생성
			if(categoryBox1Val == 1){
				$("label[for='expireDate']").text("입장권시 유효기간 필수입력 : ")
				$("#expireDate").prop("type","text");
			}
		});
		
		//2.지역 카테고리 데이터 불러오기
		const localBox1 = $("#local1");
		const localBox2 = $("#local2");
		
		$.ajax({
	         url : "/selectAllLocal.kt",
	         success:function(list){
               for(let i=0;i<list.length;i++){
            	   if(list[i].parentLocalId == 0){
            		   localBox1.append("<option value='"+list[i].localId+"'>"+list[i].localName+"</option>");
            	   }
               }
	         }
	      });
		
		localBox1.on("change",function(){
			const localBox1Val = $("#local1 option:selected").val();
			localBox2.children().remove();
			if(localBox1Val!=0){
				$.ajax({
			         url : "/selectAllLocal.kt",
			         success:function(list){
		               for(let i=0;i<list.length;i++){
		            	   if(list[i].parentLocalId == localBox1Val){
		            		   localBox2.append("<option value='"+list[i].localId+"'>"+list[i].localName+"</option>");
		            	   }
		               }
			         }
			      });
			}else{
				localBox2.append("<option value='0'>2차 카테고리 선택</option>");
			}
		});
		
	});
	
	
	
	//유효성검사
	$("#insertBtn").on("click",function(){
		let chkArr = [false,false,false,false];
		let count = 0;
		
		//1-1.카테고리 유효성 검사
		const categoryBox1Val = $("#category1 option:selected").val();
		const categoryBox2Val = $("#category2 option:selected").val();
		
		if(categoryBox1Val==0||categoryBox2Val==0){
			$("#categoryChk1").text("카테고리 입력하세요.");
			$("#categoryChk1").css("color","red");
			chkArr[0]=false;
		}else{
			$("#categoryChk").text(" ");
			chkArr[0]=true;
		}
		
		//1-2. 카테고리 입장권시 유효기간 유효성검사
		if($("#expireDate").attr("type")=="text"){
			const dateReg  = /^(20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;	//2000년대 입력가능
			const date = $("#expireDate").val();
			if(!dateReg.test(date) || date == ""){
				$("#categoryChk2").text("날짜(YYYY-MM-DD) 형식으로 입력해주세요 ");
				$("#categoryChk2").css("color","red");
				chkArr[1]=false;
			}else{
				$("#categoryChk2").text(" ");
				chkArr[1]=true;
			}
		}
		
		//2-1.주소 유효성 검사 (카테고리)
		const localBox1Val = $("#local1 option:selected").val();
		const localBox2Val = $("#local2 option:selected").val();
		if(localBox1Val==0||localBox2Val==0){
			$("#localChk1").text("카테고리 입력하세요.");
			$("#localChk1").css("color","red");
			chkArr[2]=false;
		}else{
			$("#localChk1").text(" ");
			chkArr[2]=true;
		}
		
		//2-2.주소 유효성 검사 (상세주소)
		if($("#sample6_address").val()==""||$("#sample6_detailAddress").val()==""){
			$("#localChk2").text("주소를 입력하세요.");
			$("#localChk2").css("color","red");
			chkArr[3]=false;
		}else{
			$("#localChk2").text(" ");
			chkArr[3]=true;
		}
		
		
		//모든 유효성검사 성공시 제출 가능한 버튼으로 변경
		
		for(let i = 0;i<chkArr.length;i++){
            if(chkArr[i]){
                count++;
            }
        }
      	if(count != 4){
      		alert("정보를 확인하세요");
      	}else{
			$("#insertBtn").prop("type","submit");
      	}
	});
	
	
	
	//주소API
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	</script>
</body>
</html>
