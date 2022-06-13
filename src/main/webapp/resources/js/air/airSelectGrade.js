var airStartGrade=1;
var airStartPay = 50000;
var airEndGrade=1;
var airEndPay = 50000;
var StartSeatCount=0;
var EndSeatCount=0;

$(function(){
    //편도일경우
    if($(".edCheck").text()==''){
        $(".airTableBase").css("height","200px");
        $(".EndSelectSeat").css("display","none");
        $(".SelectSeatMenu").css("height","250px");
        $(".comback").css("display","none");
        $(".SelectSeatMenu").css("margin-top","200px");
        console.log($("input[name=airNumberST]").val());
        $.ajax({
            type:"POST",
            url:"/findSeat.kt",
            data:{
                StartNumberST : $("input[name=airNumberST]").val(),
                date :  $("input[name=airDateST]").val()
            },
            success: function(list){
                if(list.length==0){
                    console.log("예약좌석없음");
                }else{
                    for(let i=0;i<list.length;i++){
                        for(let j=0;j<$(".modal1 .VipSeat").length;j++){
                            if($(".modal1 .VipSeat").eq(j).text()==list[i]){
                                $(".modal1 .VipSeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal1 .VipSeat").eq(j).addClass("VipDisable");
                                $(".modal1 .VipSeat").eq(j).removeClass("VipSeat");
                            }
                        }
                        for(let j=0;j<$(".BusinessSeat").length;j++){
                            if($(".modal1 .BusinessSeat").eq(j).text()==list[i]){
                                $(".modal1 .BusinessSeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal1 .BusinessSeat").eq(j).addClass("BusinessDisable");
                                $(".modal1 .BusinessSeat").eq(j).removeClass("BusinessSeat");
                            }
                        }
                        for(let j=0;j<$(".EconomySeat").length;j++){
                            if($(".modal1 .EconomySeat").eq(j).text()==list[i]){
                                $(".modal1 .EconomySeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal1 .EconomySeat").eq(j).addClass("EconomyDisable");
                                $(".modal1 .EconomySeat").eq(j).removeClass("EconomySeat");
                            }
                        }
                        console.log(list[i]);
                    }
                }
            },
            error : function(){
                alert("결제내역등록 진입 실패");
            }
        });

    }else{
        $.ajax({
            type:"POST",
            url:"/findSeat.kt",
            data:{
                StartNumberST : $("input[name=airNumberST]").val(),
                date :  $("input[name=airDateST]").val()
            },
            success: function(list){
                if(list.length==0){
                    console.log("예약좌석없음");
                }else{
                    for(let i=0;i<list.length;i++){
                        for(let j=0;j<$(".modal1 .VipSeat").length;j++){
                            if($(".modal1 .VipSeat").eq(j).text()==list[i]){
                                $(".modal1 .VipSeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal1 .VipSeat").eq(j).addClass("VipDisable");
                                $(".modal1 .VipSeat").eq(j).removeClass("VipSeat");
                            }
                        }
                        for(let j=0;j<$(".BusinessSeat").length;j++){
                            if($(".modal1 .BusinessSeat").eq(j).text()==list[i]){
                                $(".modal1 .BusinessSeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal1 .BusinessSeat").eq(j).addClass("BusinessDisable");
                                $(".modal1 .BusinessSeat").eq(j).removeClass("BusinessSeat");
                            }
                        }
                        for(let j=0;j<$(".EconomySeat").length;j++){
                            if($(".modal1 .EconomySeat").eq(j).text()==list[i]){
                                $(".modal1 .EconomySeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal1 .EconomySeat").eq(j).addClass("EconomyDisable");
                                $(".modal1 .EconomySeat").eq(j).removeClass("EconomySeat");
                            }
                        }
                        console.log(list[i]);
                    }
                }
            },
            error : function(){
                alert("결제내역등록 진입 실패");
            }
        });
        $.ajax({
            type:"POST",
            url:"/findSeat.kt",
            data:{
                StartNumberST : $("input[name=airNumberED]").val(),
                date :  $("input[name=airDateED]").val()
            },
            success: function(list){
                if(list.length==0){
                    console.log("예약좌석없음");
                }else{
                    for(let i=0;i<list.length;i++){
                        for(let j=0;j<$(".modal2 .VipSeat").length;j++){
                            if($(".modal2 .VipSeat").eq(j).text()==list[i]){
                                $(".modal2 .VipSeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal2 .VipSeat").eq(j).addClass("VipDisable");
                                $(".modal2 .VipSeat").eq(j).removeClass("VipSeat");
                            }
                        }
                        for(let j=0;j<$(".BusinessSeat").length;j++){
                            if($(".modal2 .BusinessSeat").eq(j).text()==list[i]){
                                $(".modal2 .BusinessSeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal2 .BusinessSeat").eq(j).addClass("BusinessDisable");
                                $(".modal2 .BusinessSeat").eq(j).removeClass("BusinessSeat");
                            }
                        }
                        for(let j=0;j<$(".EconomySeat").length;j++){
                            if($(".modal2 .EconomySeat").eq(j).text()==list[i]){
                                $(".modal2 .EconomySeat").eq(j).attr('onclick', '').unbind('click');
                                $(".modal2 .EconomySeat").eq(j).addClass("EconomyDisable");
                                $(".modal2 .EconomySeat").eq(j).removeClass("EconomySeat");
                            }
                        }
                        console.log(list[i]);
                    }
                }
            },
            error : function(){
                alert("결제내역등록 진입 실패");
            }
        });
    }
})

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
        $("input[name=addStartSeatNum]").val(text);
        let text2 = $(".addEndSeat>span").eq(0).text()
        for(i=1;i<$(".addEndSeat>span").length;i++){
            text2 += ", "+ $(".addEndSeat>span").eq(i).text();
        }
        $(".addEndSeatNum").text(text2);
        $("input[name=addEndSeatNum]").val(text2);
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
        if($("input[name=bookerName]").val()==''||$("input[name=memberEmail]").val()==''||$("input[name=memberPhone]").val()==''){
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
            $(".userName").text($("input[name=bookerName]").val());
            $(".userEmail").text($("input[name=memberEmail]").val());
            $(".userPhone").text($("input[name=memberPhone]").val());
            $(".payAmount").text(Number($(".addStartPay").eq(1).text())+Number($(".addEndPay").eq(1).text()));
            $(".paymentAmount").text(Number($(".addStartPay").eq(1).text())+Number($(".addEndPay").eq(1).text()));
        }
    }else{
        alert("약관에 동의해주세요.");
    }
})
var couponlist; 
const memberNo = Number($(".memberNo").text());
$(".couponSelect").click(function(){
    $.ajax({
        type:"POST",
        url:"/selectAllCoupon.kt",
        data:{memberNo:memberNo},
        success: function(list){
            $(".airTable5>tbody").empty();
            
            if(list.length==0){
                const tr = $("<tr>");
                const td = $("<td colspan='5' style='font-size:30px; height:200px; line-height:300px'>");

                td.append("조회 가능한 쿠폰없습니다");
                tr.append(td);
                $(".airTable5>tbody").append(tr);
                
            }else{ 
                couponlist=list;
                for(let i=0;i<list.length;i++){
                    if(list[i].couponRange==0||list[i].couponRange==1){
                        const tr = $("<tr>");
                        let td ="<td>"+"<input type='radio' name='index' value='"+i+"'>"+"</td>";
                        td+='<td>' +list[i].couponName+'</td>';
                        td+='<td>' +list[i].couponDCPrice+'</td>';
                        td+='<td>' +list[i].couponDCRate+'</td>';
                        td+='<td>' +list[i].conponEndDate+'</td>';
                        tr.append(td);
                        $(".airTable5>tbody").append(tr);
                    }
                }
            }
        },
        error : function(){
            alert("실패");
        }
    })
})

var couponNum = -1;
$(".selectedCoupon").on("click",function(){
    // 선택한 쿠폰의 사용조건보다 예매가격이 큰경우
    if(Number(couponlist[$("input[name=index]:checked").val()].couponIf)<Number($(".addStartPay").eq(1).text())+Number($(".addEndPay").eq(1).text())){
        //쿠폰적용할인금액에 할인금액 + 예매가격*할인율
        $(".coupon").text(Number(couponlist[$("input[name=index]:checked").val()].couponDCPrice)+Number(couponlist[$("input[name=index]:checked").val()].couponDCRate)/100*(Number($(".addStartPay").eq(1).text())+Number($(".addEndPay").eq(1).text())));
        $(".paymentAmount").text(Number($(".addStartPay").eq(1).text())+Number($(".addEndPay").eq(1).text())-Number($(".coupon").text())-$(".pointSelect").val());
        couponNum = couponlist[$("input[name=index]:checked").val()].couponNo;
    }
})
$(".pointSelect").change(function(){
    if($(this).val() > Number($(".memberPoint").text())){
        alert("보유 포인트보다 많이쓸수 없습니다");
        $(this).val(0);
    }else if($(this).val()%1000>0){
        alert("1000원 단위로 사용가능");
        $(this).val(0);
    }else{
        $(".paymentAmount").text(Number($(".addStartPay").eq(1).text())+Number($(".addEndPay").eq(1).text())-Number($(".coupon").text())-$(".pointSelect").val());
    }
})
var payCheck1 = false;
var payCheck2 = false;
var payCheck3 = false;
$(".nextMenu3").on("click",function(){
    //거래 고유 ID를 생성하기위해 현재 날짜를 이용해서 처리
    const d = new Date();
    //date 값 생성시 ""를 더하지 않으면 숫자 + 연산이 되므로 문자 덧샘을 추가
    const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
    IMP.init("imp43584751");//결재API사용을 위한 식별코드입력
    IMP.request_pay({
        merchant_uid : $(".airST").text()+"_"+date,//거래아이디
        name:"KTRIP_PAYMENT",				            //결재이름
        amount:Number($(".paymentAmount").text()),		//결재금액
        buyer_email:$(".userEmail").text(),	            //구매자이메일
        buyer_name:$(".userName").text(),				//구매자이름
        buyer_tel:$(".userPhone").text()		        //구매자전번
    }),function(rsp){
        if(rsp.success){
            $(".payCompleteBtn").trigger("click");
        }else{
            alert("에러내용:"+rsp.err_msg);
        }
    }
})
let paymentNo=0;
$(".payCompleteBtn").click(function(){
    console.log(Number($(".paymentAmount").text()));
    console.log(Number($(".coupon").text()));
    console.log(Number($(".pointSelect").val()));
    console.log(Math.round(Number($(".paymentAmount").text())*(3-Number($(".memberLevel").text())))*0.01);
    $.ajax({
        type:"POST",
        url:"/insertPayment.kt",
        data:{
            payPrice:Number($(".paymentAmount").text()),
            payCoupon:Number($(".coupon").text()),
            pointUse:Number($(".pointSelect").val()),
            pointAdd:Math.round(Number($(".paymentAmount").text())*(3-Number($(".memberLevel").text())))*0.01,
            payCouponCode:couponNum
        },
        success: function(data){
            if(data==0){
                alert("결제내역등록 중 에러발생");
            }else{
                payCheck1=true;
                paymentNo=data;
            }
        },
        error : function(){
            alert("결제내역등록 진입 실패");
        }
    });

    if($(".pointSelect").val()!=0){
        $.ajax({
            type:"POST",
            url:"/updateMemberPoint.kt",
            data:{
                updatePoint:Math.round(Number($(".paymentAmount").text())*(3-Number($(".memberLevel").text())))*0.01 - Number($(".pointSelect").val()),
                memberNo:memberNo
            },
            success: function(data){
                if(data==0){
                    alert("포인트 업데이트 중 에러발생")
                }else{
                    payCheck2=true;
                }
            },
            error : function(){
                alert("포인트 업데이트 진입 실패");
            }
        });
    }else{
        console.log("패스");
        payCheck2=true;
    }
    if(Number($(".coupon").text())!=0){
        $.ajax({
            type:"POST",
            url:"/updateCouponUse.kt",
            data:{
                couponNo:couponlist[$("input[name=index]:checked").val()].couponNo,
                userNo:memberNo
            },
            success: function(data){
                if(data==0){
                    alert("쿠폰 업데이트 중 에러발생")
                }else{
                    payCheck3=true;
                }
            },
            error : function(){
                alert("쿠폰 업데이트 진입 실패");
            }
        });
    }else{
        console.log("패스");
        payCheck3=true;
    }
    setTimeout(function(){
        if(payCheck1&&payCheck2&&payCheck3){
            $("input[name=payNo]").val(paymentNo);
            $("input[name=memberName]").val($("input[name=bookerName]").val());
            $("input[name=airPay]").val(Number($(".paymentAmount").text()));
            $("input[name=phone]").val($("input[name=memberPhone]").val());
            $("input[name=airLevelST]").val(Number($("input[name=airStartPay]").val()));
            if($(".edCheck").text()!=''){
                $("input[name=airLevelED]").val(Number($("input[name=airEndPay]").val()));
            }
            $(".payComplete").trigger("click");
        }else{
            console.log(payCheck1);
            console.log(payCheck2);
            console.log(payCheck3);
            alert("실행중 에러발생");
            // location.href="selectAllAir.kt";
        }
    }, 2000);
    
})