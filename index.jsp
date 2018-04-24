<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="cn.com.domain.Driver"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/zuoyou/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/zuoyou/flat-ui.min.css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/lib/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lib/bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath}/js/lib/bootstrap-select.min.js"></script>
<script>
	$(function() {
		$.post("redis",
		{
			method:"menuList"
		},function(data){
			var contentHtml = "";
			for(var key in data){
				var menuTitle = key;
				contentHtml += "<div class='meun-title'>" + menuTitle + "</div>";
				var menuItems = data[key];
				$.each(menuItems,function(index,menuItem){
					contentHtml += "<div class='meun-item'><a href='" + menuItem.urlPattern + "'><span class='glyphicon " + menuItem.icon + "' aria-hidden='true'></span>&nbsp;&nbsp;&nbsp;"+ menuItem.menuItem +"</a></div>"
				});
			}
			// 把contentHTML设置进去左侧导航栏
			//$("#leftMeun").append(contentHtml);
		},"json")
	});

	$(function() {
		$(".meun-item").click(function() {
			$(".meun-item").removeClass("meun-item-active");
			$(this).addClass("meun-item-active");
		});
	
		$(".toggle-btn").click(function() {
			$("#leftMeun").toggleClass("show");
			$("#rightContent").toggleClass("pd0px");
		});
	
	});
	
	$(function() {
		$("#deviceCategory>option[value='${driverPageBean.condition.deviceCategory}']").attr(
				"selected", true);
		$("#factory>option[value='${driverPageBean.condition.factory}']").attr("selected",
				true);
	});
	
	function showModifyModal(did) {
		// 通过did找到相应的driver数据
		// 然后通过js设置到表单中
		
		<c:forEach items="${driverPageBean.pageBeanList}" var="item">
			if( ${item.did} === did ) {
				$("#factoryModal").val("${item.factory}");
				$("#deviceCategoryModal").val("${item.deviceCategory}");
				$("#didModal").val("${item.did}");
			}	
		</c:forEach>
		$("#changeSource").modal("show");
	}
	
	//Modal修改driver。
	function SaveChange(){
		// 使用ajax通知服务器
		var did = $("#didModal").val();
		var factoryModal = $("#factoryModal").val();
		var deviceCategoryModal = $("#deviceCategoryModal").val();
	
		
	    $.ajax({  
	        type: "post",  
	        url: "${pageContext.request.contextPath}/driver",   
	        data: {
		        method: "updateDriver",
		        did : did,
		        factory:factoryModal,
		        deviceCategory:deviceCategoryModal
		    },  
	        dataType: 'json',  
	        success: function(result) {
		        alert(result.responseText);
	        }  
	    });  
	
	    $("#changeSource").modal('hide');
	}
	
	function paging(index){
		// 上传
		// 组装Condition
		var deviceCategory = $("#deviceCategory").val();
		var factory = $("#factory").val();
		var currentPage = index;
		location.href = "${pageContext.request.contextPath}/driver?method=driverList&deviceCategory="+deviceCategory+"&factory="+factory+"&currentPage="+currentPage;
	}
	
	function deleteDriver(did){
		$.post(
			"${pageContext.request.contextPath}/driver",
		{
			"did":did,
			"method" : "deleteDriver"
		},
		function(data){

			//删除行
			$("#driver_"+did).remove();

			//删除下拉值
			if(data.hasOwnProperty("deleteOption")){
				if(data.deleteOption.hasOwnProperty("deviceCategory")){
					$("#deviceCategory").find("[value='"+data.deleteOption.deviceCategory+"']").remove();
					$('#deviceCategory').selectpicker('refresh');
				}
				if(data.deleteOption.hasOwnProperty("factory")){
					$("#factory").find("[value='"+data.deleteOption.factory+"']").remove();
					$('#factory').selectpicker('refresh');  
				}
			}
			
			alert(data.responseText);
		},
		"json");
	}

</script>
<title>赞同外设</title>

</head>

<body>
	<div id="wrap">
		<!-- 左侧菜单栏目块 -->
		<div class="leftMeun" id="leftMeun">
			<div id="logoDiv">
				<p id="logoP">
					<img id="logo" alt="左右结构项目"
						src="${pageContext.request.contextPath}/img/zuoyou/logo.png"><span>左右结构项目</span>
				</p>
			</div>
			<div id="personInfor">
				<p id="userName">${user.userName }</p>
				<p>
					<span>${user.email}</span>
				</p>
				<p>
					<a href="${pageContext.request.contextPath}/user?method=logout">退出登录</a>
				</p>
			</div>
			<div class="meun-title">搜索管理</div>
			<c:if test="${!empty requestScope.driverPageBean}">
				<div class="meun-item meun-item-active" href="#sour"
					aria-controls="sour" role="tab" data-toggle="tab">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;搜索
				</div>
			</c:if>
			<c:if test="${empty requestScope.driverPageBean }">
				<div class="meun-item">
					<a href="driver?method=driverList"> <span
						class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;搜索
					</a>
				</div>
			</c:if>
			<div class="meun-title">上传管理</div>
			<div class="meun-item" href="#uploadDriver"
				aria-controls="#uploadDriver" role="tab" data-toggle="tab">
				<span class="glyphicon glyphicon-upload" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;上传
			</div>
			<div class="meun-title">历史管理</div>
			<c:if test="${!empty requestScope.historyPageBean}">
				<div class="meun-item meun-item-active" href="#history"
					aria-controls="#history" role="tab" data-toggle="tab">
					<span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;历史操作
				</div>
			</c:if>
			<c:if test="${empty requestScope.historyPageBean}">
				<div class="meun-item">
					<a href="driver?method=historyOperation"> <span
						class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>&nbsp;&nbsp;&nbsp;历史操作
					</a>
				</div>
			</c:if>
			<div class="panel-group" role="tablist" aria-multiselectable="true">
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="headingOne">
					  <h4 class="panel-title">
        			<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          			配置管理
       				 </a>
     			  </h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
						<div class="panel-body">
							<ul class="list-group">
								<li class="list-group-item">增加配置</li>
								<li class="list-group-item">修改配置</li>
								<li class="list-group-item">删除配置</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="rightContent">
			<a class="toggle-btn" id="nimei"> <i
				class="glyphicon glyphicon-align-justify"></i>
			</a>

			<!-- Tab panes -->
			<div class="tab-content">
				<!-- 展现Driver模块 -->
				<%@ include file="showDriverModule.jsp"%>

				<!-- 上传Driver模块 -->
				<%@ include file="uploadDriverModule.jsp"%>

				<!-- 历史操作模块  -->
				<%@ include file="historyOperationModule.jsp"%>
			</div>
		</div>
	</div>
</body>

</html>