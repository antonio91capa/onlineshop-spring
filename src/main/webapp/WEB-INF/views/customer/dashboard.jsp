<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<section id="navs">
	<div class="page-header">
		<h3>Customer Panel</h3>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<div class="well" style="padding: 8px 0;">
				<ul class="nav nav-list">
					<li class="nav-header">Customer Panel</li>
					<li><a href="${pageContext.request.contextPath}/customer/history"><i class="icon-book"></i>History</a></li>
					<li><a href="${pageContext.request.contextPath}/customer/profile"><i class="icon-user"></i>Profile</a></li>
					<li class="divider"></li>
					<li>
						<a href="${pageContext.request.contextPath}/customer/process-logout">
							<i class="icon-flag"></i>Logout</a></li>
				</ul>
			</div>
		</div>

	</div>
</section>