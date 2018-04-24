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
						class="selectpicker" name="agentId" id="agentId">
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
				<c:forEach items="${requestScope.configPageBean.deviceId}"
					var="xxx" varStatus="i">
					<div class="row" id="driver_${xxx.deviceId}">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${xxx.deviceCategory}</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">${xxx.deviceId}</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
						</div>
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-1"></div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
							<button class="btn btn-success btn-xs"
								onclick="">修改</button>
							<button class="btn btn-danger btn-xs"
								onclick="">删除</button>
						</div>
					</div>
				</c:forEach>
      </div>
    </div>
		<!--页码块-->
		<footer class="footer">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${configPageBean.currentPage == 1}">
						<li class="disabled"><a href="javascript:void(0);"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:if test="${configPageBean.currentPage != 1}">
						<li><a href="${pageContext.request.contextPath}/driver?method=historyOperation&currentPage=${configPageBean.currentPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="1" end="${configPageBean.totalPage}" var="index">
						<c:if test="${configPageBean.currentPage == index}">
							<li class="active"><a href="javascript:void(0);">${index}</a></li>
						</c:if>
						<c:if test="${configPageBean.currentPage != index}">
							<li><a href="${pageContext.request.contextPath}/driver?method=historyOperation&currentPage=${index}">${index}</a></li>
						</c:if>
					</c:forEach>

					<c:if
						test="${configPageBean.currentPage == configPageBean.totalPage}">
						<li class="disabled"><a href="javascript:void(0);"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					<c:if
						test="${configPageBean.currentPage != configPageBean.totalPage}">
						<li><a href="${pageContext.request.contextPath}/driver?method=historyOperation&currentPage=${configPageBean.currentPage + 1}" aria-label="Next"
							onclick="paging('${configPageBean.currentPage + 1}')"> <span
								aria-hidden="true">&raquo;</span></a></li>
					</c:if>

				</ul>
			</nav>
		</footer>
  </div>  
</c:if>