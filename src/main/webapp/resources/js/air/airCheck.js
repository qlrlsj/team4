$(function(){
    for(let i=0;i<$(".orderDate").length;i++){
        $(".orderDate").eq(i).text($(".orderDate").eq(i).text().substr(0,10));
    }
    
})
$(".searchBtn").click(function(){
    
    const num = $(this).parent().parent().children().eq(0).text()
    location.href="/myAirPage.kt?airNumber="+num;
})