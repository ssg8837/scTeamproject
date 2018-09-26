		$(function() {
			$(".babygrow_data").on('click', function() {
				var GENDER = $("#GENDER").val();
				var AGE = parseInt($("#AGE").val());
				var HEIGHT = parseFloat($("#HEIGHT").val());
				var WEIGHT = parseFloat($("#WEIGHT").val());
				var HEAD = parseFloat($("#HEAD").val());
				var BMI;
				if (GENDER.toLowerCase() != 'm' && GENDER.toLowerCase() != 'f') {
					alert("성별을 M,F로 입력 해 주세요");
					return;
				}
				if (isNaN(AGE) == true) {
					alert("AGE에 숫자를 입력 해 주세요");
					return;
				}
				if (isNaN(HEIGHT) == true) {
					alert("HEIGHT에 숫자를 입력 해 주세요");
					return;
				}
				if (isNaN(WEIGHT) == true) {
					alert("WEIGHT에 숫자를 입력 해 주세요");
					return;
				}
				if (isNaN(HEAD) == true) {
					alert("HEAD에 숫자를 입력 해 주세요");
					return;
				}
				if (isNaN(AGE) != true && AGE > 23) {
					BMI = WEIGHT / HEIGHT / HEIGHT * 10000;
				}
				$.ajax({
					url:"babygrow_input",
					type:"get",
					data: { "gender": GENDER, "age": AGE, "height": HEIGHT, "weight_a": WEIGHT, "head": HEAD, "bmi": BMI },
					success:function(data){
						$('.adminbabygrow').html(data);
						$('#GENDER').val("");
						$('#AGE').val("");
						$('#HEIGHT').val("");
						$('#WEIGHT').val("");
						$('#HEAD').val("");
					},
					error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			});
			$(".babygrow_del").on('click', function() {
				var GENDER = $("#GENDER").val();
				var AGE = parseInt($("#AGE").val());
				if (GENDER.toLowerCase() != 'm' && GENDER.toLowerCase() != 'f') {
					alert("성별을 M,F로 입력 해 주세요");
				}
				if (isNaN(AGE) == true) {
					alert("AGE에 숫자를 입력 해 주세요");
					return;
				}
				
				$.ajax({
					url:"babygrow_del",
					type:"get",
					data: { "gender": GENDER, "age": AGE },
					success:function(data){
						$('.adminbabygrow').html(data);
						$('#GENDER').val("");
						$('#AGE').val("");
						$('#HEIGHT').val("");
						$('#WEIGHT').val("");
						$('#HEAD').val("");
					},
					error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			});
		})