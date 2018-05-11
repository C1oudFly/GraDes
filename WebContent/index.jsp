<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0">
  <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
  <title>BigData</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style>	
		hr {
			margin-top:7px;
			*margin: 0;
			border: 1;
			border-bottom:1px;
			background-color:#f5f5f5; 
			height: 1px;
			width:100%;
		}
		.navbar-nav > li > a{
			color: #fff;
		}
		.navbar-header > a{
			color: #fff;
			font-size: 36px;
		}
		.input-group > input{
			font-family: Lucida Family;
		}
		.footer{
			background-color:#f5f5f5;
			height:156px;
			<!-- background-image: url(img/4.jpg);
			background-size:100%100%; -->
		}
	</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="500" onload="ajaxrea()">
	<!-- 导航 -->
	<nav class="navbar navbar-transparent navbar-fixed-top">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">BigData</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#myCarousel">网站首页 <span class="sr-only">(current)</span></a></li>
					<li><a href="#real-data">真实数据 </a></li>
					<li><a href="#analog-data">模拟数据 </a></li>
					<li><a href="#about-us">关于我们</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
	
	<!-- 轮播图 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="img/rolling1.jpg" style="width:100%;height:616px" alt="First slide">
				<div class="carousel-caption">
						<h1>大数据</h1>
						<p></p>
						
				</div>
			</div>
			<div class="item">
				<img src="img/rolling2.jpg" style="width:100%;height:616px" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Another example headline.</h1>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta      gravida     at eget metus.                  Nullam id dolor id nibh ultricies vehicula ut   id elit.</p>
						
					</div>
				</div>
			</div>
			<div class="item">
				<img src="img/rolling3.jpg" style="width:100%;height:616px" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>One more for good measure.</h1>
						<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
						
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" style="display:none" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
		<a class="right carousel-control" style="display:none" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
	</div><!-- /.carousel -->
	
	<!-- 真实数据 -->
	<div id="real-data" class="container text-center">
		<div class="jumbotron" style="background-color:#fff">
			<h1>真实数据</h1>
			<hr style="width:5%;background-color:rgb(64, 145, 239);"/>
			<div class="row item">
				<div class="col-md-12 animate1" style="opacity: 0;left:-86px">
					<div id="mainRea">
					
					</div>
				</div>
			</div>
			<br/>
			<p><a class="btn btn-primary btn-lg" role="button" href="detailpage.jsp">查看更多</a></p>
		</div>
		<hr />
    </div>
	<!--模拟数据-->
    <div id	="analog-data" class="container text-center">
		<div class="jumbotron" style="background-color:#fff">
			<h1>模拟数据</h1>
			<hr style="width:5%;background-color:rgb(64, 145, 239);"/>
			<div class="row item">
				<div class="col-md-12 animate2" style="opacity: 0;right:-86px">
					<div id="mainAna">
					
					</div>
				</div>
			</div>
			<p><a class="btn btn-primary btn-lg" role="button" href="detailpage.jsp">查看更多</a></p>
		</div>
    </div>
	<!--关于我们-->
	<div id="about-us" class="text-center footer" style="position:relative;">
		<div style="position:absolute;top:40%;left:35%">
			<ul class="list-inline" style="color:#79818a">
				<li>大数据</li>
				<li style="color:rgb(64, 145, 239);">●</li>
				<li>关于我们</li>
			</ul>
			<p style="font-size:15px;color:#79818a">Copyright © 2018 by GraDes.priv.yunfei. All rights reserved.</p>
		</div>
	</div>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript" src="js/scrolltopcontrol.js"></script>
	<script> 
	$(document).ready(function(){
		//导航栏的显示与隐藏
		$(window).scroll(function(){
			var st = $(window).scrollTop();
			if(st>0){
				$("nav").attr({class:"navbar navbar-default navbar-fixed-top"});
			}else{
				$("nav").attr({class:"navbar navbar-transparent navbar-fixed-top"});
			}
			
			slideIn1($(".animate1"));
			slideIn2($(".animate2"));
		
		});
		//轮播图指示控制
		$("#myCarousel").hover(function(){
			$(".carousel-control").css("display","inline");
			},function(){
			$(".carousel-control").css("display","none");
		});
		//轮播图速度控制
		$('.carousel').carousel({  
			interval: 2000
		});
		//div从左侧淡出
		function slideIn1(obj){
			var scrollTop = $(window).scrollTop();
			var targetHeight = $(".animate1").offset().top;
			if(scrollTop>targetHeight-256){
				obj.animate({left:"-15px",opacity:1},500);
			}
		};
		//div从右侧淡出
		function slideIn2(obj){
			var scrollTop = $(window).scrollTop();
			var targetHeight = $(".animate2").offset().top;
			console.log("targetHeight2:"+targetHeight);
			if(scrollTop>targetHeight-256){
				obj.animate({right:"-15px",opacity:1,filter:'Alpha(opacity=100)'},450);
				
			}
		};
	});	

	//主页面onlodad加载方法，用于页面启动时加载数据
	function ajaxrea(){
		var ajaxreq = null;
		var ajaxurl = 'show_reayear_info.jsp';
		ajaxreq = $.ajax({  
			type: "post",  
			url: ajaxurl,
			async: false,
			success: function(rea) {
				$('#mainRea').html(rea);
			}
		});
		
		if(ajaxreq != null){
			ajaxreq.abort();
		}
		
		setTimeout('ajaxana()',100);
	}

	//主页面通过第一个onload方法调用加载第二个模块的数据
	function ajaxana(){
		var ajaxurl2 = 'show_user_info.jsp';
		$.ajax({  
			type: "post",  
			url: ajaxurl2, 
			async: false,
			success: function(ana) { 
				$('#mainAna').html(ana);
			}
		})
	}	
	</script>
 </body>
</html>