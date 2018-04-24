<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>  
<footer class="footer">
	<nav aria-label="Page navigation">
		<ul class="pagination">
			<c:if test="${driverPageBean.currentPage == 1}">
				<li class="disabled"><a href="javascript:void(0);"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>
			<c:if test="${driverPageBean.currentPage != 1}">
				<li><a href="javascript:void(0);"
					onclick="paging('${driverPageBean.currentPage - 1}')"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<c:forEach begin="1" end="${driverPageBean.totalPage}" var="index">
				<c:if test="${driverPageBean.currentPage == index}">
					<li class="active"><a href="javascript:void(0);">${index}</a></li>
				</c:if>
				<c:if test="${driverPageBean.currentPage != index}">
					<li><a href="javascript:void(0);" onclick="paging('${index}')">${index}</a></li>
				</c:if>
			</c:forEach>

			<c:if
				test="${driverPageBean.currentPage == driverPageBean.totalPage}">
				<li class="disabled"><a href="javascript:void(0);"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
			</c:if>
			<c:if
				test="${driverPageBean.currentPage != driverPageBean.totalPage}">
				<li><a href="javascript:void(0);" aria-label="Next"
					onclick="paging('${driverPageBean.currentPage + 1}')"> <span
						aria-hidden="true">&raquo;</span></a></li>
			</c:if>

		</ul>
	</nav>
</footer>
<script>
	function paging(index){
		// 上传
		// 组装Condition
		var deviceCategory = $("#deviceCategory").val();
		var factory = $("#factory").val();
		var currentPage = index;
		location.href = "${pageContext.request.contextPath}/driver?method=driverList&deviceCategory="+deviceCategory+"&factory="+factory+"&currentPage="+currentPage;
	}
</script>