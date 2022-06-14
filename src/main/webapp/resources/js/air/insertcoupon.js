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
let couponlist;

$(function(){
    const d = new Date();
    let month = d.getMonth()+1;
    if(month<10){
        month = "0" + month;
    }
    $(".datepicker").datepicker({minDate:0});
    $("input[name=couponDate]").val(d.getFullYear()+"-"+month+"-"+d.getDate());
    $("input[name=couponRange]").val(0);
    $.ajax({
        type:"POST",
        url:"/selectCoupon.kt",
        // data:{memberNo:memberNo},
        success: function(list){
            $(".couponTable>tbody").empty();
            
            if(list.length==0){
                const tr = $("<tr>");
                const td = $("<td colspan='6' style='font-size:30px; height:200px; line-height:300px'>");

                td.append("조회 가능한 쿠폰없습니다");
                tr.append(td);
                $(".couponTable>tbody").append(tr);
                
            }else{ 
                couponlist=list;
                for(let i=0;i<list.length;i++){
                    if(list[i].couponRange==0||list[i].couponRange==1){
                        const tr = $("<tr>");
                        let td ="<td>"+"<input type='radio' name='index' value='"+i+"'>"+"</td>";
                        td+='<td>' +list[i].couponName+'</td>';
                        td+='<td>' +list[i].couponDCPrice+'</td>';
                        td+='<td>' +list[i].couponDCRate+'</td>';
                        td+='<td>' +list[i].couponIf+'</td>';
                        td+='<td>202' +String(list[i].conponEndDate).substring(3,16)+'</td>';
                        tr.append(td);
                        $(".couponTable>tbody").append(tr);
                    }
                }
            }
        },
        error : function(){
            alert("실패");
        }
    })
})

$("input[btnradio]").click(function(){
    $("input[name=couponRange]").val($(this).val());
})

$(".submitBtn").click(function(){
    if($("input[name=conponEndDate]").val()==''){
        alert("유효기간입력");
        return false;
    }
    if($("input[name=couponName]").val()==''){
        alert("쿠폰이름입력");
        return false;
    }
    if($("input[name=couponIf]").val()==''){
        alert("쿠폰 사용 조건입력");
        return false;
    }
    if($("input[name=couponDCPrice]").val()==''){
        alert("할인가격 입력(없으면 0 입력)");
        return false;
    }
    if($("input[name=couponDCPrice]").val()<0){
        alert("할인가격 입력오류");
        return false;
    }
    if($("input[name=couponDCRate]").val()==''){
        alert("할인율 입력(없으면 0 입력");
        return false;
    }
    if($("input[name=couponDCRate]").val()>79 || $("input[name=couponDCRate]").val()<0){
        alert("할인율 입력오류");
        return false;
    }
    $(".gosubmit").click();
})
$(".couponSend").click(function(){
    console.log($("input[name=Id]").val());
    location.href="/couponSend.kt?Id="+$("input[name=Id]").val()+"&couponNo="+couponlist[$("input[name=index]").val()].couponNo;
})