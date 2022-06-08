
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

//$(".addDiv").on("click",function(){})로 이벤트를 걸면 addDiv클래스를 삭제해도 버튼 자체에 이벤트가 남아있음(걸려있음) => 아래와 같은 방식으로 작성해야함 
//=>아래와 같은 방식으로 작성시 : 동적으로 생성된 코드도 쓸 수 있음
// $(document).on("click",".addDiv",function (){
//     const optTitle = $(this).parent().parent().children().eq(0).children().eq(0).val();
//     const optQtt = $(this).parent().children().eq(1).val();
//     const dPrice = $(this).parent().parent().children().eq(1).children().eq(2).val();
//     const optNo = $(this).parent().parent().children().eq(3).val();
//     console.log(optTitle);
//     let newDiv = document.createElement("div");
//     newDiv.setAttribute("class", "container addBox");
//     newDiv.innerHTML = "<input type='hidden' value="+optNo+"><div class='row'><div class='col optTitle'>"+optTitle+"</div><div class='col'>"+optQtt+" x "+dPrice+"</div><div class='col'>"+(optQtt*dPrice)+" 원</div></div>";
//     $("#priceBox").append(newDiv);
//     $(this).removeClass("addDiv");
// });

// var i = 0;
// $(".class"+i).on("click",function(){
//     console.log("성공");
// });
