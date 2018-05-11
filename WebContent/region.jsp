<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
   
</head>

<body onload="selecttimes()">
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    	<h5>请您选择要查询的日期：</h5>
    <input id = "times" type="date" value="2017-06-19"  onchange="selecttimes()" />
    <div id="main" style="height:500px;"></div>

<script src="js/china.js"></script>			
<script type="text/javascript">
	function selecttimes(){
		var sdate;
		sdate = document.getElementById('times').value;
		if(sdate == null){
			sdate = "2017-06-19";
		}
	
		var myChart = echarts.init(document.getElementById('main'),'light');
		var regionvalue = [1,1,1];
		
		$.ajax({url:"/GraDes/region/regionList.do",data : {sdate : sdate},type:"GET",success:function(msg){
			
			regionvalue = msg.regionMap;
			console.log(regionvalue);
			
			option = {
				    title: {
				        text: sdate+'\n'+'日地域数据分析',
				        left: 'center'
				    },
				    tooltip: {
				        trigger: 'item',
				        formatter: '{b}<br/>{c} (个)'
				    },
				    legend: {
				        orient: 'vertical',
				        left: 'left',
				        data:[sdate]
				    },
				    visualMap: {
				        min: 0,
				        max: 2500,
				        left: 'left',
				        top: 'bottom',
				        text: ['高','低'],           // 文本，默认为数值文本
				        calculable: true,
				        inRange: {
			                color: ['lightskyblue','yellow', 'orangered']
			            }
				    },
				    toolbox: {
				        show: true,
				        orient: 'vertical',
				        left: 'right',
				        top: 'center',
				        feature: {
				        	dataView : {
		    	            	show: true, 
		    	            	readOnly: false,
		    	            	iconStyle : {
									borderWidth: 1,
									borderColor: '#9BE09B',
								}
		    	            },
		    	            restore : {
								show : true,
								iconStyle : {
									borderWidth: 1,
									borderColor: '#3CB2EF',
								}
							},
		    	            saveAsImage : {show: true}
				        }
				    },
				    series: [
				        {
				            name: sdate,
				            type: 'map',
				            mapType: 'china',
				            roam: false,
				            label: {
				                normal: {
				                    show: true
				                },
				                emphasis: {
				                    show: true
				                }
				            },
				            data:regionvalue
				        },
				    ]
				};

			myChart.setOption(option);
		}});	
	}
	setTimeout("selecttimes()", 0);
    </script>
</body>

</html>