<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="content-header">
	<h1>Edit Photo of ${photo.product.id }</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/admin/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Add</a></li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-8">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Quick Example</h3>
				</div>

				<!-- form start -->
				<s:form method="post" modelAttribute="photo"
					action="${pageContext.request.contextPath }/admin/photo/edit"
					acceptCharset="utf-8" enctype="multipart/form-data">

					<div class="box-body">
						<div class="form-group">
							<label for="file">File</label>
							<input type="file" name="file" />
							<br>
							<img src="${pageContext.request.contextPath }/uploads/images/${photo.name}" width="120">
						</div>

						<div class="checkbox">
							<label><s:checkbox path="main" />Main</label>
						</div>
						<div class="checkbox">
							<label><s:checkbox path="status" />Status</label>
						</div>
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Save</button>
						<s:hidden path="product.id" />
						<s:hidden path="id" />
					</div>
				</s:form>
			</div>

		</div>
	</div>
	<!-- /.row -->
</section>
