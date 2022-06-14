$(document).ready(function(){
    // 		 날짜선택옵션
         $('#datepicker1').datepicker({dateFormat : 'yy-mm-dd'});

         $('#datepicker1').datepicker("option", "minDate", 0); // 시작일 오늘부터
        $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val()); //종료일보다 시작일을 늦게선택하는것 막기
        $('#datepicker1').datepicker("option", "maxDate", '+2M');
        $('#datepicker1').datepicker("option", "onClose", function ( selectedDate ) {
        $("#datepicker2").datepicker( "option", "minDate", selectedDate );
        });// 종료일이 시작일보다 빠르게 선택하는것 막기
    
        $('#datepicker2').datepicker({dateFormat : 'yy-mm-dd'});
  
        $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
        $('#datepicker2').datepicker("option", "maxDate", '+2M');
        $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
            $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
        });
            });

var filterIidx = 0;
var checkedComfortList = "";
var checkedServiceList = "";
var keyWord = $("[name=searchKeyword]").val();
var startDate = $("[name=startDate]").val();
var endDate = $("[name=endDate]").val();
var roomType = "";
var customerNum =  $("[name=customerNum]").val();


$(".type-filter>a").on("click",function(){
//         $("this").css("color","red");
        filterIidx = $(this).index();
        console.log("인덱스:"+filterIidx);
        roomType= $("input[name=roomType]:checked").val();
        console.log("방타입:"+roomType);
        console.log("서치키워드"+keyWord);
        console.log("시설:"+checkedComfortList);
        console.log("서비스"+checkedServiceList);
        console.log("입실일 :"+startDate+"퇴실일"+endDate);
    
        $.ajax({
            url: "/filterHostelList.kt",
            data : {roomType:roomType, startDate:startDate, endDate:endDate, customerNum:customerNum,keyWord:keyWord,checkedComfortList:checkedComfortList,checkedServiceList:checkedServiceList,filterIidx:filterIidx},
            success : function(data){
         //       var startDate = data.startDate;
            //    var endDate = data.endDate;
           //     var customerNum = data.customerNum;
                var list = data.list;

                var searchListDiv = $(".list-searched");
                searchListDiv.empty(); // 비우기 
                for(let i=0;i<list.length;i++){
                //    console.log(list[i].hostelName);
                //    console.log(startDate+"/"+endDate);
    
                    var ListDiv= "<div class='search-list-one'>";
                
                    var imgDiv = "<div class='search-list-one-img'><img src='/resources/upload/hostel/"+list[i].hostelfilepath+"'style='width: 200px; height: 200px;' ></div>";
                    var infoDiv = "<div class='search-list-one-info'>";
                
                    var titleDiv = "<div class='search-list-one-title'><h5><a  href='/hostelDetail.kt?hostelCode="+list[i].hostelCode+"&startDate="+startDate+"&endDate="+endDate+"&customerNum="+customerNum+"'>"+list[i].hostelName+"</a></h5></div>";
                    var addrDiv = "<div class='search-list-one-address'>"+list[i].hostelAddress+"</div>";
                    var priceDiv = "<div class='search-list-one-price'>"+list[i].hostelPrice+"<span>원</span></div>";
        //            console.log(typeof(infoDiv));
           //         console.log("입실일"+startDate+"/퇴실"+endDate);
        //            console.log("입실인원"+customerNum);
                    
             /* infoDiv.appendChild(titleDiv);
            infoDiv.append(addrDiv);
            infoDiv.append(priceDiv);
            ListDiv.append(imgDiv);
            ListDiv.append(infoDiv);
            ListDiv.append("</div></div>");
            $(".list-searched").append(ListDiv);
*/
                    infoDiv += titleDiv+addrDiv+priceDiv;
                    ListDiv += imgDiv+infoDiv;
                    $(".list-searched").append(ListDiv);



                }

                }
        });
        
        });


$("[name=comfortCheck]").change(function(){ // 체크박스 바뀔때마다
     
            const checkedComfort = []; // 체크한 항목담을 배열
            $("input:checkbox[name=comfortCheck]:checked").each(function(){
                checkedComfort.push($(this).val()); //체크한항목 배열에 추가 
           //     console.log(checkedComfort);
                 checkedComfortList = checkedComfort.join("%"); //구분자추가
               console.log(checkedComfortList);
                $("[name=hostelComfort").val(checkedComfortList); // 히든인풋으로 값 넘겨주기 
    //            console.log("편의시설:"+$("[name=hostelComfort").val());
    
            });
    
        });
    
$("[name=serviceCheck]").change(function(){
            const checkedService = []; // 체크한 항목담을 배열
            $("input:checkbox[name=serviceCheck]:checked").each(function(){
                checkedService.push($(this).val());
            //    console.log(checkedService);
                 checkedServiceList = checkedService.join("%");
                console.log(checkedServiceList);
                $("[name=hostelService]").val(checkedServiceList);
            });
        });
    