<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<ul class="breadcrumb">
	<li><a href="${pageContext.request.contextPath}/home">Home</a> 
		<span class="divider">/</span>
	</li>
	<li class="active">Profile</li>
</ul>

<h3>Customer Profile</h3>

<div class="well">
	${error}
	
	<s:form class="form-horizontal" modelAttribute="customer" method="post" 
		action="${pageContext.request.contextPath}/customer/profile">

		<div class="control-group">
			<label class="control-label" for="fullname">Full Name <sup>*</sup></label>
			<div class="controls">
				<s:input id="fullname" path="fullname" required="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="username">Username <sup>*</sup></label>
			<div class="controls">
				<s:input id="username" path="username" readonly="true"
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
					<s:hidden path="id"/>
			</div>
		</div>
	</s:form>
</div>

