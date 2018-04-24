<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<div class="panel-group tab-pane" role="tabpanel"
	aria-multiselectable="true" id="uploadDriver">

	<div class="check-div form-inline">
		<button type="button" class="btn btn-primary " aria-label="Left Align"
			style="float: right; margin: 20px">
			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>再添加一条
		</button>
	</div>

	<div class="panel panel-primary" style="margin: 20px">
		<div class="panel-heading" role="tab" id="headingOne">
			<h4 class="panel-title">
				<a role="button" data-toggle="collapse" data-parent="#accordion"
					href="#collapseOne" aria-expanded="true"
					aria-controls="collapseOne"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增一条</a>
			</h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in"
			role="tabpanel" aria-labelledby="headingOne">
			<div class="panel-body">
				<%@ include file="form.jsp"%>
			</div>
		</div>
	</div>

</div>
