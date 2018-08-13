
/*표준성장도표 데이터 가져오기*/

	var ctx = document.getElementById("defaultChart").getContext('2d');
	var defaultChart = new Chart(ctx, {
	    type: 'line',
	    data: {
	        labels: ['${age}'],
	        datasets: [{	
	        	label: '표준성장도표 전체',							//제목
	            data: ['${HEIGHT}', '${WEIGHT_A}', '${HEAD}'], 	//차트에 들어가는 데이터의 값. 컨트롤러에서 모델로 받아온다.
	            backgroundColor: [								//막대 그래프의 배경색
	            	'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)'
	            ],
	            borderColor: [									//막대 그래프를 감싸는 border의 색
	            	'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)'
	            ],
	            borderWidth: 1									//border의 넓이
	        }]
	    },
	    options: {
	    	animation: {
	            animateScale: true					//animation효과를 넣지 않으려면 false로 설정
	        },
	        responsive: false,						//차트가 canvas의 크기에 맞추어 생성되기 위해 responsive을 false로 설정해준다. 해당 설정값이 없으면, chart가 canvas와 상관없이 사이즈가 엄청 커짐.
	        scales: {
	            yAxes: [							//yAxes를 설정하지 않으면 애니메이션 효과가 바닥에서 부터가 아닌 가운데에서 시작됨
	                {
	                    ticks: {
	                        beginAtZero: true      //애니메이션 효과가 바닥에서부터 시작                                                              
	                    }
	                }
	            ]
	        }
	    }
	});
	
/* 데이터 보내기 */
	
	var button = document.getElementById("sendAjax")
	 
	button.addEventListener("click", function() {
	    sendAjax('http://localhost:3000/');
	})
	 
	function sendAjax(url) {
	    var oReq = new XMLHttpRequest();
	 
	    oReq.open('POST', url);
	    oReq.setRequestHeader('Content-Type', "application/json") // json 형태로 보낸다                         
	    oReq.send();
	 
	    oReq.addEventListener('load', function() {
	        var result = JSON.parse(oReq.responseText);
	        var score = result.score;
	        var comp_data = data.datasets[0].data;
	 
	        for (var i = 0; i < comp_data.length; i++) {
	            comp_data[i] = score[i];
	        }
	 
	        data.datasets[0].data = comp_data;
	        myBarChart.update();
	    })
	}
