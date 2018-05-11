//用于控制左侧导航栏的箭头方向
var opener1 = "collapseListGroupHeading1"
var openstatus1 = true;
$(function(){
	$(".panel-heading").click(function(e){
		if(((this.id) != "collapseListGroupHeading1") && ((this.id) != "collapseListGroupHeading2")){
			;
		}else{
			if(openstatus1){
				if(this.id != opener1){
					$("#"+opener1).find("span").toggleClass("glyphicon-chevron-up");
					$("#"+opener1).find("span").toggleClass("glyphicon-chevron-down");
					opener1 = this.id;
				}else{
					openstatus1 = false;
				}
				/*切换折叠指示图标*/
				$(this).find("span").toggleClass("glyphicon-chevron-down");
				$(this).find("span").toggleClass("glyphicon-chevron-up");
			}else{
				$(this).find("span").toggleClass("glyphicon-chevron-down");
				$(this).find("span").toggleClass("glyphicon-chevron-up");
				opener1 = this.id;
				openstatus1 = true;
			}
		}
				
	});
});
//用于控制左侧导航栏子菜单的切换
var opener2 = "analogcollapseList1"
var openstatus2 = true;
$(function(){
	$(".analog-heading").click(function(e){
	console.log($(this).attr('class'));
		$("#"+opener2).find("span").removeClass("glyphicon-chevron-down");
		$("#"+opener2).find("span").removeClass("glyphicon-chevron-up");
		if(openstatus2){
			if(this.id != opener2){
				$("#"+opener2).find("span").toggleClass("glyphicon-plus");
				$("#"+opener2).find("span").toggleClass("glyphicon-remove");
				opener2 = this.id;
			}else{
				$("#"+opener2).find("span").removeClass("glyphicon-chevron-down");
				$("#"+opener2).find("span").removeClass("glyphicon-chevron-up");
				openstatus2 = false;
			}
			$(this).find("span").toggleClass("glyphicon-plus");
			$(this).find("span").toggleClass("glyphicon-remove");
		}else{
			$(this).find("span").toggleClass("glyphicon-plus");
			$(this).find("span").toggleClass("glyphicon-remove");
			opener2 = this.id;
			openstatus2 = true;
		}
		$("#"+opener2).find("span").removeClass("glyphicon-chevron-down");
		$("#"+opener2).find("span").removeClass("glyphicon-chevron-up");
	});
});