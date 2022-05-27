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
