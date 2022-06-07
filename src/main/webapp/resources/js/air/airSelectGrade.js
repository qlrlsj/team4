$(function(){
    //편도일경우
    if($(".edCheck").text()==''){
        $(".airTableBase").css("height","200px");
        $(".EndSelectSeat").css("display","none");
        $(".SelectSeatMenu").css("height","250px");
        $(".comback").css("display","none");
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
    EC1 = 0;
    BC1 = 0;
    VC1 = 0;
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
    $(".Amount").eq(0).text(0);
    $(".Multiply").eq(0).text(0);
    $(".modal1 .SelectedEconomySeat").css("content","url(/resources/upload/air/air_icon2.png)")
    $(".modal1 .SelectedBusinessSeat").css("content","url(/resources/upload/air/air_icon3.png)")
    $(".modal1 .SelectedVipSeat").css("content","url(/resources/upload/air/air_icon.png)");
    $(".modal1 .SelectedEconomySeat").removeClass('SelectedEconomySeat');
    $(".modal1 .SelectedBusinessSeat").removeClass('SelectedBusinessSeat');
    $(".modal1 .SelectedVipSeat").removeClass('SelectedEconomySeat');
    
})
$("input[name=airEndPay]").change(function(){
    EC2 = 0;
    BC2 = 0;
    VC2 = 0;
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
    $(".Amount").eq(1).text(0);
    $(".Multiply").eq(1).text(0);
    $(".modal2 .SelectedEconomySeat").css("content","url(/resources/upload/air/air_icon2.png)")
    $(".modal2 .SelectedBusinessSeat").css("content","url(/resources/upload/air/air_icon3.png)")
    $(".modal2 .SelectedVipSeat").css("content","url(/resources/upload/air/air_icon.png)");
    $(".modal2 .SelectedEconomySeat").removeClass('SelectedEconomySeat');
    $(".modal2 .SelectedBusinessSeat").removeClass('SelectedBusinessSeat');
    $(".modal2 .SelectedVipSeat").removeClass('SelectedEconomySeat');
    
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
            $(".Amount").eq(0).text(EC1);
            $(".Multiply").eq(0).text($(".Pay").eq(0).text() * EC1);
        }else{
            EC2++;
            $(".Amount").eq(1).text(EC2);
            $(".Multiply").eq(1).text($(".Pay").eq(1).text() * EC2);
        }
    }else{
        $(this).css("content","url(/resources/upload/air/air_icon2.png)")
        $(this).removeClass('SelectedEconomySeat');
        if($(this).parent().parent().parent().hasClass("ec1")){
            EC1--;
            $(".Amount").eq(0).text(EC1);
            $(".Multiply").eq(0).text($(".Pay").eq(0).text() * EC1);
        }else{
            EC2--;
            $(".Amount").eq(1).text(EC2);
            $(".Multiply").eq(1).text($(".Pay").eq(1).text() * EC2);
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
            $(".Amount").eq(0).text(BC1);
            $(".Multiply").eq(0).text($(".Pay").eq(0).text() * BC1);
        }else{
            BC2++;
            $(".Amount").eq(1).text(BC2);
            $(".Multiply").eq(1).text($(".Pay").eq(1).text() * BC2);
        }
    }else{
        $(this).css("content","url(/resources/upload/air/air_icon3.png)")
        $(this).removeClass('SelectedBusinessSeat');
        if($(this).parent().parent().parent().hasClass("bc1")){
            BC1--;
            $(".Amount").eq(0).text(BC1);
            $(".Multiply").eq(0).text($(".Pay").eq(0).text() * BC1);
        }else{
            BC2--;
            $(".Amount").eq(1).text(BC2);
            $(".Multiply").eq(1).text($(".Pay").eq(1).text() * BC2);
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
            $(".Amount").eq(0).text(VC1);
            $(".Multiply").eq(0).text($(".Pay").eq(0).text() * VC1);
        }else{
            VC2++;
            $(".Amount").eq(1).text(VC2);
            $(".Multiply").eq(1).text($(".Pay").eq(1).text() * VC2);
        }
    }else{
        $(this).css("content","url(/resources/upload/air/air_icon.png)")
        $(this).removeClass('SelectedVipSeat');
        if($(this).parent().parent().parent().hasClass("vc1")){
            VC1--;
            $(".Amount").eq(0).text(VC1);
            $(".Multiply").eq(0).text($(".Pay").eq(0).text() * VC1);
        }else{
            VC2--;
            $(".Amount").eq(1).text(VC2);
            $(".Multiply").eq(1).text($(".Pay").eq(1).text() * VC2);
        }
    }
})
const addStartSeat = $('.addStartSeat');
const addEndSeat = $('.addEndSeat');
$(".selectEnd").click(function(){
    $(".addStartSeat>span").remove();
    $(".addEndSeat>span").remove();
    for(i=0;i<$(".modal1 .SelectedEconomySeat").length;i++){
        const startSeatEC = $(".modal1 .SelectedEconomySeat").eq(i).text();
        const addSpan = $("<span>");
        addSpan.text(startSeatEC);
        addSpan.addClass('addSeat');
        addStartSeat.append(addSpan);
    }
    for(i=0;i<$(".modal1 .SelectedBusinessSeat").length;i++){
        const startSeatEC = $(".modal1 .SelectedBusinessSeat").eq(i).text();
        const addSpan = $("<span>");
        addSpan.text(startSeatEC);
        addSpan.addClass('addSeat');
        addStartSeat.append(addSpan);
    }
    for(i=0;i<$(".modal1 .SelectedVipSeat").length;i++){
        const startSeatEC = $(".modal1 .SelectedVipSeat").eq(i).text();
        const addSpan = $("<span>");
        addSpan.text(startSeatEC);
        addSpan.addClass('addSeat');
        addStartSeat.append(addSpan);
    }

    for(i=0;i<$(".modal2 .SelectedEconomySeat").length;i++){
        const EndSeatEC = $(".modal2 .SelectedEconomySeat").eq(i).text();
        const addSpan = $("<span>");
        addSpan.text(EndSeatEC);
        addSpan.addClass('addSeat');
        addEndSeat.append(addSpan);
    }
    for(i=0;i<$(".modal2 .SelectedBusinessSeat").length;i++){
        const EndSeatEC = $(".modal2 .SelectedBusinessSeat").eq(i).text();
        const addSpan = $("<span>");
        addSpan.text(EndSeatEC);
        addSpan.addClass('addSeat');
        addEndSeat.append(addSpan);
    }
    for(i=0;i<$(".modal2 .SelectedVipSeat").length;i++){
        const EndSeatEC = $(".modal2 .SelectedVipSeat").eq(i).text();
        const addSpan = $("<span>");
        addSpan.text(EndSeatEC);
        addSpan.addClass('addSeat');
        addEndSeat.append(addSpan);
    }
})
$(".nextMenu").click(function(){
    if(($(".addStartSeat .addSeat").text()!='') && ($(".addEndSeat .addSeat").text()!='' || $(".edCheck").text()=='')){
        $(".airTableBase").css("display","none");
        $(".airTableSelect").css("display","none");
        $(".Proceeding").removeClass("Proceeding");
        $(".orderDiv").eq(1).addClass("Proceeding");
        $(".addStartPay").text($(".Multiply").eq(0).text());
        $(".addEndPay").text($(".Multiply").eq(1).text());
        let text = $(".addStartSeat>span").eq(0).text()
        for(i=1;i<$(".addStartSeat>span").length;i++){
            text += ", "+ $(".addStartSeat>span").eq(i).text();
        }
        $(".addStartSeatNum").text(text);
        let text2 = $(".addEndSeat>span").eq(0).text()
        for(i=1;i<$(".addEndSeat>span").length;i++){
            text2 += ", "+ $(".addEndSeat>span").eq(i).text();
        }
        $(".addEndSeatNum").text(text2);
    }else{
        alert("좌석을 선택해 주세요");
    }
    $(".airTableBase2").css("display","block");
})
let check1 = false;
let check2 = false;
$(".btnIcon").click(function(){
    if($(this).css("color")!="rgb(255, 0, 0)"){
        $(this).css("color","red");
    }else{
        $(this).css("color","rgb(67, 67, 67);");
    }
})
$(".btnIcon").eq(0).click(function(){
    check1 = !check1;
})
$(".btnIcon").eq(1).click(function(){
    check2 = !check2;
})