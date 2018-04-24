<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty requestScope.configPageBean }">
	<div role="tabpanel" class="tab-pane active" id="sour">
    <div class="check-div form-inline">
			<form class="form-inline" action="xxx" method="post">
				<input type="text" value="yyy" name="method" style="display: none">
				<div class="form-group">
					<label for="agentId">AgentId</label> 
          <select
						class="selectpicker" name="deviceCategory" id="agentId">
						<option value="">全部</option>
						<c:forEach items="${configPageBean.zzz}" var="dc">
							<option value="${dc}">${dc}</option>
						</c:forEach>
					</select>
				</div>
				<button type="submit" class="btn btn-primary">搜索</button>
			</form>      
    </div>
    <div class="data-div">
			<div class="row tableHeader">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">设备类型</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">设备ID</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">厂商</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">串口号</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">辅口号</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">波特率</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">操作</div>
			</div>
      <div class="tablebody">
				<c:forEach items="${requestScope.configPageBean.xxx}"
					var="xxx" varStatus="i">
					<div class="row" id="driver_${xxx.did}">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${xxx.deviceCategory}</div>
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
  </div>  
</c:if>