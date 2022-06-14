


var optionNo =  $("#optionNo").val();
var memberNo = $("#memberNo").val();
var reserveEmail  = $("#reserveEmail").val();
var reserveName= $("#reserveName").val();
var reservePhone =  $("#reservePhone").val();
var reserveNum = $("#reserveNum").val();
var hostelIndate = $("#hostelIndate").val();
var hostelOutdate = $("#hostelOutdate").val();
var hostelName = $("#hostelName").val();
var payPrice = $("#payPrice").val();



 $("#reserveEmail").on("change",function(){
    reserveEmail  = $("#reserveEmail").val();
   reserveName= $("#reserveName").val();
   reservePhone =  $("#reservePhone").val();

 });
 $("#reserveName").on("change",function(){
    reserveEmail  = $("#reserveEmail").val();
   reserveName= $("#reserveName").val();
   reservePhone =  $("#reservePhone").val();

});

$("#reservePhone").on("change",function(){
    reserveEmail  = $("#reserveEmail").val();
   reserveName= $("#reserveName").val();
   reservePhone =  $("#reservePhone").val();

});



$("#copyReserveInfo").on("change",function(){
    if(this.checked){
        $("#reserveName").val($("#guestName").val());
        $("#reserveEmail").val($("#guestEmail").val());
        $("#reservePhone").val($("#guestPhone").val());
        reserveName = $("#guestName").val();
        reserveEmail = $("#guestEmail").val();
        reservePhone = $("#guestPhone").val();

    }
    else{
        $("#reserveName").val('');
        $("#reserveEmail").val('');
        $("#reservePhone").val('');

    }

});



// 결제 API
var IMP = window.IMP; // 생략 가능
IMP.init("imp64234357"); 

$("#payBtn").on("click",function(){
  //  console.log("콘솔");
  // IMP.request_pay(param, callback) 결제창 호출
  const d = new Date(); // 거래 고유 ID생성을 위해 현재 결제날짜 이용하여 처리 
  //date값 생성시 공백을 주지않으면 각 결과가 +연산처리된다 
  const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();


  IMP.request_pay({ // param
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: "H_"+optionNo+"_"+date,
      name: hostelName,
      amount: payPrice ,
      buyer_email: reserveEmail,
      buyer_name: reserveName,
      buyer_tel: reservePhone
  }, function (rsp) { // callback
      if (rsp.success) {
          location.href = "/reserveHostel.kt?payPrice="+payPrice+"&optionNo="+optionNo+"&memberNo="+memberNo+"&reserveName="+reserveName+"&reservePhone="+reservePhone+"&reserveEmail="+reserveEmail+"&reserveNum="+reserveNum+"&hostelIndate="+hostelIndate+"&hostelOutdate="+hostelOutdate; 
          
          
          //  결제테이블 - 결제금액 
               // 예약테이블 - 옵션번호, 회원번호, 주문자이름, 이메일, 번호, 인원, 입실일  ,퇴실일
               // 예약테이블까지 인서트 끝나면 reserved room 인서트까지 ! 
          // 결제 성공 시 로직,
       
      } else {
          alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
          // 결제 실패 시 로직,
       
      }
  });
});

