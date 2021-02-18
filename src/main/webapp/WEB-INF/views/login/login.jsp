<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="breadcrumb">
	<li><a href="${pageContext.request.contextPath}/home">Home</a> <span class="divider">/</span></li>
	<li class="active">Login</li>
</ul>
<h3>Login</h3>
<hr class="soft" />

<div class="row">
	<div class="span2">&nbsp;</div>
	<div class="span4">
		<div class="well">
			<h5>Login</h5>
			
			<c:if test="${msg != null }">
				<span style="color: red;">${msg}</span>
			</c:if>
			
			<form method="post" action="${pageContext.request.contextPath}/customer/process-login">
				<div class="control-group">
					<label class="control-label" for="username">Username</label>
					<div class="controls">
						<input class="span3" type="text" id="username" 
							name="username" placeholder="Username">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="password">Password</label>
					<div class="controls">
						<input type="password" class="span3" id="password" 
							name="password" placeholder="Password">
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" class="btn btn-success">Sign in</button>
						<a href="${pageContext.request.contextPath}/customer/register" class="pull-right">Register</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
