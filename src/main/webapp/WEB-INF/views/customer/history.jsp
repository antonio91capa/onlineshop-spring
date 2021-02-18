<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<section id="navs">
	<div class="page-header">
		<h3>History</h3>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<c:if test="${invoices.size() > 0 }">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>#</th>
							<th>Name</th>
							<th>Created</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="invoice" items="${invoices}">
							<tr>
								<td>${invoice.id}</td>
								<td>${invoice.name}</td>
								<td>${invoice.created}</td>
								<td>${invoice.status}</td>
								<td>
									<a class="btn btn-success"
										href="${pageContext.request.contextPath}/customer/invoicedetails/${invoice.id}">Details</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${invoices.size() < 1 }">
				<h3>You don´t have invoices</h3>
				<a href="${pageContext.request.contextPath}/customer/dashboard" 
					class="btn btn-inverse">
					<i class="icon-chevron-left"></i> Back
				</a>
			</c:if>
		</div>
	</div>
</section>