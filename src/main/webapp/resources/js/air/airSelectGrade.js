function AirStartSeat(a){
    console.log(a);
}
$(function(){
    //편도일경우
    if($(".edCheck").text()==''){
        $(".airTableBase").css("height","200px");
    }

})
var airStartGrade=1;
var airStartPay =50000;
var airEndGrade=1;
var airEndPay =50000;
$(".Pay").eq(0).text(airStartPay);
$(".Pay").eq(1).text(airEndPay);
$("input[name=airStartPay]").change(function(){
    airStartGrade = this.value;
    airStartPay =  $(this).next().text();
    if(airStartGrade==3){
        $(".VipMenu").eq(0).css("display","block");
        $(".BusinessMenu").eq(0).css("display","none");
        $(".EconomyMenu").eq(0).css("display","none");
    }else if(airStartGrade==2){
        $(".VipMenu").eq(0).css("display","none");
        $(".BusinessMenu").eq(0).css("display","block");
        $(".EconomyMenu").eq(0).css("display","none");
    }else{
        $(".VipMenu").eq(0).css("display","none");
        $(".BusinessMenu").eq(0).css("display","none");
        $(".EconomyMenu").eq(0).css("display","block");
    }
    $(".Pay").eq(0).text(airStartPay);
})
$("input[name=airEndPay]").change(function(){
    var airEndGrade = this.value;
    airEndPay = $(this).next().text();
    if(airEndGrade==3){
        $(".VipMenu").eq(1).css("display","block");
        $(".BusinessMenu").eq(1).css("display","none");
        $(".EconomyMenu").eq(1).css("display","none");
    }else if(airEndGrade==2){
        $(".VipMenu").eq(1).css("display","none");
        $(".BusinessMenu").eq(1).css("display","block");
        $(".EconomyMenu").eq(1).css("display","none");
    }else{
        $(".VipMenu").eq(1).css("display","none");
        $(".BusinessMenu").eq(1).css("display","none");
        $(".EconomyMenu").eq(1).css("display","block");
    }
    $(".Pay").eq(1).text(airEndPay);
})

var StartSeatCount=0;
var EndSeatCount=0;
$(".EconomySeat").click(function(){
    $(this).css("content","url(/resources/upload/air/air_icon2_2.png)")
    $(this).addClass('SelectedEconomySeat');

    $(".SelectedEconomySeat").click(function(){
        $(this).css("content","url(/resources/upload/air/air_icon2.png)")
        $(this).removeClass('SelectedEconomySeat');
    })
})
$(".BusinessSeat").click(function(){
    $(this).css("content","url(/resources/upload/air/air_icon3_2.png)")
    $(this).addClass('SelectedBusinessSeat');

    $(".SelectedBusinessSeat").click(function(){
        $(this).css("content","url(/resources/upload/air/air_icon3.png)")
        $(this).removeClass('SelectedBusinessSeat');
    })
})
$(".VipSeat").click(function(){
    $(this).css("content","url(/resources/upload/air/air_icon_2.png)")
    $(this).addClass('SelectedVipSeat');

    $(".SelectedVipSeat").click(function(){
        $(this).css("content","url(/resources/upload/air/air_icon.png)")
        $(this).removeClass('SelectedVipSeat');
    })
})



