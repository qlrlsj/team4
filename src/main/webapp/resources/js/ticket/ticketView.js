
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
    console.log("i : "+i);
    console.log("optQtt : "+optQtt);
    console.log("dPrice : "+dPrice);
    console.log("optQtt*dPrice : "+optQtt*dPrice);
    $(".optQtt"+i).val(optQtt);
    $(".dPrice"+i).val(optQtt*dPrice);
    if(optQtt==0){
        $(".optQtt"+i).parent().parent().parent().removeClass("optPriceBox");
    }else{
        $(".optQtt"+i).parent().parent().parent().addClass("optPriceBox");
    }

    const price = $(".optDiscountPrice");
    
    const qtt = $(".qtt");
    console.log(price,qtt);
    totalPrice=0;
    for(let i=0;i<price.length;i++){
        totalPrice += price.eq(i).val()*qtt.eq(i).val();
    }
    if(totalPrice==0){
        $(".totalPriceBox").css("display","none");
        $("#payBtn").css("display","none");
    }else{
        $("#payBtn").css("display","block");
    }
    $(".totalPrice").text(totalPrice.toLocaleString()+"원");
    $("input[name=totalPrice]").val(totalPrice);
    $("#payInfoBox1").text(totalPrice);
});


$("#payBtn").on("click",function(){
    const memberNo = Number($(".memberNo").text());
    const coupon = $("#coupon");
    $.ajax({
        type:"POST",
        url:"/selectAllCouponPoint.kt",
        data:{memberNo:memberNo},
        success: function (cp) {
            console.log(cp);
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
      calcPrice();
    $(".page1").css("display","none");
    $(".page2").css("display","block");
    
});

$("#coupon").on("change",function(){
    const option = $("#coupon>option:selected");
    const dcPrice = Number(option.attr("couponDCPrice"));
    const dcRate = Number(option.attr("couponDCRate"));
    console.log(dcPrice,dcRate);
    const dc = (totalPrice*dcRate/100)+dcPrice;
    console.log(dc);
    $("#payInfoBox2").text(dc);
    calcPrice();

});

$("#pointUse").on("change",function(){
    const po = $("#pointUse").val();
    $("#payInfoBox3").text(po);
    calcPrice();
});

function calcPrice(){
   const coupon = Number($("#payInfoBox2").text());
   const point = Number($("#payInfoBox3").text());
   $("#payInfoBox4").text(totalPrice-coupon-point);
}