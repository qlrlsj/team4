var startAirSelectTr;
var endAirSelectTr;
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
});

function startSelect(obj){
    $(".airStart").val($(obj).children().text());
    $(".btn-close").trigger("click");
    overlapCheck();
}
function EndSelect(obj){
    $(".airEnd").val($(obj).children().text());
    $(".btn-close").trigger("click");
    overlapCheck();
}
function overlapCheck(){
    if($(".airStart").val()==$(".airEnd").val()){
        alert("출발지와 도착지가 같습니다.");
        $(".airStart").val("");
        $(".airEnd").val("");
    }
}
function howtoway(num){
    if(num==0){
        $(".comback").hide();
        $(".comDate").val("");
    }else{
        $(".comback").show();
    }
}
$(function(){
    $(".datepicker").datepicker({minDate:0});

})
function call()	{
    var ar1 = $(".goDate").val().split('-');
    var ar2 = $(".comDate").val().split('-');
    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
    var dif = da2 - da1;
    if(dif<0){
        alert("가는 날과 오는 날의 날짜를 확인해주세요.");
        $(".goDate").val("");
        $(".comDate").val("");
    }
}
function sizeAdd(){
    
    const airTable = document.querySelector('.airTable');
    const airTableBodyA = document.querySelector('.airTableBodyA');
    const airTableBodyB = document.querySelector('.airTableBodyB');
    const height = airTable.offsetHeight + 600;
    const airTableBodyHeightA = airTableBodyA.offsetHeight;
    const airTableBodyHeightB = airTableBodyB.offsetHeight;
    $(".airTable").css("height",height);
    if(height+50>airTableBodyHeightA){
        $(".airTableA").css("height",airTableBodyHeightA);
    }
    if(height+50>airTableBodyHeightB){
        $(".airTableB").css("height",airTableBodyHeightB);
    }
    if(height+50>airTableBodyHeightA && height+50>airTableBodyHeightB){
        console.log(height);
        console.log(airTableBodyHeightA);
        console.log(airTableBodyHeightB);
        const airTable = document.querySelector('.airTable');
        console.log(airTable.offsetHeight);
        $(".airTable").css("height",((airTableBodyHeightA>airTableBodyHeightB)?airTableBodyHeightA:airTableBodyHeightB)+30);
    }
    
}
$(".goDate").change(function(){
    call();
})
$(".comDate").change(function(){
    call();
})
$(".amount").change(function(){
    if($(this).val()>8||$(this).val()<1){
        alert("잘못된 입력입니다.");
        $(this).val(1);
    }
})
function startAirSelect(obj){
    if(startAirSelectTr==null){
        startAirSelectTr = $(obj).parent().parent();
        startAirSelectTr.addClass('startSelectTr');
    }else{
        startAirSelectTr.removeClass('startSelectTr');
        startAirSelectTr = $(obj).parent().parent();
        startAirSelectTr.addClass('startSelectTr');
    }
    $(".selectStartAirLine").text(startAirSelectTr.children().eq(0).text());
    $(".selectStartAirStartTime").text(startAirSelectTr.children().eq(1).text());
    $(".selectStartAirEndTime").text(startAirSelectTr.children().eq(2).text());
    $(".selectStartPay").text(startAirSelectTr.children().eq(3).text());
    $(".selectAirStartNumber").text(startAirSelectTr.children().eq(4).text());
    $(obj).attr("onclick","startAirSelectRemove(this)");
}

function endAirSelect(obj){
    if(endAirSelectTr==null){
        endAirSelectTr = $(obj).parent().parent();
        endAirSelectTr.addClass('endSelectTr');
    }else{
        endAirSelectTr.removeClass('endSelectTr');
        endAirSelectTr = $(obj).parent().parent();
        endAirSelectTr.addClass('endSelectTr');
    }
    $(".selectEndAirLine").text(endAirSelectTr.children().eq(0).text());
    $(".selectEndAirStartTime").text(endAirSelectTr.children().eq(1).text());
    $(".selectEndAirEndTime").text(endAirSelectTr.children().eq(2).text());
    $(".selectEndPay").text(endAirSelectTr.children().eq(3).text());
    $(".selectAirEndNumber").text(endAirSelectTr.children().eq(4).text());
    $(obj).attr("onclick","endAirSelectRemove(this)");
}

function startAirSelectRemove(obj){
    startAirSelectTr.removeClass('startSelectTr');
    startAirSelectTr==null;
    $(".selectStartAirLine").text("");
    $(".selectStartAirStartTime").text("");
    $(".selectStartAirEndTime").text("");
    $(".selectStartPay").text("");
    $(".selectAirStartNumber").text("");
    $(obj).attr("onclick","startAirSelect(this)");
}
function endAirSelectRemove(obj){
    endAirSelectTr.removeClass('endSelectTr');
    endAirSelectTr==null;
    $(".selectEndAirLine").text("");
    $(".selectEndAirStartTime").text("");
    $(".selectEndAirEndTime").text("");
    $(".selectEndPay").text("");
    $(".selectAirEndNumber").text("");
    $(obj).attr("onclick","endAirSelect(this)");
}

function airReserveBtn(){
    const url = new URL(document.location.href);
	const urlParams = url.searchParams;
    
    $("[name=airLineST]").val($(".selectStartAirLine").text());
    $("[name=airNumberST]").val($(".selectAirStartNumber").text());
    $("[name=airStartTimeST]").val($(".selectStartAirStartTime").text());
    $("[name=airEndTimeST]").val($(".selectStartAirEndTime").text());
    $("[name=airStartST]").val(urlParams.get("airStart"));
    $("[name=airArriveST]").val(urlParams.get("airArrive"));
    $("[name=airDateST]").val(urlParams.get("airStartDate"));
    $("[name=airPayST]").val($(".selectStartPay").text());
    $("[name=airLineED]").val($(".selectEndAirLine").text());
    $("[name=airNumberED]").val($(".selectAirEndNumber").text());
    $("[name=airStartTimeED]").val($(".selectEndAirStartTime").text());
    $("[name=airEndTimeED]").val($(".selectEndAirEndTime").text());
    $("[name=airStartED]").val(urlParams.get("airArrive"));
    $("[name=airArriveED]").val(urlParams.get("airStart"));
    $("[name=airDateED]").val(urlParams.get("airEndDate"));
    $("[name=airPayED]").val($(".selectEndPay").text());
    
    $(".submitBtn").trigger("click");
}

$(".airSubmitBtn").click(function(){
    if($(".airStart").val()==''){
        alert("출발지입력");
        return false;
    }
    if($(".airEnd").val()==''){
        alert("도착지입력");
        return false;
    }
    if($(".goDate").val()==''){
        alert("출발일입력");
        return false;
    }
    if($(".comDate").val()=='' && $(".comDate").css("display") !="none"){
        alert("도착일입력");
        return false;
    }
    if($(".amount").val()==''){
        alert("인원수 입력");
        return false;
    }
    $(".airBtn").trigger("click");
})