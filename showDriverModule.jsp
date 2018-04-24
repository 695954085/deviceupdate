<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty requestScope.driverPageBean}">
	<div role="tabpanel" class="tab-pane active" id="sour">
		<div class="check-div form-inline">
			<form class="form-inline" action="driver" method="post">
				<input type="text" value="driverList" name="method" style="display: none">
				<div class="form-group">
					<label for="deviceCategory">设备类型</label> <select
						class="selectpicker" name="deviceCategory" id="deviceCategory">
						<option value="">全部</option>
						<c:forEach items="${driverPageBean.deviceCategoryList}" var="dc">
							<option value="${dc}">${dc}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="factory">厂家</label> <select class="selectpicker"
						name="factory" id="factory">
						<option value="">全部</option>
						<c:forEach items="${driverPageBean.factoryList}" var="fa">
							<option value="${fa}">${fa}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group"> 
					<label for="time">更新时间</label> 
					<input type="date" class="form-control" name="time" id="time" style="padding:6px 12px;height:34px">				
				</div>
				<button type="submit" class="btn btn-primary">搜索</button>
			</form>
		</div>
		<div class="data-div">
			<div class="row tableHeader">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">设备类型</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">厂商</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">文件名</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">版本号</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">更新时间</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">操作</div>
			</div>
			<div class="tablebody">
				<c:forEach items="${requestScope.driverPageBean.pageBeanList}"
					var="driver" varStatus="i">
					<div class="row" id="driver_${driver.did}">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${driver.deviceCategory}</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${driver.factory}</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
							<c:if test="${fn:contains(driver.driverName, '_')}">
							${fn:substringAfter(driver.driverName, "_")}
							</c:if>
							<c:if test="${!fn:contains(driver.driverName, '_')}">
								${driver.driverName}
							</c:if>
						</div>
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">${driver.version}</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${driver.time}</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
							<button class="btn btn-success btn-xs"
								onclick="showModifyModal(${driver.did})">修改</button>
							<button class="btn btn-danger btn-xs"
								onclick="deleteDriver(${driver.did});">删除</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!--页码块-->
		<%@ include file="footer.jsp"%>

		<!-- Modal updateModal-->
		<jsp:include page="updateModal.jsp"></jsp:include>
	</div>
</c:if>