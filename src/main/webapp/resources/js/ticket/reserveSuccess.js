$(document).ready(function(){
    const ticketNo = Number($("#ticketNo").val());
    const reserveNo = $("#reserveNo").val();
    console.log("ticketNo : "+ticketNo);
    console.log("reserveNo : "+reserveNo);
    $.ajax({
        type:"POST",
        url:"/selectReserveInfo.kt",
        data:{ticketNo:ticketNo,reserveNo:reserveNo},
        success: function (ri) {
            console.log(ri);
            $("#filepath").attr("src","/resources/upload/ticket/"+ri.ticketFilepath1);
            console.log(ri.ticketTitle);
            $("#title").text(ri.ticketTitle);
            for(let i=0; i<ri.optionInfo.length;i++){
                const infoBottom = $(".infoBottom");
                const rowDiv = $("<div></div>");
                rowDiv.addClass("row");
                let div = $("<div></div>");
                div.addClass("col");
                div.text(ri.optionInfo[i].optTitle);
                rowDiv.append(div);
                div = $("<div></div>");
                div.addClass("col");
                div.text(ri.optionInfo[i].optQuantity+" X "+ ri.optionInfo[i].optPrice);
                rowDiv.append(div);
                div = $("<div></div>");
                div.addClass("col");
                div.text(ri.optionInfo[i].optQuantity*ri.optionInfo[i].optPrice +" 원");
                rowDiv.append(div);
                infoBottom.append(rowDiv);
                
            }
            // for(let i=0;i<ri.couponList.length;i++){
            //             const option = $("<option></option>");
            //             option.val(cp.couponList[i].couponNo);
            //             option.text(cp.couponList[i].couponName);
            //             option.attr("couponDCPrice",cp.couponList[i].couponDCPrice);
            //             option.attr("couponDCRate",cp.couponList[i].couponDCRate);
            //             coupon.append(option);
        //     coupon.append("<option value='0'>쿠폰을 선택해주세요.</option>");
        //   if(cp.couponList.length == 0){
        //     coupon.append("<option value='0'>사용 가능한 쿠폰이 없습니다.</option>");
        //   }else{
        //       for(let i=0;i<cp.couponList.length;i++){
        //         const option = $("<option></option>");
        //         option.val(cp.couponList[i].couponNo);
        //         option.text(cp.couponList[i].couponName);
        //         option.attr("couponDCPrice",cp.couponList[i].couponDCPrice);
        //         option.attr("couponDCRate",cp.couponList[i].couponDCRate);
        //         coupon.append(option);

        //         // if(totalPrice>=cp.couponList[i].couponIf){
        //         //     coupon.append("<option value='"+cp.couponList[i].couponNo+"'>"+cp.couponList[i].couponName+"</option>");
        //         // }
        //       }
        //   }
          
        }
      });
});