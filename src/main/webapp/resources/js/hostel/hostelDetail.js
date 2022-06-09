

	$(document).ready(function(){
        // 		 날짜선택옵션
             $('#datepicker1').datepicker({dateFormat : 'yy-mm-dd'});
    
             $('#datepicker1').datepicker("option", "minDate", 0); // 시작일 오늘부터
            $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val()); //종료일보다 시작일을 늦게선택하는것 막기
            $('#datepicker1').datepicker("option", "onClose", function ( selectedDate ) {
            $("#datepicker2").datepicker( "option", "minDate", selectedDate );
            });// 종료일이 시작일보다 빠르게 선택하는것 막기
        
            $('#datepicker2').datepicker({dateFormat : 'yy-mm-dd'});
      
            $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
            $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
                $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
            });
                });





//재검색버튼 누르면 예약하기 내 히든인풋 값 바꿔주기 
/*
$("#reSearch").on("click",function(){
    console.log($(this).prev().prev().prev().val()); // 입실 
    console.log($(this).prev().prev().val()); // 퇴실
    console.log($(this).prev().val()); // 인원 
    $("#hostelIndate").val($(this).prev().prev().prev().val()) 
    $("#hostelOutdate").val($(this).prev().prev().val());
    $("#reserveNum").val($(this).prev().val());
});*/

$("#reSearch").on("click",function(){
    // 페이지내 재검색용 - 온로드 끝나면 자동으로 한번클릭하게 하기 ! 
    // optionList-box 클래스에 append 
    // 아작스로 넘겨줄 정보 : hostelCode, 입실일, 퇴실일,인원

    var hostelCode = $("#searchHostelCode").val();
    var startDate = $("[name=startDate]").val();
    var endDate = $("[name=endDate]").val();
    var customerNum = $("#customerNum").val(); 

    
    $.ajax({
        url: "/searchHostelOptionList.kt",
        data : {hostelCode:hostelCode, startDate:startDate, endDate:endDate, customerNum:customerNum},
        success : function(data){
            console.log("옵션리스트 호출");
            const opDiv = $(".optionList-box");
            opDiv.empty(); //비우기 
            for(let i=0; i<data.length;i++){
                const form = $("<form action='/hostelReserveFrm.kt' method='get'>");
                const input1 = $("<input type='hidden'  name='hostelIndate' value='"+startDate+"'>");
                const input2 = $("<input type='hidden'  name='hostelOutdate' value='"+endDate+"'>");
                const input3 = $("<input type='hidden'  name='reserveNum' value='"+customerNum+"'>");
                const input4 = $("<input type='hidden'  name='optionNo' value='"+data[i].optionNo+"'>");
                
                const div1 = $(" <div class='optionList'>");
                const div2 = $("<div class='option-img'><img src='/resources/upload/hostel/exIMG.jpg'  width='200'  height='200' ></div>");
                const div3 = $("<div class='option-text'>")
                const div31 = $("<div class='option-range'>옵션:"+data[i].roomOption+"</div>");
                const div32 = $("<div class='option-price'>가격:"+data[i].hostelPrice+"원</div></div>");
                const reBtn = $("<div class='option-btn'><button type='submit' name='reserveBtn' class='reserveBtn btn btn-outline-secondary' >예약하기</button></div>");
                div3.append(div31).append(div32);
                div1.append(div2).append(div3).append(reBtn);

                form.append(input1);
                form.append(input2);
                form.append(input3);
                form.append(input4);
                form.append(div1);
                form.append("</div></form>");//닫는태그 
                opDiv.append(form);
            }
        }
    });
    //reBtn 버튼 타입 수정필요 


   


});
$(document).ready(function(){
    $("#reSearch").trigger('click'); 
});


$(document).on("click","[name=reserveBtn]",function(){
    console.log("예약하기버튼 ");
    /*
     예약하기 클릭시 - 옵션번호(금액), 입퇴실일, 인원,  
              멤버관련은 다음페이지에서 로그인된 세션끌어오기 / null일때 처리 필요 
              위 재검색하기 버튼 클릭시 히든인풋-날짜, 인원 전체 value변경시켜주기
               //예약하기 항목쪽 value확인  
               // 쿠폰확인은 아작스로..생각해보자.. 
               */
//    const optionNum = $(this).parent().parent().;
    console.log("옵션번호 : "+optionNum);
    console.log("입퇴실일");
    console.log("예약인원");


});

