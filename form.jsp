<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<form method="post"
	action="${pageContext.request.contextPath}/UploadServlet"
	enctype="multipart/form-data">
	<div class="form-group">
		<label for="deviceCategory_uploadDriver">设备类型</label> <input 
			type="text" class="form-control" id="deviceCategory_uploadDriver" name="deviceCategory_uploadDriver"
			placeholder="设备类型...">
	</div>
	<div class="form-group">
		<label for="factory_uploadDriver">厂商</label> <input type="text"
			class="form-control" id="factory_uploadDriver" placeholder="厂商..." name="factory_uploadDriver">
	</div>
	<div class="form-group">
		<label for="factory_uploadDriver">版本</label> <input type="text"
			class="form-control" id="version_uploadDriver" placeholder="版本号..." name="version_uploadDriver">
	</div>
	<div class="form-group">
		<label for="exampleInputFile">上传驱动</label> <input type="file"
			id="exampleInputFile" name="exampleInputFile">
	</div>
	<button type="submit" class="btn btn-primary">Submit</button>
</form>