<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<section class="content-header">
	<h1>Profile Details</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/admin/dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">Profile</li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<div class="col-md-8">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Profile </h3>
				</div>

				<!-- form start -->
				<s:form modelAttribute="account" action="#" acceptCharset="utf-8">
					<div class="box-body">
						<div class="form-group">
							<label for="username">Username</label>
							<input type="text" class="form-control" name="username" disabled="disabled" />
						</div>
						
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" class="form-control" name="email" disabled="disabled" />
						</div>
						
						<div class="form-group">
							<label for="address">Address</label>
							<textarea class="form-control" name="address" disabled="disabled"></textarea>
						</div>
						
						<div class="form-group">
							<label for="phone">Phone</label>
							<input type="text" class="form-control" name="phone" disabled="disabled" />
						</div>
						
						<div class="form-group">
							<label for="fullname">Full Name</label>
							<input type="text" class="form-control" name="fullname" disabled="disabled" />
						</div>
						
						<div class="checkbox">
							<label><s:checkbox path="status" />Status</label>
						</div>
					</div>

					<div class="box-footer">
						<input class="btn btn-large btn-success" type="submit" value="Aceptar" />
						<s:hidden path="id" />
					</div>
				</s:form>
			</div>
		</div>
	</div>
</section>
