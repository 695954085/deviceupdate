<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="modal fade" id="changeSource" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">
				<div class="container-fluid">
					<input id="didModal" style="display: none">
					<div class="form-group">
						<label for="factoryModal">厂商</label> <input type="text"
							class="form-control" id="factoryModal">
					</div>
					<div class="form-group">
						<label for="deviceCategoryModal">设备类型</label> <input type="text"
							class="form-control" id="deviceCategoryModal" placeholder="">
					</div>
					<div class="form-group">
						<label for="deviceFileModal">File input</label> <input type="file"
							id="deviceFileModal">
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" onclick="SaveChange()">Save
					changes</button>
			</div>
		</div>
	</div>
</div>