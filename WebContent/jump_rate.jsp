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
    	
<script type="text/javascript">
	function selecttimes(){
		var sdate;
		sdate = document.getElementById('times').value;
		if(sdate == null){
			sdate = "2017-06-19";
		}
	
		var myChart = echarts.init(document.getElementById('main'));
		var regionjumprate = [1,1,1];
		
		$.ajax({url:"/GraDes/region/regionjumpList.do",data : {sdate : sdate},type:"GET",success:function(msg){
			
			regionvalue = msg.regionMap;
			console.log(regionvalue);
			
			
			option = {
				    backgroundColor: '#2c343c',

				    title: {
				        text: '跳出率',
				        left: 'center',
				        top: 20,
				        textStyle: {
				            color: '#ccc'
				        }
				    },

				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },

				    visualMap: {
				        show: false,
				        min: 0,
				        max: 15,
				        inRange: {
				            colorLightness: [0, 1]
				        }
				    },
				    series : [
				        {
				            name:'访问来源',
				            type:'pie',
				            radius : '55%',
				            center: ['50%', '50%'],
				            data:regionvalue.sort(function (a, b) { return a.value - b.value; }),
				            roseType: 'radius',
				            label: {
				                normal: {
				                    textStyle: {
				                        color: 'rgba(255, 255, 255, 0.3)'
				                    }
				                }
				            },
				            labelLine: {
				                normal: {
				                    lineStyle: {
				                        color: 'rgba(255, 255, 255, 0.3)'
				                    },
				                    smooth: 0.2,
				                    length: 10,
				                    length2: 20
				                }
				            },
				            itemStyle: {
				                normal: {
				                    color: '#c23531',
				                    shadowBlur: 200,
				                    shadowColor: 'rgba(0, 0, 0, 0.6)'
				                }
				            },

				            animationType: 'scale',
				            animationEasing: 'elasticOut',
				            animationDelay: function (idx) {
				                return Math.random() * 200;
				            }
				        }
				    ]
				};
			myChart.setOption(option);	
		}});		
	}
	setTimeout("selecttimes()", 0);
    </script>
</body>

</html>