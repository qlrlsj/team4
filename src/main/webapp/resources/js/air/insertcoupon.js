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

$(function(){
    const d = new Date();
    let month = d.getMonth()+1;
    if(month<10){
        month = "0" + month;
    }
    $(".datepicker").datepicker({minDate:0});
    $("input[name=couponDate]").val(d.getFullYear()+"-"+month+"-"+d.getDate());
    $("input[name=couponRange]").val(0);
})

$("input[btnradio]").click(function(){
    $("input[name=couponRange]").val($(this).val());
})
