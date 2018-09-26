		$(function() {
			$(".adminvaccine_data").on('click', function() {
				var DISEASENUM = parseInt($("#DISEASENUM").val());
				var DISEASENAME = $("#DISEASENAME").val();
				var VACCINETYPE = $("#VACCINETYPE").val();
				var DISEASECONTENT = $("#DISEASECONTENT").val();
				var VACCINEDATE = parseInt($("#VACCINEDATE").val());
				if (isNaN(DISEASENUM) == true) {
					alert("DISEASENUM에 숫자를 입력 해 주세요");
					return;
				}
				if (DISEASENAME.length == 0) {
					alert("DISEASENAME을 입력 해 주세요");
					return;
				}
				if (VACCINETYPE.length == 0) {
					alert("VACCINETYPE을 입력 해 주세요");
					return;
				}
				if (DISEASECONTENT.length == 0) {
					alert("DISEASECONTENT를 입력 해 주세요");
					return;
				}
				if (isNaN(VACCINEDATE) == true) {
					alert("VACCINEDATE에 숫자를 입력 해 주세요");
					return;
				}

				$.ajax({
					url:"adminvaccine_input",
					type:"get",
					data: { "diseasenum": DISEASENUM, "diseasename": DISEASENAME, "vaccinetype": VACCINETYPE, "diseasecontent": DISEASECONTENT, "vaccinedate": VACCINEDATE },
					success:function(data){
						$('.adminbabygrow').html(data);
						$('#DISEASENUM').val("");
						$('#DISEASENAME').val("");
						$('#VACCINETYPE').val("");
						$('#DISEASECONTENT').val("");
						$('#VACCINEDATE').val("");
					},
					error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			});
			$(".adminvaccine_del").on('click', function() {
				var DISEASENUM = parseInt($("#DISEASENUM").val());
				if (isNaN(DISEASENUM) == true) {
					alert("DISEASENUM에 숫자를 입력 해 주세요");
					return;
				}
				
				$.ajax({
					url:"adminvaccine_del",
					type:"get",
					data: { "diseasenum": DISEASENUM },
					success:function(data){
						$('.adminbabygrow').html(data);
						$('#DISEASENUM').val("");
						$('#DISEASENAME').val("");
						$('#VACCINETYPE').val("");
						$('#DISEASECONTENT').val("");
						$('#VACCINEDATE').val("");
					},
					error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			});
		})