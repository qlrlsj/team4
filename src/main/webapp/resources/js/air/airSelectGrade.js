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
var StartSeatCount=0;
var EndSeatCount=0;
$(".Pay").eq(0).text(airStartPay);
$(".Pay").eq(1).text(airEndPay);
$("input[name=airStartPay]").change(function(){
    StartSeatCount=0;
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
    EndSeatCount=0;
    airEndGrade = this.value;
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
var EC1 = 0;
var EC2 = 0;
var BC1 = 0;
var BC2 = 0;
var VC1 = 0;
var VC2 = 0;
$(".EconomySeat").click(function(){
    var text = $(this).css("content").substr(-15,13);
    //$(this).css("content").substr(-15,13) = air_icon2.png
    if(text=='air_icon2.png'){
        $(this).addClass('SelectedEconomySeat');
        $(this).css("content","url(/resources/upload/air/air_icon2_2.png)")
        if($(this).parent().parent().parent().hasClass("ec1")){
            EC1++;
        }else{
            EC2++;
        }
    }else{
        $(this).css("content","url(/resources/upload/air/air_icon2.png)")
        $(this).removeClass('SelectedEconomySeat');
        if($(this).parent().parent().parent().hasClass("ec1")){
            EC1--;
        }else{
            EC2--;
        }
    }
    
})
$(".BusinessSeat").click(function(){
    var text = $(this).css("content").substr(-15,13);
    if(text=='air_icon3.png'){
        $(this).css("content","url(/resources/upload/air/air_icon3_2.png)")
        $(this).addClass('SelectedBusinessSeat');
        if($(this).parent().parent().parent().hasClass("bc1")){
            BC1++;
        }else{
            BC2++;
        }
    }else{
        $(this).css("content","url(/resources/upload/air/air_icon3.png)")
        $(this).removeClass('SelectedBusinessSeat');
        if($(this).parent().parent().parent().hasClass("bc1")){
            BC1--;
        }else{
            BC2--;
        }
    }
})
$(".VipSeat").click(function(){
    var text = $(this).css("content").substr(-14,12);
    if(text=='air_icon.png'){
        $(this).css("content","url(/resources/upload/air/air_icon_2.png)")
        $(this).addClass('SelectedVipSeat');
        if($(this).parent().parent().parent().hasClass("vc1")){
            VC1++;
        }else{
            VC2++;
        }
    }else{
        $(this).css("content","url(/resources/upload/air/air_icon.png)")
        $(this).removeClass('SelectedVipSeat');
        if($(this).parent().parent().parent().hasClass("vc1")){
            VC1--;
        }else{
            VC2--;
        }
    }
})
