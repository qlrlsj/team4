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
$(".submitBtn").click(function(){
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
    $(".submitbtn").trigger("click");
})