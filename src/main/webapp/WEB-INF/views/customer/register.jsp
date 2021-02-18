<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<ul class="breadcrumb">
	<li><a href="${pageContext.request.contextPath}/home">Home</a> 
		<span class="divider">/</span>
	</li>
	<li class="active">Registration</li>
</ul>
<h3>Registration</h3>
<div class="well">
	<!--
	<div class="alert alert-info fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div> -->
	${error }
	<s:form class="form-horizontal" modelAttribute="account" method="post" 
		action="${pageContext.request.contextPath}/customer/register">

		<div class="control-group">
			<label class="control-label" for="fullname">Full Name <sup>*</sup></label>
			<div class="controls">
				<s:input id="fullname" path="fullname" required="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="username">Username <sup>*</sup></label>
			<div class="controls">
				<s:input id="username" path="username"
					placeholder="Username" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="password">Password <sup>*</sup></label>
			<div class="controls">
				<s:password path="password" placeholder="Password"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="address">Address<sup>*</sup></label>
			<div class="controls">
				<s:input type="text" id="address" path="address" placeholder="Adress" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="email">Email <sup>*</sup></label>
			<div class="controls">
				<s:input type="text" id="email" path="email" placeholder="account@mail.com" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="phone">Phone </label>
			<div class="controls">
				<s:input type="text" path="phone" id="phone"
					placeholder="1238749239" />
			</div>
		</div>

		<div class="control-group">
			<div class="controls">
				<input class="btn btn-large btn-success" type="submit"
					value="Register" />
			</div>
		</div>
	</s:form>
</div>

