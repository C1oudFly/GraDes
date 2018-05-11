<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="mainType"
	style="height: 500px; border: 1px solid #ccc; padding: 10px;">
</div>
	
	<script src="js/echarts.js"></script>
	<script type="text/javascript">	
	 // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('mainType'),'light');
	 
    $.ajax({
    	url:"/GraDes/type/typeList.do",
    	type:"POST",
    	success:function(msg){
    		typeValue = msg.typeMap;
    		console.log(typeValue);
			var typeList = new Array();
    		
    		for(var i=0;i<typeValue.length;i++){
    			typeList.push(typeValue[i].name);
    		}
    		
	    	option = {
	    	    title : {
	    	        text: '房屋户型分析',
	    	        x:'center'
	    	    },
	    	    tooltip : {
	    	        trigger: 'item',
	    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    	    },
	    	    legend: {
	    	        x : 'center',
	    	        y : 'bottom',
	    	        data : typeList,
	    	    },
	    	    toolbox: {
	    	        show : true,
	    	        feature : {
	    	            mark : {show: true},
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
	    	    calculable : true,
	    	    series : [
	    	        {
	    	            name:'户型模式',
	    	            type:'pie',
	    	            radius : [36, 156],
	    	            center : ['50%', '50%'],
	    	            roseType : 'area',
	    	            data : typeValue
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