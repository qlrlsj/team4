
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
            $('#datepicker2').datepicker("option", "maxDate", '+2M');
            $('#datepicker2').datepicker("option", "minDate", $("#datepicker1").val());
            $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
                $("#datepicker1").datepicker( "option", "maxDate", selectedDate );
            });
                });



