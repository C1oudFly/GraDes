<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="mainYear"
	style="height: 500px; border: 1px solid #ccc; padding: 10px;">
</div>

	<script src="js/echarts.js"></script>
	<script type="text/javascript">	
	var myChart = echarts.init(document.getElementById('mainYear'),'light');
	$.ajax({
		url:"/GraDes/year/yearAmountList.do",
		type:"POST",
		success:function(msg){
			var yearAmountValue = msg.yearAmountMap;
			var dateList = new Array();
			var amountList = new Array();
			
			for(var i=0;i<yearAmountValue.length;i++){
				dateList.push(yearAmountValue[i].name);
				amountList.push(yearAmountValue[i].value);
			}
			
			option = {
			    title : {
				    text: '成交额分析',
			    },
			    tooltip: {
			        trigger: 'axis',
			        axisPointer: {
			            type: 'cross',
			            crossStyle: {
			                color: '#999'
			            }
			        }
			    },
			    toolbox: {
			        feature: {
			          //dataZoom，框选区域缩放，自动与存在的dataZoom控件同步，分别是启用，缩放后退  
						dataZoom : {
							show : true,
							title : {
								dataZoom : '区域缩放',
								dataZoomReset : '区域缩放后退'
							},
							iconStyle : {
								borderWidth: 1,
								borderColor: '#FF8D56',
							}
						},
						//数据视图，打开数据视图，可设置更多属性,readOnly 默认数据视图为只读(即值为true)，可指定readOnly为false打开编辑功能  
						dataView : {
							show : true,
							readOnly : false,
							iconStyle : {
								borderWidth: 1,
								borderColor: '#9BE09B',
							}
						},
						//magicType，动态类型切换，支持直角系下的折线图、柱状图、堆积、平铺转换  
						magicType : {
							show : true,
							type : [ 'line', 'bar'],
							iconStyle : {
								borderWidth: 1,
								borderColor: '#FFF065',
							}
						},
						//restore，还原，复位原始图表  
						restore : {
							show : true,
							iconStyle : {
								borderWidth: 1,
								borderColor: '#3CB2EF',
							}
						},
						//saveAsImage，保存图片（IE8-不支持）,图片类型默认为'png'  
						saveAsImage : {
							show : true
						}
			        }
			    },
			    legend: {
			        data:['年成交量']
			    },
			    xAxis: [
			        {
			        	name: '年份',
			        	type: 'category',
			            data: dateList,
			            axisPointer: {
			                type: 'shadow'
			            }
			        }
			    ],
			    yAxis: [
			        {
			            type: 'value',
			            name: '万元',
			            axisLabel: {
			                formatter: '{value} '
			            }
			        },
			        {
			        }
			    ],
			    series: [
			        {
			            name:'年成交量',
			            type:'bar',
			            data: amountList
			        },
			        {
			            type:'line',
			            data: amountList
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