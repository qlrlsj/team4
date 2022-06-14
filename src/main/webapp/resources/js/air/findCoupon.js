$(function(){
    let couponlist; 
    const memberNo=Number($(".MemberNo").text());
    $.ajax({
        type:"POST",
        url:"/findCouponUse.kt",
        data:{userNo:memberNo},
        success: function(list){
            $(".couponTable>tbody").empty();
            
            if(list.length==0){
                const tr = $("<tr>");
                const td = $("<td colspan='5' style='font-size:30px; height:200px; line-height:300px'>");

                td.append("조회 가능한 쿠폰없습니다");
                tr.append(td);
                $(".couponTable>tbody").append(tr);
                
            }else{ 
                couponlist=list;
                for(let i=0;i<list.length;i++){
                    if(list[i].couponRange==0||list[i].couponRange==1){
                        const tr = $("<tr>");
                        let td ="<td>"+i+"</td>";
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