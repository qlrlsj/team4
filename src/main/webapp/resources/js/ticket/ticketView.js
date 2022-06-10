
$(".minus").on("click", function () {
    const optQtt = Number($(this).next().val());
    //버튼 클릭시 value값 변경
    if (optQtt <= 0) {
        $(this).next().val(0);
    } else {
        $(this).next().val(optQtt-1);
    }
});

$(".plus").on("click", function () {
    const stock = Number($(this).prev().val());
    let optQtt = Number($(this).prev().prev().val());
    //버튼 클릭시 value값 변경
    if (optQtt < stock) {
        $(this).prev().prev().val(optQtt+1);
    }
});

$(".varyBtn").on("click",function(){
    const optQtt = Number($(this).parent().children().eq(1).val());
    const dPrice = Number($(this).parent().parent().children().eq(2).children().eq(2).val())
    const i = $(this).parent().parent().children().eq(0).val();
    console.log("i : "+i);
    console.log("optQtt : "+optQtt);
    console.log("dPrice : "+dPrice);
    console.log("optQtt*dPrice : "+optQtt*dPrice);
    $(".optQtt"+i).val(optQtt);
    $(".dPrice"+i).val(optQtt*dPrice);
    if(optQtt==0){
        $(".optQtt"+i).parent().parent().parent().css("display","none");
        
    }else{
        $(".optQtt"+i).parent().parent().parent().css("display","block");
    }

});




