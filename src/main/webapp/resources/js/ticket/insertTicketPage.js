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
            $("#startDate").prop("type","text");
            $("#expireDate").prop("type","text");
        }else{
            $("label[for='expireDate']").text("")
            $("#startDate").prop("type","hidden");
            $("#expireDate").prop("type","hidden");
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
            localBox2.append("<option value='0'>읍/면/동</option>");
        }
    });
    
    //달력(DatePicker)
    $.datepicker.setDefaults({
      closeText: "닫기",
      prevText: "이전달",
      nextText: "다음달",
      currentText: "오늘",
      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
      ],
      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
      ],
      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
      weekHeader: "주",
      dateFormat: "yy-mm-dd", // 날짜형태 예)yy년 m월 d일
      firstDay: 0,
      isRTL: false,
      showMonthAfterYear: true,
      yearSuffix: "년"
    })

    $(".datepicker").datepicker({
      minDate: 0	//현재날짜 이전으로는 클릭 할 수 없게함
    })
}); //페이지 로드시**********************8




//제출시 
$("#insertBtn").on("click",function(){

  //제출시 주소+상세주소
  const businessAddr = $('input[name=businessAddr]').val($("#sample6_address").val()+" "+$("#sample6_detailAddress").val());
  //소요시간 계산
  const hour = $("#hour").val();
  const minute = $("#minute").val();
  $("input[name=requiredTime]").val((hour*60)+minute);



  /********유효성 검사 *********/
    let chkArr = [false,false,false,false,false];
    let count = 0;
    
    //1-1.카테고리 유효성 검사
    const categoryBox1Val = $("#category1 option:selected").val();
    const categoryBox2Val = $("#category2 option:selected").val();
    
    if(categoryBox1Val==0||categoryBox2Val==0){
        $("#categoryChk1").text("카테고리를 선택하세요.");
        $("#categoryChk1").css("color","red");
    }else{
        $("#categoryChk").text(" ");
        chkArr[0]=true;
    }
    
    //1-2. 카테고리 입장권시 유효기간 유효성검사
// 		if($("#expireDate").attr("type")=="text"){
// 			const dateReg  = /^(20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;	//2000년대 입력가능
// 			const date = $("#expireDate").val();
// 			if(!dateReg.test(date) || date == ""){
// 				$("#categoryChk2").text("날짜(YYYY-MM-DD) 형식으로 입력해주세요 ");
// 				$("#categoryChk2").css("color","red");
// 				chkArr[1]=false;
// 			}else{
// 				$("#categoryChk2").text(" ");
// 				chkArr[1]=true;
// 			}
// 		}
    
    //2-1.주소 유효성 검사 (카테고리)
    const localBox1Val = $("#local1 option:selected").val();
    const localBox2Val = $("#local2 option:selected").val();
    if(localBox1Val==0||localBox2Val==0){
        $("#localChk1").text("카테고리를 선택하세요.");
        $("#localChk1").css("color","red");
    }else{
        $("#localChk1").text(" ");
        chkArr[1]=true;
    }
    
    //2-2.주소 유효성 검사 (상세주소)
    if($("#sample6_address").val()==""){
        $("#localChk2").text("주소를 입력하세요.");
        $("#localChk2").css("color","red");
    }else{
        $("#localChk2").text(" ");
        chkArr[2]=true;
    }
    
    //3-4. 파일 유효성 검사 (파일1개)
    const placeLength = $("input[name=file1]")[0].files.length;
    if(placeLength==0){
      $("#placeChk").text("사진 한장 필수입니다.");
      $("#placeChk").css("color","red");
    }else{
        $("#placeChk").text(" ");
        chkArr[3]=true;
    }
    //3-5. 파일 유효성 검사 (파일 multiple)
    //null이거나 4장이 아니면
    const fileLength = $("input[name=file2]")[0].files.length;
    console.log(fileLength);
    if(fileLength==0||fileLength<4){
      $("#productChk").text("사진 4장 필수입니다.");
      $("#productChk").css("color","red");
    }else if(fileLength>4){
      $("#productChk").text("최대 4장까지 가능합니다.");
      $("#productChk").css("color","red");
    }else{
        $("#productChk").text(" ");
        chkArr[4]=true;
    }
    

     
    //모든 유효성검사 성공시 제출 가능한 버튼으로 변경
    
    for(let i = 0;i<chkArr.length;i++){
        if(chkArr[i]){
            count++;
        }
    }
      if(count != 5){
          alert("정보를 확인하세요");
      }else{
        $("#insertBtn").prop("type","submit");
      }

      
      
});//제출시 끝


//날짜 유효성검사
function call()	{
    var ar1 = $("#startDate").val().split('-');
    var ar2 = $("#expireDate").val().split('-');
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    var dif = da2 - da1;
    if(dif<0){
        alert("날짜를 확인해주세요.");
        $("#startDate").val("");
        $("#expireDate").val("");
    }
}
 $("#startDate").change(function(){
     call();
 })
 $("#expireDate").change(function(){
     call();
 })

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

/************************************************/
// 파일업로드 js --업체사진(1장)
function DropFile(dropAreaId, fileListId) {
let dropArea = document.getElementById(dropAreaId);
let fileList = document.getElementById(fileListId);

function preventDefaults(e) {
e.preventDefault();
e.stopPropagation();
}

function highlight(e) {
preventDefaults(e);
dropArea.classList.add("highlight");
}

function unhighlight(e) {
preventDefaults(e);
dropArea.classList.remove("highlight");
}

function handleDrop(e) {
unhighlight(e);
let dt = e.dataTransfer;
let files = dt.files;

handleFiles(files);

const fileList = document.getElementById(fileListId);
if (fileList) {
  fileList.scrollTo({ top: fileList.scrollHeight });
}
}

function handleFiles(files) {
files = [...files];
// files.forEach(uploadFile);
files.forEach(previewFile);
}

function previewFile(file) {
console.log(file);
renderFile(file);
}

function renderFile(file) {
let reader = new FileReader();
reader.readAsDataURL(file);
reader.onloadend = function () {
  let img = dropArea.getElementsByClassName("preview")[0];
  img.src = reader.result;
  img.style.display = "block";
};
}

dropArea.addEventListener("dragenter", highlight, false);
dropArea.addEventListener("dragover", highlight, false);
dropArea.addEventListener("dragleave", unhighlight, false);
dropArea.addEventListener("drop", handleDrop, false);

return {
handleFiles
};
}

const dropFile = new DropFile("drop-file", "files");

/*********************************************************/






//파일 업로드 js -- 상품사진 4장(multiple)
( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  imageView = function imageView(att_zone, btn){

    var attZone = document.getElementById(att_zone);
    var btnAtt = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;'
                  + 'width:150px;height:120px;margin:5px;border:1px solid #fff;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;border:0.3px solid rgb(215, 197, 197);z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;line-height:30px;position:absolute;font-size:18px;'
                  + 'right:0px;top:0px;z-index:999;background-color:rgba(0,0,0,0.5);border:none;color:#fff';
  
    btnAtt.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
  
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
      
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
      
    }, false)
    

    
    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'X')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        btnAtt.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('att_zone', 'btnAtt')


//썸머노트
$('.summernote').summernote({
  height: 500,
  lang: "ko-KR"
});

let addCount = 0;

//옵션추가
function add_optbox(){
  if(addCount >= 3) return;
  let newDiv = document.createElement('div');
  newDiv.setAttribute("class","optBox");
  newDiv.innerHTML = "<input type='button' value='X' class='delOptBtn' ><br> <label for='optTitle'>옵션 제목</label> <input class='form-control' type='text' id='optTitle' name='optTitle' placeholder='제목을 입력해 주세요. (30자 이내)' maxlength='30'><label for='optContent'>옵션 설명</label> <input class='form-control' type='text' id='optContent' name='optContent' placeholder='내용을 입력해 주세요. (100자 이내)' maxlength='100'> <label for='optPrice'>가격</label> <input class='form-control price' type='number' id='optPrice' name='optPrice' min='100'> <label for='optDiscountRate'>할인율</label><span>퍼센트(%)</span> <input class='form-control' type='number' id='optDiscountRate' name='optDiscountRate' min='0' max='100'> <label for='optDiscountPrice'>할인된 가격</label> <input class='form-control price' type='number' id='optDiscountPrice' name='optDiscountPrice' min='100'> <label for='optStock'>재고</label> <input class='form-control' type='number' id='optStock' name='optStock' value='10' min='0'> ";
  addCount++;
  $("#opt").append(newDiv);
  del_optBox();
}

//옵션 삭제
function del_optBox(){
  $(".delOptBtn").on("click",function(){
    $(this).parent().remove();
  });
}
