<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>数据详情</title>
        <link rel="shortcut icon" href="img/favicon.ico">
        <!-- Bootstrap3.3.5 CSS -->
        <link rel="stylesheet" href="css/bootstrap.css">

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
            <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <style>
            .panel-group{max-height:770px;overflow: auto;}
            .leftMenu{margin:10px;margin-top:5px;}
            .leftMenu .panel-heading{font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
            .leftMenu .panel-heading span{position:absolute;right:10px;top:12px;}
            .leftMenu .menu-item-left{padding: 2px; background: transparent; border:1px solid transparent;border-radius: 30px;width:150px}
            .leftMenu .menu-item-left:hover{background:#C4E3F3;border:1px solid #1E90FF;}
			.navbar-nav > li > a{color: #fff;}
			.navbar-header > a{color: #fff;font-size: 36px;}
			.footer{background-color:#f5f5f5;height:156px;}
			.col-md-2{width: 20%;}
			.col-md-10{width: 80%;}
			.panel-group{margin-bottom: 0px;}
			.navbar-transparent{background-color:#63BDDF;}
        </style>	
    </head>

	<body data-spy="scroll" data-target=".navbar" data-offset="500" onload="ajaxrea()">
		<!-- 顶部导航 -->
		<nav class="navbar navbar-transparent navbar-fixed-top">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="#">BigData</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="index.jsp">网站首页 <span class="sr-only">(current)</span></a></li>
						<li><a href="index.jsp">真实数据 </a></li>
						<li><a href="index.jsp">模拟数据 </a></li>
						<li><a href="index.jsp">关于我们</a></li>
					</ul>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</nav>
		<!-- 总表头 -->
		<div class="container text-center" style="margin-bottom:0px">
			<div class="jumbotron" style="background-color:#fff;height:25px;margin-bottom:0px">
				<h1>数据详情</h1>
				<hr style="border: 1;border-bottom:1px;background-color:#63BDDF;height: 1px;width:10%;"/>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="container" style="margin-top:0px">
			<div class="row" style="margin-top:100px;height:399px;width:100%">
				<div class="col-md-2">
					<div id="accordion" class="panel-group table-responsive" role="tablist">
						<div class="panel panel-primary leftMenu">
							<!-- 利用data-target指定要折叠的分组列表 -->
							<div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" data-parent="#accordion">
								<h4 class="panel-title">
									真实数据
									<span class="glyphicon glyphicon-chevron-up right"></span>
								</h4>
							</div>
							<!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
							<div id="collapseListGroup1" class="panel-collapse collapse in">
								<ul class="list-group">
								  <li class="list-group-item">
									<!-- 利用data-target指定URL -->
									<button class="menu-item-left" onclick="turnpage('show_reayear_info')">
										成交额分析
									</button>
								  </li>
								  <li class="list-group-item">
								  	<button class="menu-item-left" onclick="turnpage('show_reahousing_info')">
										房屋用途分析
									</button>
								  </li> 
								  <li class="list-group-item">
									<!-- 利用data-target指定URL -->
									<button class="menu-item-left" onclick="turnpage('show_reatype_info')">
										房屋户型分析
									</button>
								  </li>							  
								</ul>
							</div>
						</div><!--panel end-->
						
						<div class="panel panel-primary leftMenu" style="border:0px">
							<div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse" data-target="#collapseListGroup2" data-parent="#accordion">
								<h4 class="panel-title">
									模拟数据
									<span class="glyphicon glyphicon-chevron-down right"></span>
								</h4>
							</div>
							<div id="collapseListGroup2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
								<div id="sub_accordion" class="panel-group table-responsive" role="tablist">
									<div class="panel" style="margin-top:1px;background-color:#32A4FC;">
										<!-- 用户分析 -->
										<div class="analog-heading panel-heading" id="analogcollapseList1" data-toggle="collapse" data-target="#analog-data1" data-parent="#sub_accordion">
											<h4 class="panel-title">
												用户基本信息分析
												<span class="glyphicon glyphicon-remove right"></span>
											</h4>
										</div>
										<!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
										<div id="analog-data1" class="panel-collapse collapse in">
											<ul class="list-group">
												<li class="list-group-item">
												<!-- 利用data-target指定URL -->
													<button class="menu-item-left" onclick="turnpage('show_user_info')">
														用户分析
													</button>
												</li>
												<li class="list-group-item">
													<button class="menu-item-left" onclick="turnpage('show_member_info')">
														会员分析
													</button>
												</li> 
												<li class="list-group-item">
													<button class="menu-item-left" onclick="turnpage('show_session_info')">
														会话分析
													</button>
												</li>
											</ul>
										</div>
									</div><!--panel end-->
									<!-- 浏览器信息分析 -->
									<div class="panel" style="margin-top:1px;background-color:#32A4FC">
										<div class="analog-heading panel-heading" id="analogcollapseList2" data-toggle="collapse" data-target="#analog-data2" data-parent="#sub_accordion">
											<h4 class="panel-title">
												浏览器信息分析
												<span class="glyphicon glyphicon-plus right"></span>
											</h4>
										</div>
										<div id="analog-data2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
											<ul class="list-group">
												 <li class="list-group-item">
													<button class="menu-item-left" onclick="turnpage('show_browseruser_info')">
														浏览器用户分析
													</button>
												</li>
												<li class="list-group-item">
													<button class="menu-item-left" onclick="turnpage('show_browsermember_info')">
														浏览器会员分析
													</button>
												</li>
												<li class="list-group-item">
													<button class="menu-item-left" onclick="turnpage('show_browsersession_info')">
														浏览器会话分析
													</button>
												</li>
												<li class="list-group-item">
													<button class="menu-item-left" onclick="turnpage('show_browserpv_info')">
														浏览器PV分析
													</button>
												</li>
											</ul>
										</div>
									</div>  
									<!-- 地域信息分析 -->
									<div class="panel" style="margin-top:1px;background-color:#32A4FC">
										<div class="analog-heading panel-heading" id="analogcollapseList3" data-toggle="collapse" data-target="#analog-data3" data-parent="#sub_accordion">
											<h4 class="panel-title">
												地域信息分析
												<span class="glyphicon glyphicon-plus right"></span>
											</h4>
										</div>
										<div id="analog-data3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
											<ul class="list-group">
											  <li class="list-group-item">
												<button class="menu-item-left" onclick="turnpage('region')">
													活跃访客地域分析
												</button>
											  </li>
											</ul>
										</div>
									</div>  
									<!-- 用户浏览深度分析 -->
									<div class="panel" style="margin-top:1px;background-color:#32A4FC">
										<div class="analog-heading panel-heading" id="analogcollapseList4" data-toggle="collapse" data-target="#analog-data4" data-parent="#sub_accordion">
											<h4 class="panel-title">
												用户浏览深度分析
												<span class="glyphicon glyphicon-plus right"></span>
											</h4>
										</div>
										<div id="analog-data4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
											<ul class="list-group">
											  <li class="list-group-item">
												<button class="menu-item-left" onclick="turnpage('show_visitdepth_info')">
													访问深度
												</button>
											  </li>
											</ul>
										</div>
									</div>  
									<!-- 订单信息分析 -->
									<div class="panel" style="margin-top:1px;background-color:#32A4FC">
										<div class="analog-heading panel-heading" id="analogcollapseList5" data-toggle="collapse" data-target="#analog-data5" data-parent="#sub_accordion">
											<h4 class="panel-title">
												订单信息分析
												<span class="glyphicon glyphicon-plus right"></span>
											</h4>
										</div>
										<div id="analog-data5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
											<ul class="list-group">
												<li class="list-group-item">
													<button class="menu-item-left" onclick="turnpage('show_order_info')">
														订单总览
													</button>
												</li>
											</ul>
										</div>
									</div>  
								</div>
							</div>
						</div>  
					</div>
				</div>
				<!-- 右侧具体图表 -->
				<div class="col-md-10">
					<div class="mainbox">  
                      
                	</div> 
				</div>
			</div>
		</div>
		<hr style="margin-top:25px;border: 1;border-bottom:1px;background-color:#63BDDF;height: 1px;width:82.5%; " />
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
		<div class="ajaxLoad text-center" style="height:20px;width:160px;margin:auto;position: fixed;
			top: 0px;left: 0px;right: 0px;bottom: 0px;display:none">
			<span class="glyphicon glyphicon-send" aria-hidden="true" style="font-size: 36px;color:#5599DD"></span>
			<img src="img/ajaxLoad.gif" style="width:160px;height:20px">
		</div>
        <!-- jQuery3.3.1 (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.js"></script>
		<script src="js/echarts.js"></script>
		<script src="js/china.js"></script>	
		<script type="text/javascript" src="js/scrolltopcontrol.js"></script>
		<script src="js/custom.js"></script>
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
			});
		});	
		
		//详情页面启动时需要加载的数据
		function ajaxrea(){
			var ajaxurl = 'show_reayear_info.jsp';
			$.ajax({  
				type: "post",  
				url: ajaxurl, 
				async: false,
				success: function(rea) { 
					$('.mainbox').html(rea);
				}
			})
		}
		
		//获取相应模块的具体页面，加载具体页面的数据
		function turnpage(url) {  
			var url0 = document.URL;
			var num = url0.indexOf('?'); 
			var oldurl;  
			if(num == -1) {  
				oldurl = url0;  
			} else {  
				oldurl = url0.slice(0, num);  
			}  
			var newurl = oldurl + '?' + url;  
			history.pushState(null, null, newurl);  
			var ajaxurl = url + '.jsp' 
			$.ajax({  
				type: "post",  
				url: ajaxurl,
				beforeSend: function(){
					$('.ajaxLoad').css("display", "block");
				},
				success: function(jsp) {  
					$('.mainbox').html(jsp);
					setTimeout('ajaxload()', 500);
				}  
			}); 
		}
		
		//用于友好加载数据的提示
		function ajaxload(){
			$('.ajaxLoad').css("display", "none");
		}
        </script>
    </body>
</html>