<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<section id="navs">
	<div class="page-header">
		<h3>Invoice Details</h3>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<table class="table">
				<thead>
					<tr>
						<th>Name</th>
						<th>Photo</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="total" value="0"></c:set>
					<c:forEach var="invoiceDetail" items="${invoices.invoiceDetailses }">
					<c:set var="total" value="${total + invoiceDetail.product.price * invoiceDetail.product.quantity }"></c:set>
					<c:set var="photo" value="${invoiceDetail.getProduct().getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null) }"></c:set>
						<tr>
							<td>${invoiceDetail.product.name }</td>
							<td><img alt="Product Image" width="120" 
								src="${pageContext.request.contextPath}/uploads/images/${photo.name}"></td>
							<td>$${invoiceDetail.product.price }</td>
							<td>${invoiceDetail.product.quantity }</td>
							<td>$${invoiceDetail.product.price * invoiceDetail.product.quantity}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4" style="text-align: right;"><h4>Total: </h4></td>
						<td><h4>$${total}</h4></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<a href="${pageContext.request.contextPath}/customer/history"
		class="btn btn-large"><i class="icon-arrow-left"></i>History</a>
</section>