<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="content-header">
	<h1>Add Photo</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/admin/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Add</a></li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-8">
			<div class="box box-primary">
				
				<div class="box-header with-border">
					<h3 class="box-title">Photo</h3>
				</div>

				<!-- form start -->
				<s:form method="post" modelAttribute="photo"
					action="${pageContext.request.contextPath }/admin/photo/add"
					acceptCharset="utf-8" enctype="multipart/form-data">
					
					<div class="box-body">
						<div class="form-group">
							<label for="file">File</label>
							<input type="file" name="file" />
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
						<s:hidden path="product.id"/>
						<s:hidden path="id"/>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</section>
