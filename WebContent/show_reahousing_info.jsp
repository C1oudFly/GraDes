<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="mainHousing"
	style="height: 500px; border: 1px solid #ccc; padding: 10px;">
</div>

	<script src="js/echarts.js"></script>
	<script type="text/javascript">	
	var myChart = echarts.init(document.getElementById('mainHousing'),'light');
	$.ajax({
		url:"/GraDes/housing/housingList.do",
		type:"POST",
		success:function(msg){
			var housingValue = msg.housingMap;
			console.log(housingValue);
			var topThreeList = new Array();
			var lastList = new Array();
			var varx = new Array();
			
			for(var i=0;i<housingValue.length;i++){
				varx.push(housingValue[i].name);
				
				if(i<3){
					topThreeList.push(housingValue[i]);
				}else{
					lastList.push(housingValue[i]);
				}
				
				
			}
			
			option = {
				title : {
	    	        text: '房屋用途分析',
	    	        x:'center'
	    	    },	
			    tooltip: {
			        trigger: 'item',
			        formatter: "{a} <br/>{b}: {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        x: 'left',
			        data:varx 
			    },
			    series: [
			        {
			            name:'详细数据',
			            type:'pie',
			            selectedMode: 'single',
			            radius: [0, '30%'],
			            center : ['50%', '66%'],
			            label: {
			                normal: {
			                    position: 'inner'
			                }
			            },
			            labelLine: {
			                normal: {
			                    show: false
			                }
			            },
			            data:topThreeList
			        },
			        {
			            name:'详细数据',
			            type:'pie',
			            radius: ['40%', '55%'],
			            center : ['50%', '66%'],
			            label: {
			                normal: {
			                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
			                    backgroundColor: '#eee',
			                    borderColor: '#aaa',
			                    borderWidth: 1,
			                    borderRadius: 4,
			                    rich: {
			                        a: {
			                            color: '#999',
			                            lineHeight: 22,
			                            align: 'center'
			                        },
			                        hr: {
			                            borderColor: '#aaa',
			                            width: '100%',
			                            borderWidth: 0.5,
			                            height: 0
			                        },
			                        b: {
			                            fontSize: 16,
			                            lineHeight: 33
			                        },
			                        per: {
			                            color: '#eee',
			                            backgroundColor: '#334455',
			                            padding: [2, 4],
			                            borderRadius: 2
			                        }
			                    }
			                }
			            },
			            data:lastList
			        }
			    ]
			};
		// 使用刚指定的配置项和数据显示图表。
    	myChart.setOption(option);
		}
	});
	</script>
</body>
</html>