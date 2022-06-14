
$(".minus").on("click", function () {
    const optQtt = Number($(this).next().val());
    //버튼 클릭시 value값 변경
    if (optQtt <= 0) {
        $(this).next().val(0);
    } else {
        $(this).next().val(optQtt-1);
    }
    if(optQtt==1&&!$(".priceBox").hasClass("optPriceBox")){
        $(".totalPriceBox").css("display","none");
    }
});

$(".plus").on("click", function () {
    const stock = Number($(this).prev().val());
    let optQtt = Number($(this).prev().prev().val());
    //버튼 클릭시 value값 변경
    if (optQtt < stock) {
        $(this).prev().prev().val(optQtt+1);
    }

    if(!$(".priceBox").hasClass("optPriceBox")){
        $(".totalPriceBox").css("display","block");
    }
});
let totalPrice = 0;
$(".varyBtn").on("click",function(){
    const optQtt = Number($(this).parent().children().eq(1).val());
    const dPrice = Number($(this).parent().parent().children().eq(2).children().eq(2).val())
    const i = $(this).parent().parent().children().eq(0).val();
    $(".optQtt"+i).val(optQtt);
    $(".dPrice"+i).val(optQtt*dPrice);
    if(optQtt==0){
        $(".optQtt"+i).parent().parent().parent().removeClass("optPriceBox");
    }else{
        $(".optQtt"+i).parent().parent().parent().addClass("optPriceBox");
    }

    const price = $(".optDiscountPrice");
    
    const qtt = $(".qtt");
    totalPrice=0;
    for(let i=0;i<price.length;i++){
        totalPrice += price.eq(i).val()*qtt.eq(i).val();
    }
    if(totalPrice==0){
        $(".totalPriceBox").css("display","none");
        $("#payBtn").css("display","none");
    }else{
        $("#payBtn").css("display","block");
        $("#payBtn").css("display","inline");
    }
    $(".totalPrice").text(totalPrice.toLocaleString()+"원");
    $("#totalPrice").val(totalPrice);
    $("#payInfoBox1").text(Number(totalPrice));
});


//쿠폰 불러오기
$("#payBtn").on("click",function(){
    const memberNo = Number($(".memberNo").text());
    const coupon = $("#coupon");
    if(memberNo!=0){
        $.ajax({
            type:"POST",
            url:"/selectAllCouponPoint.kt",
            data:{memberNo:memberNo,totalPrice:totalPrice},
            success: function (cp) {
                coupon.append("<option value='0'>쿠폰을 선택해주세요.</option>");
              if(cp.couponList.length == 0){
                coupon.append("<option value='0'>사용 가능한 쿠폰이 없습니다.</option>");
              }else{
                  for(let i=0;i<cp.couponList.length;i++){
                    const option = $("<option></option>");
                    option.val(cp.couponList[i].couponNo);
                    option.text(cp.couponList[i].couponName);
                    option.attr("couponDCPrice",cp.couponList[i].couponDCPrice);
                    option.attr("couponDCRate",cp.couponList[i].couponDCRate);
                    coupon.append(option);
    
                    // if(totalPrice>=cp.couponList[i].couponIf){
                    //     coupon.append("<option value='"+cp.couponList[i].couponNo+"'>"+cp.couponList[i].couponName+"</option>");
                    // }
                  }
              }
              $("#possiblePoint").text(cp.point);
              
            }
          });
        }
        
    calcPrice();
    $(".page1").css("display","none");
    $(".page2").css("display","block");
    
});

$("#coupon").on("change",function(){
    const option = $("#coupon>option:selected");
    let dcPrice = 0;
    let dcRate = 0;
    if(option.val()!=0){
        dcPrice = Number(option.attr("couponDCPrice"));
        dcRate =Number(option.attr("couponDCRate"));
    }
    
    const dc = (totalPrice*dcRate/100)+dcPrice;
    $("#payInfoBox2").text(dc);
    $("#pointUse").val(0);
    $("#payInfoBox3").text($("#pointUse").val());
    calcPrice();

});

$("#pointUse").on("change",function(){
    const po = $("#pointUse").val();
    const possiblePoint =Number($("#possiblePoint").text());
    //유효성검사
    if(po>possiblePoint){
        $("#pointUse").val(possiblePoint);
    }
    //결제금액 변경
    $("#payInfoBox3").text(Number($("#pointUse").val()));
    calcPrice();
});

function calcPrice(){
   const coupon = Number($("#payInfoBox2").text());
   const point = Number($("#payInfoBox3").text());
   let lastTotal = totalPrice-coupon-point;
   if(lastTotal<0){
    $("#pointUse").val(0);
    $("#payInfoBox3").text($("#pointUse").val());
    lastTotal = totalPrice - coupon;
   }
   $("#payInfoBox4").text(Number(lastTotal));
}

$("#payBtn2").on("click",function(){
    const payPrice = Number($("#payInfoBox4").text());
    const pointUse = Number($("#payInfoBox3").text());
    const payCoupon = Number($("#payInfoBox2").text());
    $("input[name=payPrice]").val(payPrice);
    $("input[name=pointUse]").val(pointUse);
    $("input[name=payCoupon]").val(payCoupon);

    //적립금계산
    const pointRate = 0.1;
    $("#pointAdd").val(payPrice * pointRate);
    
    //결제 API
    var IMP = window.IMP; //생략가능
    //거래 고유 ID를 생성하기위해 현재 날짜를 이용해서 처리
    const d = new Date();
    //date 값 생성시 ""를 더하지 않으면 숫자 + 연산이 되므로 문자 덧샘을 추가
    const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
    IMP.init("imp32461786");//결제API사용을 위한 식별코드입력
    IMP.request_pay({
        merchant_uid : "T_"+date,//거래아이디
        name:"KTRIP_PAYMENT",	 //결제이름
        amount:payPrice,		//결제금액
        buyer_email:$("input[name=reserveEmail]").val(),	            //구매자이메일
        buyer_name:$("input[name=reserveName]").val(),				//구매자이름
        buyer_tel:$("input[name=reservePhone]").val()		        //구매자전번
    },function(rsp){
        if(rsp.success){
            $($("#payBtn3")).attr("type","submit");
            $($("#payBtn3")).trigger("click");
        }else{
            alert("에러내용:"+rsp.err_msg);
        }
    });
    

    
});

$("#payBtn3").on("click",function(){
    const payPrice = Number($("#payInfoBox4").text());
    const pointUse = Number($("#payInfoBox3").text());
    const payCoupon = Number($("#payInfoBox2").text());
    $("input[name=payPrice]").val(payPrice);
    $("input[name=pointUse]").val(pointUse);
    $("input[name=payCoupon]").val(payCoupon);

    //적립금계산
    const pointRate = 0.1;
    $("#pointAdd").val(payPrice * pointRate);
    $($("#payBtn3")).attr("type","submit");
    $($("#payBtn3")).trigger("click");
});

