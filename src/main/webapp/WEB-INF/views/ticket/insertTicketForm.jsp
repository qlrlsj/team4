<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 상품등록 ::</title>
<!-- 다음 우편번호 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<style>
	.chk{
		font-size: 15px;
		margin: 0;
	}
	.content-box{
		max-width: 1160px;
	}
	.content-box>.container{
		padding: 0;
	}
	.optBox{
		background-color: lightgray;
		padding: 20px;
		margin: 35px;
	}
	.delOptBtn{
		float: right;
	}
	.div-content{
		margin-top: 50px;
	}

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="div-content">
		<h1>티켓 상품 등록</h1>
		<form class="row g-3" action="/insertTicket.kt" method="post" enctype="multipart/form-data">
			<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
			<div class="content-box">
				<h4>1. 카테고리</h4>
				<div class="col-md-4" style="margin: 0;">
					<select id="category1" class="form-select">
						<option value="0">1차 카테고리 선택</option>
					</select>
				</div>
				<div class="col-md-4">
					<select id="category2" name="categoryId" class="form-select ">
						<option value="0">2차 카테고리 선택</option>
					</select>
				</div>
				<pre class="chk" id="categoryChk1" style="margin-top:0;">   </pre>
	
				<label for="startDate" style="margin-top:0;"></label>
				<input class="col-md-4 datepicker" type="hidden" id="startDate" name="startDate" placeholder="시작날짜 입력">
				<label for="expireDate" style="margin-top:0;"></label>
				<input class="col-md-4 datepicker" type="hidden" id="expireDate" name="expireDate" placeholder="만료날짜 입력">
				<!-- 			<pre class="chk" id="categoryChk2" style="margin-top:0;">   </pre> -->
			</div>

			<h4>2. 주소 입력</h4>
			<div class="content-box">
				<div class="col-md-4">
					<select id="local1" class="form-select">
						<option value="0">광역시·도</option>
					</select>
				</div>
				<div class="col-md-4">
					<select id="local2" class="form-select" name="localId">
						<option value="0">지역명</option>
					</select>
				</div>
				<pre class="chk" id="localChk1" style="margin-top: 0px;">   </pre>
	
				<input class="form-control" type="text" id="sample6_postcode" placeholder="우편번호" readonly> <input
					class="btn btn-secondary" type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input class="form-control" type="text" id="sample6_address" placeholder="주소" readonly><br> <input
					class="form-control" type="text" id="sample6_detailAddress" placeholder="상세주소"> <input
					class="form-control" type="text" id="sample6_extraAddress" placeholder="참고항목" readonly>
				<input type="hidden" name="businessAddr">
				<pre class="chk" id="localChk2" style="margin-top:0;">   </pre>
			</div>

			<h4>3. 상품 정보 입력</h4>
			<div class="content-box">
				<label for="ticket-title">상품 제목</label>
				<textarea class="form-control" type="text" name="ticketTitle"  placeholder="제목을 입력해 주세요. (50자 이내)" maxlength="50" ></textarea>
				<label for="important-content">중요 정보</label>
				<textarea class="form-control" type="text" name="importantContent"
					placeholder="강조하고 싶은 내용을 적어주세요. (100자 이내)" maxlength="100"></textarea>
				<label for="business-time">이용 시간</label>
				<textarea class="form-control" type="text" name="businessTime"
					placeholder="영업시간 안내 (100자 이내)" maxlength="100"></textarea>
				<label for="chooseFile">입구 사진</label>
				<p>만나는 장소를 알 수 있는 위치 사진을 올려주세요.</p> 
				<p class="chk" id="placeChk"> </p>
				<label class="file-label" for="chooseFile">Choose File</label>
				<p> </p>
				<div class="upload-box">
					<div id="drop-file" class="drag-file">
						<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
						<p class="message">Drag files to upload</p>
						<img src="" alt="미리보기 이미지" class="preview">
					</div>
				</div>
				<input class="file" id="chooseFile" name="file1" type="file" onchange="dropFile.handleFiles(this.files)"
					accept="image/png, image/jpeg, image/gif">
				<label class="file-label" for="btnAtt">상품 사진</label>
				<p>첫번째 사진이 대표 사진이 됩니다. (4장 필수) </p>
				<p class="chk" id="productChk"> </p>

				<div id='image_preview'>
					<input class="file" type='file' id='btnAtt' name="file2" multiple='multiple' accept="image/png, image/jpeg, image/gif" onchange="addFile(this);"/>
					<div id='att_zone' data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
				</div>
				<label for="ticket-content">상품 설명</label>
				<div class="container">
					<textarea class="summernote" id="ticket-content" name="ticketContent"></textarea>    
				</div>
			</div>

			<h4>4. 옵션 입력</h4>
			
			<div class="content-box" id="opt">
				<div class="optBox">
					<label for="optTitle">옵션 제목</label>
					<input class="form-control" type="text" id="optTitle" name="optTitles" placeholder="제목을 입력해 주세요. (30자 이내)" maxlength="30">
					<label for="optContent">옵션 설명</label>
					<input class="form-control" type="text" id="optContent" name="optContents" placeholder="내용을 입력해 주세요. (100자 이내)" maxlength="100">
					<label for="optPrice">가격</label>
					<input class="form-control price" type="number" id="optPrice" name="optPrices" min="100">
					<label for="optDiscountRate">할인율</label><span>퍼센트(%)</span>
					<input class="form-control rate" type="number" id="optDiscountRate" name="optDiscountRates" min="0" max="100" value="0">
					<label for="optDiscountPrice">할인된 가격</label>
					<input class="form-control" type="number" id="optDiscountPrice" name="optDiscountPrices" min="100">
					<label for="optStock">재고</label>
					<input class="form-control" type="number" id="optStock" name="optStocks" value="10" min="0">
					<input type="hidden" id="count" name="count" value="1">
				</div>
			</div>
			<button type="button" id="optAdd" onclick="add_optbox()">추가</button>

			<h4>소요시간 입력</h4>
			<div class="content-box">
				<div class="col-md-4">
					<select id="hour" class="form-select">
						<c:forEach var="i" begin="1" end="24">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					<span>시간</span>
				</div>	
				<div class="col-md-4">
					<select id="minute" class="form-select">
						<option value="0">00</option>
						<option value="30">30</option>
					</select>
					<span>분 소요</span>
				</div>	
				<input type="hidden" name="requiredTime">
			</div>

			<button type="button" id="insertBtn">제출</button>
		</form>

		
		
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script src="/resources/js/ticket/insertTicketForm.js"></script>
</body>

</html>