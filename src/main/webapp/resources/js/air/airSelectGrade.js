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
$(".nextMenu2").click(function(){
    if(check1&&check2){
        if($("input[name=memberName]").val()==''||$("input[name=memberEmail]").val()==''||$("input[name=memberPhone]").val()==''){
            alert("예약정보를 입력해주세요");
        }else if(!$("input[name=memberEmail]").val().includes('@')){
            alert("이메일 형식이 잘못됐어요");
        }else if(!$("input[name=memberPhone]").val().includes('-',3)||!$("input[name=memberPhone]").val().includes('-',8)){
            alert("전화번호를 010-0000-0000 형식으로 입력해주세요")
        }else{
            $(".airTableBase2").css("display","none");
            $(".airTableBase3").css("display","block");
            $(".Proceeding").removeClass("Proceeding");
            $(".orderDiv").eq(2).addClass("Proceeding");
            $(".userName").text($("input[name=memberName]").val());
            $(".userEmail").text($("input[name=memberEmail]").val());
            $(".userPhone").text($("input[name=memberPhone]").val());
            $(".payAmount").text(Number($(".addStartPay").eq(1).text())+Number($(".addEndPay").eq(1).text())+"(원)");
            $(".paymentAmount").text(Number($(".addStartPay").eq(1).text())+Number($(".addEndPay").eq(1).text())+"(원)");
        }
    }else{
        alert("약관에 동의해주세요.");
    }
})
$(".couponSelect").click(function(){
    $.ajax({
        type:"POST",
        url:"/selectAllCoupon.kt",
        data:{memberNo:71},
        success: function(list){
            $(".airTable5>tbody").empty();
            console.log(list);
            if(list.length==0){
                const tr = $("<tr>");
                const td = $("<td colspan='5' style='font-size:30px; height:200px; line-height:300px'>");

                td.append("조회 가능한 쿠폰없습니다");
                tr.append(td);
                $(".airTable5>tbody").append(tr);
                
            }else{
                for(let i=0;i<list.length;i++){
                    const tr = $("<tr>");
                    console.log(tr);
                    console.log(list[i].couponName);

                    let td ='<td>'+'aa'+'</td>';
                    td+='<td>' +list[i].couponName+'</td>';
                    td+='<td>' +list[i].couponDCPrice+'</td>';
                    td+='<td>' +list[i].couponDCRate+'</td>';
                    td+='<td>' +list[i].conponEndDate+'</td>';
                    tr.append(td);
                    $(".airTable5>tbody").append(tr);
                }
            }
        },
        error : function(){
            alert("실패");
        }
    })
})




$("#payment").on("click",function(){
    const price = $("#totalPrice").text();
    //거래 고유 ID를 생성하기위해 현재 날짜를 이용해서 처리
    const d = new Date();
    //date 값 생성시 ""를 더하지 않으면 숫자 + 연산이 되므로 문자 덧샘을 추가
    const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
    IMP.init("imp43584751");//결재API사용을 위한 식별코드입력
    IMP.request_pay({
        merchant_uid :"상품코드_"+date,//거래아이디
        name:"결재테스트",				//결재이름
        amount:price,				//결재금액
        buyer_email:"gyehf3492@naver.com",	//구매자이메일
        buyer_name:"구매자",				//구매자이름
        buyer_tel:"010-5378-3492",		//구매자전번
        buyer_addr:"인천서구가정동",			//구매자주소
        buyer_postcode:"12345",			//구매자 우편번호
        
    }),function(rsp){
        if(rsp.success){
            console.log("결재완료");
            console.log("고유ID:"+rsp.imp);
            console.log("상점거래ID"+rsp.merchant_uid);
            console.log("결재금액"+rsp.paid_amount);
            console.log("카드승인번호"+rsp.apply_num);
            
        }else{
            alert("에러내용:"+rsp.err_msg);
        }
    }
})