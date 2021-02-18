<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<section class="content-header">
	<h1>
		Profile Details
	</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/admin/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Profile</a></li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-8">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Admin Profile</h3>
				</div>
				<!-- /.box-header -->
				<!-- form start -->
				<s:form method="post" modelAttribute="account" 
					action="${pageContext.request.contextPath }/admin/account/profile">
					<div class="box-body">
						<div class="form-group">
							<label for="username">Username</label> 
							<s:input type="text" class="form-control"
								placeholder="username" path="username" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> 
							<s:input type="password" class="form-control" id="password" 
								path="password" />
						</div>
						<div class="form-group">
							<label for="fullname">Full Name</label> 
							<s:input type="text" class="form-control" id="fullname"
								placeholder="Full Name" path="fullname" />
						</div>
						<div class="form-group">
							<label for="address">Address</label> 
							<s:input type="text" class="form-control" id="address"
								placeholder="Address" path="address" />
						</div>
						<div class="form-group">
							<label for="email">Email</label> 
							<s:input type="email" class="form-control" id="email"
								placeholder="email@mail.com" path="email" />
						</div>
						<div class="form-group">
							<label for="phone">Phone</label> 
							<s:input type="text" class="form-control" id="phone"
								placeholder="7621882727" path="phone" />
						</div>
					</div>
					<!-- /.box-body -->

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
						<s:hidden path="id"/>
					</div>
				</s:form>
			</div>
		</div>
	</div>
</section>
