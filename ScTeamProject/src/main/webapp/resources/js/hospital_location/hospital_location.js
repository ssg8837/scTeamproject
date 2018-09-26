		$(function() {
			$(".hospital_input").on('click', function() {
				$.ajax({
					url:"hospital_input",
					type:"get",
					
					success:function(data){
						$('.adminHospital').html(data);
						
					},
					error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			});
			$(".hospital_delete").on('click', function() {
				$.ajax({
					url:"hospital_delete",
					type:"get",
					
					success:function(data){
						$('.adminHospital').html(data);
						
					},
					error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			});
			$(".location_input").on('click', function() {
				$.ajax({
					url:"location_input",
					type:"get",
					
					success:function(data){
						$('.adminLocation').html(data);
						
					},
					error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			});
			$(".location_delete").on('click', function() {
				$.ajax({
					url:"location_delete",
					type:"get",
					
					success:function(data){
						$('.adminLocation').html(data);
						
					},
					error:function(request,status,error){
					        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
					}
				});
			});
		})