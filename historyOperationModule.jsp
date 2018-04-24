<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${!empty requestScope.historyPageBean }">
	<div role="tabpanel" class="tab-pane active" id="history">
		<div class="check-div form-inline"></div>

		<div class="data-div">
			<div class="row tableHeader">
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">设备类型</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">厂商</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">文件名</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">更新时间</div>
				<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">操作</div>
				<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">用户名</div>
			</div>
			<div class="tablebody">
				<c:forEach items="${requestScope.historyPageBean.pageBeanList}"
					var="history" varStatus="i">
					<div class="row">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${history.deviceCategory}</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${history.factory}</div>
						<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
							<c:if test="${fn:contains(history.driverName, '_')}">
							${fn:substringAfter(history.driverName, "_")}
							</c:if>
							<c:if test="${!fn:contains(history.driverName, '_')}">
								${history.driverName}
							</c:if>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">${history.time}</div>
						<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
							<c:if test="${history.operation == '增加'}">
								<span class="label label-success" style="line-height: 70px;padding: 6px 9px;">增加 </span>
							</c:if>
							<c:if test="${history.operation eq '删除'}">
								<span class="label label-danger" style="line-height: 70px;padding: 6px 9px;">删除</span>
							</c:if>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
							${history.userName}</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!--页码块-->
		<footer class="footer">
			<nav aria-label="Page navigation">
				<ul class="pagination">
					<c:if test="${historyPageBean.currentPage == 1}">
						<li class="disabled"><a href="javascript:void(0);"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>
					<c:if test="${historyPageBean.currentPage != 1}">
						<li><a href="${pageContext.request.contextPath}/driver?method=historyOperation&currentPage=${historyPageBean.currentPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="1" end="${historyPageBean.totalPage}" var="index">
						<c:if test="${historyPageBean.currentPage == index}">
							<li class="active"><a href="javascript:void(0);">${index}</a></li>
						</c:if>
						<c:if test="${historyPageBean.currentPage != index}">
							<li><a href="${pageContext.request.contextPath}/driver?method=historyOperation&currentPage=${index}">${index}</a></li>
						</c:if>
					</c:forEach>

					<c:if
						test="${historyPageBean.currentPage == historyPageBean.totalPage}">
						<li class="disabled"><a href="javascript:void(0);"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					<c:if
						test="${historyPageBean.currentPage != historyPageBean.totalPage}">
						<li><a href="${pageContext.request.contextPath}/driver?method=historyOperation&currentPage=${historyPageBean.currentPage + 1}" aria-label="Next"
							onclick="paging('${historyPageBean.currentPage + 1}')"> <span
								aria-hidden="true">&raquo;</span></a></li>
					</c:if>

				</ul>
			</nav>
		</footer>
	</div>
</c:if>
