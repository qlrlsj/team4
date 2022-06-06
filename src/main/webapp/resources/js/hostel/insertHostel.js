

	$(document).ready(function(){
        // 		 날짜선택옵션
             $('#datepicker1').datepicker({dateFormat : 'yy-mm-dd'});
    
             $('#datepicker1').datepicker("option", "minDate", 0); // 시작일 오늘부터
            $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val()); //종료일보다 시작일을 늦게선택하는것 막기
            $('#datepicker1').datepicker("option", "onClose", function ( selectedDate ) {
            $("#datepicker2").datepicker( "option", "minDate", selectedDate );
            });// 종료일이 시작일보다 빠르게 선택하는것 막기
        
            $('#datepicker2').datepicker({dateFormat : 'yy-mm-dd'});
      
            $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
            $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
                $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
            });
                });
           
                var addr = ''; // 주소 변수
                function sample6_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     
                        var extraAddr = ''; // 참고항목 변수
        
                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
        
                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("sample6_extraAddress").value = extraAddr;
                        
                        } else {
                            document.getElementById("sample6_extraAddress").value = '';
                        }
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample6_postcode').value = data.zonecode;
                        document.getElementById("sample6_address").value = addr;
                        document.getElementById("hostelAddress").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("sample6_detailAddress").focus();
             
                    }
                }).open();
            }
            var fullAddr = "";
            //전체주소 히든인풋으로 넘겨주기 

            function full_address(){
    //                    console.log(addr); // 위에서 찍어둔 주소 확인용
                    const addrAd = $("#sample6_detailAddress").val(); // 세부주소 
      //              console.log(addrAd);
                      fullAddr = (addr+" "+addrAd); // 검색한주소 + 한칸공백 + 세부주소 
                    
                   
                    console.log("전체주소:"+fullAddr);
 
                    $("#hostelAddress").val(fullAddr); // 히든인풋에 값 바꿔주기 
                }
        
        
            $("#hostelType").on("change",function(){ // 숙소 타입에 따라 옵션창 바꿔주기 
                $( '#hostel-option1 > tbody').empty(); // 바뀔때마다 테이블비우기
                const hostelType = $(this).val();  // 선택한 숙소타입번호 
                
                //    console.log(hostelType);
                $(".select-option").hide();	// 다 숨기고 선택한 옵션에 해당하는거만 보여주기 
                if(hostelType==1){
                    $("#select-option1").show(); //호텔 
                }else if(hostelType==2){
                    $("#select-option2").show(); //게하
                }else if(hostelType==3){
                    $("#select-option3").show(); //펜션 
                }else if(hostelType==4){
                    $("#select-option4").show(); //풀빌라
                }
        
            });

            $("#addroom").on("click",function(){
                const hostelType = $("#hostelType").val();
              //  console.log(hostelType);
              // 타입별 행추가 내용 다름! 


            //  <input type='text' name='standardBooknum' style='width: 30%;'> / <input type='text' name='maxBooknum' style='width: 30%;'>

            if(hostelType==1){//호텔객실추가
               // var table = document.getElementById('hostel-option1');
              //  let tbody = document.getElementById('hostel-option1');
                const tbodyRef = document.getElementById('hostel-option1').getElementsByTagName('tbody')[0];
                const newRow = tbodyRef.insertRow();
                const newCell1 = newRow.insertCell(0);
                const newCell2 = newRow.insertCell(1);
                const newCell3 = newRow.insertCell(2);
                const newCell4 = newRow.insertCell(3);
                //추가한 셀에 내용추가 
                newCell1.innerHTML = "<input type='text' placeholder='객실명'  name='roomNames' class='form-control' style='width: 70%;' >";
            /*    let inputTest = "<input type='text' placeholder='객실명' class='form-control' style='width: 70%;' required>";
                inputTest += "<input type='text' placeholder='객실명' class='form-control' style='width: 70%;' required>";*/
                let insertcell2 = "<select class='form-select' id='bedType' name='bedType' aria-label='Default select example' required>";
                insertcell2 += "  <option selected disabled>침대타입</option>";
                insertcell2 += " <option value='싱글'>싱글</option><option value='더블'>더블</option> <option value='트윈'>트윈</option <option value='트리플'>트리플</option><option value='스위트'>스위트</option><option value='기타'>기타</option> </select>";
                insertcell2 += " <select class='form-select' id='roomType' name='roomType' aria-label='Default select example' required>";
                insertcell2 += "<option selected disabled>룸타입</option>   <option value='스탠다드'>스탠다드</option><option value='디럭스'>디럭스</option><option value='슈페리어'>슈페리어</option><option value='이그제큐티브'>이그제큐티브</option><option value='기타'>기타</option>  </select>";
                insertcell2 += "<select class='form-select' id='roomView'name='roomView' aria-label='Default select example' required>";
                insertcell2 += "<option selected disabled>뷰</option><option value='시티뷰'>시티뷰</option><option value='마운틴뷰'>마운틴뷰</option><option value='오션뷰'>오션뷰</option><option value='기타'>기타</option></select>";
                insertcell2 += "<input type='hidden' name='roomOptions'>";
                newCell2.innerHTML = insertcell2;
                newCell3.innerHTML = "<input type='text' name='standardBooknums' style='width: 30%;'> / <input type='text' name='maxBooknums' style='width: 30%;'>";
                newCell4.innerHTML = "<input type='text' name='hostelPrices' placeholder='ex)50000' >";
            }

            if(hostelType==2){//게스트하우스객실추가
                var table = document.getElementById('hostel-option2');
                const newRow = table.insertRow();
                const newCell1 = newRow.insertCell(0);
                const newCell2 = newRow.insertCell(1);
                const newCell3 = newRow.insertCell(2);
                const newCell4 = newRow.insertCell(3);
                newCell1.innerHTML = "<input type='text' placeholder='객실명' name='roomNames' class='form-control' style='width: 70%;' >";
                let insertcell2 = "<select class='form-select' id='bedType' name='roomOptions' aria-label='Default select example' required>";
                insertcell2 += "<option selected disabled>숙소유형</option><option value='도미토리'>도미토리</option><option value='1인실'>1인실</option><option value='2인실'>2인실</option><option value='패밀리'>패밀리</option><option value='기타'>기타</option></select>";
         //       insertcell2 += "  <input type='hidden' name='roomOption'>";
                newCell2.innerHTML = insertcell2;
                newCell3.innerHTML = "<input type='text' name='standardBooknums' style='width: 30%;'> / <input type='text' name='maxBooknums' style='width: 30%;'>";
                newCell4.innerHTML = "<input type='text' name='hostelPrices' placeholder='ex)50000' >";
      
            }

            if(hostelType==3){//펜션객실추가
                var table = document.getElementById('hostel-option3');
                const newRow = table.insertRow();
                const newCell1 = newRow.insertCell(0);
                const newCell2 = newRow.insertCell(1);
                const newCell3 = newRow.insertCell(2);
                const newCell4 = newRow.insertCell(3);

                newCell1.innerHTML = "<input type='text' placeholder='객실명'  name='roomNames' class='form-control' style='width: 70%;' >";
                let insertcell2 = " <select class='form-select' id='bedType' name='roomOptions' aria-label='Default select example' required>";
                insertcell2 += "  <option selected disabled>숙소유형</option><option value='2인실'>2인실</option><option value='4인실'>4인실-패밀리</option><option value='기타'>기타</option></select>";
              //  insertcell2 += "  <input type='hidden' name='roomOption'>";
                newCell2.innerHTML = insertcell2;
                newCell3.innerHTML = "<input type='text' name='standardBooknums' style='width: 30%;'> / <input type='text' name='maxBooknums' style='width: 30%;'>";
                newCell4.innerHTML = "<input type='text' name='hostelPrices' placeholder='ex)50000' >";
 
            }

            if(hostelType==4){//풀빌라객실추가
                var table = document.getElementById('hostel-option4');
                const newRow = table.insertRow();
                const newCell1 = newRow.insertCell(0);
                const newCell2 = newRow.insertCell(1);
                const newCell3 = newRow.insertCell(2);
                const newCell4 = newRow.insertCell(3);

                newCell1.innerHTML = "<input type='text' placeholder='객실명' name='roomNames' class='form-control' style='width: 70%;' >";
                let insertcell2 = " <select class='form-select' id='bedType' name='roomOptions' aria-label='Default select example' required>";
                insertcell2 += "  <option selected disabled>숙소유형</option><option value='2인실'>2인실</option><option value='4인실'>4인실-패밀리</option><option value='기타'>기타</option></select>";
   //             insertcell2 += "  <input type='hidden' name='roomOption'>";
                newCell2.innerHTML = insertcell2;
                newCell3.innerHTML = "<input type='text' name='standardBooknums' style='width: 30%;'> / <input type='text' name='maxBooknums' style='width: 30%;'>";
                newCell4.innerHTML = "<input type='text' name='hostelPrices' placeholder='ex)50000' >";
 
            }

            });

            $("#delroom").on("click",function(){//객실 마지막행 삭제 
                $(".hostel-option > tbody > tr:last ").remove();
            });

         
            
	$(document).ready(function(){
        $(".summernote").summernote({
            height : 300 ,
            width : 800,
            lang: 'ko-KR' 
           
            });

    });


    // 편의시설+서비스항목 체크된거만 히든인풋 val로 넘겨주기 
    $("[name=comfortCheck]").change(function(){ // 체크박스 바뀔때마다
     
        const checkedComfort = []; // 체크한 항목담을 배열
        $("input:checkbox[name=comfortCheck]:checked").each(function(){
            checkedComfort.push($(this).val()); //체크한항목 배열에 추가 
       //     console.log(checkedComfort);
            const checkedComfortList = checkedComfort.join("/"); //구분자추가
      //     console.log(checkedComfortList);
            $("[name=hostelComfort").val(checkedComfortList); // 히든인풋으로 값 넘겨주기 
//            console.log("편의시설:"+$("[name=hostelComfort").val());

        });

    });

    $("[name=serviceCheck]").change(function(){
        const checkedService = []; // 체크한 항목담을 배열
        $("input:checkbox[name=serviceCheck]:checked").each(function(){
            checkedService.push($(this).val());
        //    console.log(checkedService);
            const checkedServiceList = checkedService.join("/");
        //    console.log(checkedServiceList);
            $("[name=hostelService]").val(checkedServiceList);
        });
    });




     //방옵션 string정리 
     //침대타입
    let bedType = [];
    $(document).on("change","[name='bedType']",function(){
        const idx = $("[name=bedType]").index(this);
        $("select[name=bedType]").each(function(i,selected){
        bedType[i]= $(selected).val();
        });
       //  console.log("test", bedType[idx], roomType[idx], roomView[idx]);
        const roomOption = (bedType[idx]+"/"+roomType[idx]+"/"+roomView[idx]);
        console.log(roomOption);

        $("[name=roomOptions]").eq(idx).val(roomOption);
        
    });

    
    let roomType=[];
    $(document).on("change","[name='roomType']",function(){
        const idx = $("[name=roomType]").index(this);
        $("select[name=roomType]").each(function(i,selected){
        roomType[i]= $(selected).val();
        });
  //      console.log("test", bedType[idx], roomType[idx], roomView[idx]);
            const roomOption = (bedType[idx]+"/"+roomType[idx]+"/"+roomView[idx]);
            console.log(roomOption);
   
            $("[name=roomOptions]").eq(idx).val(roomOption);
    });


    let roomView=[];
    $(document).on("change","[name='roomView']",function(){
        const idx = $("[name=roomView]").index(this);
        $("select[name=roomView]").each(function(i,selected){
        roomView[i]= $(selected).val();
        });
   //      console.log("test", bedType[idx], roomType[idx], roomView[idx]);
        const roomOption = (bedType[idx]+"/"+roomType[idx]+"/"+roomView[idx]);
        console.log(roomOption);
        $("[name=roomOptions]").eq(idx).val(roomOption);
    //    $("[name=roomOption]").eq(idx).attr("value",roomOption);
    });

