

	$(document).ready(function(){
        // 		 날짜선택옵션
             $('#datepicker1').datepicker();
             $('#datepicker1').datepicker("option", "minDate", 0); // 시작일 오늘부터
            $('#datepicker1').datepicker("option", "maxDate", $("#datepicker2").val()); //종료일보다 시작일을 늦게선택하는것 막기
            $('#datepicker1').datepicker("option", "onClose", function ( selectedDate ) {
            $("#datepicker2").datepicker( "option", "minDate", selectedDate );
            });// 종료일이 시작일보다 빠르게 선택하는것 막기
        
            $('#datepicker2').datepicker();
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
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("sample6_detailAddress").focus();
                    }
                }).open();
            }
            var fullAddr = "";
            //전체주소 히든인풋으로 넘겨주기 
            function full_address(){
                    console.log(addr);
                    const addrAd = $("#sample6_detailAddress").val();
                    console.log(addrAd);
                    fullAddr = (addr+addrAd);
                    console.log("전체주소:"+fullAddr);

                    $("#hostelAddress").val(fullAddr);
                }
        
        
            $("#hostelType").on("change",function(){ // 숙소 타입에 따라 옵션창 바꿔주기 
                const hostelType = $(this).val(); 
            //    console.log(hostelType);
                $(".select-option").hide();	// 다 숨기고 선택한 옵션에 해당하는거만 보여주기 
                if(hostelType==1){
                    $("#select-option1").show();
                }else if(hostelType==2){
                    $("#select-option2").show();
                }else if(hostelType==3){
                    $("#select-option3").show();
                }else if(hostelType==4){
                    $("#select-option4").show();
                }
        
            });

            $("#addroom").on("click",function(){
                const hostelType = $("#hostelType").val();
              //  console.log(hostelType);
              // 타입별 행추가 내용 변경 

            if(hostelType==1){//호텔객실추가
                var table = document.getElementById('hostel-option1');
                const newRow = table.insertRow();
                const newCell1 = newRow.insertCell(0);
                const newCell2 = newRow.insertCell(1);
                const newCell3 = newRow.insertCell(2);
                const newCell4 = newRow.insertCell(3);
                //추가한 셀에 내용추가 
                newCell1.innerHTML = "<input type='text' placeholder='객실명' class='form-control' style='width: 70%;' required>";
            /*    let inputTest = "<input type='text' placeholder='객실명' class='form-control' style='width: 70%;' required>";
                inputTest += "<input type='text' placeholder='객실명' class='form-control' style='width: 70%;' required>";*/
                let insertcell2 = "<select class='form-select' id='bedType' aria-label='Default select example' required>";
                insertcell2 += "  <option selected disabled>침대타입</option>";
                insertcell2 += " <option value='1'>싱글</option><option value='2'>더블</option> <option value='3'>트윈</option <option value='4'>트리플</option><option value='5'>스위트</option><option value='6'>기타</option> </select>";
                insertcell2 += " <select class='form-select' id='roomType' aria-label='Default select example' required>";
                insertcell2 += "<option selected disabled>룸타입</option>   <option value='1'>스탠다드</option><option value='2'>디럭스</option><option value='3'>슈페리어</option><option value='4'>이즈제큐티브</option><option value='5'>기타</option>  </select>";
                insertcell2 += "<select class='form-select' id='roomView' aria-label='Default select example' required>";
                insertcell2 += "<option selected disabled>뷰</option><option value='1'>시티뷰</option><option value='2'>마운틴뷰</option><option value='3'>오션뷰</option><option value='4'>기타</option></select>";
                insertcell2 += "<input type='hidden' name='roomOption'>";
                newCell2.innerHTML = insertcell2;
                newCell3.innerHTML = "<input type='text' id='bookNum' placeholder='2/4' required><input type='hidden' name='standardBooknum'></td><input type='hidden' name='maxBooknum'>";
                newCell4.innerHTML = "<input type='text' name='hostelPrice' placeholder='ex)50000' required>";
            }

            if(hostelType==2){//게스트하우스객실추가
                var table = document.getElementById('hostel-option2');
                const newRow = table.insertRow();
                const newCell1 = newRow.insertCell(0);
                const newCell2 = newRow.insertCell(1);
                const newCell3 = newRow.insertCell(2);
                const newCell4 = newRow.insertCell(3);
                newCell1.innerHTML = "<input type='text' placeholder='객실명' class='form-control' style='width: 70%;' required>";
                let insertcell2 = "<select class='form-select' id='bedType' aria-label='Default select example' required>";
                insertcell2 += "<option selected disabled>숙소유형</option><option value='1'>도미토리</option><option value='2'>1인실</option><option value='3'>2인실</option><option value='4'>패밀리</option><option value='4'>기타</option></select>";
                insertcell2 += "  <input type='hidden' name='roomOption'>";
                newCell2.innerHTML = insertcell2;
                newCell3.innerHTML = "<input type='text' id='bookNum' placeholder='2/4' required><input type='hidden' name='standardBooknum'></td><input type='hidden' name='maxBooknum'>";
                newCell4.innerHTML = "<input type='text' name='hostelPrice' placeholder='ex)50000' required>";
      
            }

            if(hostelType==3){//펜션객실추가
                var table = document.getElementById('hostel-option3');
                const newRow = table.insertRow();
                const newCell1 = newRow.insertCell(0);
                const newCell2 = newRow.insertCell(1);
                const newCell3 = newRow.insertCell(2);
                const newCell4 = newRow.insertCell(3);

                newCell1.innerHTML = "<input type='text' placeholder='객실명' class='form-control' style='width: 70%;' required>";
                let insertcell2 = " <select class='form-select' id='bedType' aria-label='Default select example' required>";
                insertcell2 += "  <option selected disabled>숙소유형</option><option value='1'>2인실</option><option value='2'>4인실-패밀리</option><option value='3'>기타</option></select>";
                insertcell2 += "  <input type='hidden' name='roomOption'>";
                newCell2.innerHTML = insertcell2;
                newCell3.innerHTML = "<input type='text' id='bookNum' placeholder='2/4' required><input type='hidden' name='standardBooknum'></td><input type='hidden' name='maxBooknum'>";
                newCell4.innerHTML = "<input type='text' name='hostelPrice' placeholder='ex)50000' required>";
 
            }

            if(hostelType==4){//풀빌라객실추가
                var table = document.getElementById('hostel-option4');
                const newRow = table.insertRow();
                const newCell1 = newRow.insertCell(0);
                const newCell2 = newRow.insertCell(1);
                const newCell3 = newRow.insertCell(2);
                const newCell4 = newRow.insertCell(3);
                
                newCell1.innerHTML = "<input type='text' placeholder='객실명' class='form-control' style='width: 70%;' required>";
                let insertcell2 = " <select class='form-select' id='bedType' aria-label='Default select example' required>";
                insertcell2 += "  <option selected disabled>숙소유형</option><option value='1'>2인실</option><option value='2'>4인실-패밀리</option><option value='3'>기타</option></select>";
                insertcell2 += "  <input type='hidden' name='roomOption'>";
                newCell2.innerHTML = insertcell2;
                newCell3.innerHTML = "<input type='text' id='bookNum' placeholder='2/4' required><input type='hidden' name='standardBooknum'></td><input type='hidden' name='maxBooknum'>";
                newCell4.innerHTML = "<input type='text' name='hostelPrice' placeholder='ex)50000' required>";
 
            }

            });

            $("#delroom").on("click",function(){//객실 마지막행 삭제 
                $(".hostel-option > tbody > tr:last ").remove();
            });