<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="content-header">
	<h1>Invoice Details</h1>
	<ol class="breadcrumb">
		<li>
			<a href="${pageContext.request.contextPath }/admin/dashboard">
				<i class="fa fa-dashboard"></i> Home
			</a>
		</li>
		<li class="active">Invoice Details</li>
	</ol>
</section>

<section class="invoice">
	<!-- title row -->
	<div class="row">
		<div class="col-xs-12">
			<h2 class="page-header">
				<i class="fa fa-globe"></i> 
				${invoices.name} (#${invoices.id}) 
				<small class="pull-right">Date: <fmt:formatDate value="${invoices.created}" pattern="dd-MM-yyyy"/></small>
			</h2>
		</div>
	</div>
	
	<!-- info row -->
	<div class="row invoice-info">
		<div class="col-sm-4 invoice-col">
			To
			<address>
				<strong>${invoices.account.fullname}</strong> <br>
				${invoices.account.address}<br>
				Phone: ${invoices.account.phone}<br> 
				Email: ${invoices.account.email}
			</address>
		</div>
	</div>
	<!-- /.row -->

	<!-- Table row -->
	<div class="row">
		<div class="col-xs-12 table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Photo</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Subtotal</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="total" value="0"></c:set>
					<c:forEach var="invoiceDetail" items="${invoices.invoiceDetailses }">
						<c:set var="total"
							value="${total + invoiceDetail.product.price * invoiceDetail.product.quantity }"></c:set>
						<c:set var="photo"
							value="${invoiceDetail.getProduct().getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null) }" />
						<tr>
							<td>${invoiceDetail.product.id}</td>
							<td>${invoiceDetail.product.name}</td>
							<td>
								<img alt="Product Image" width="60"
									src="${pageContext.request.contextPath}/uploads/images/${photo.name}">
							</td>
							<td>$${invoiceDetail.product.price}</td>
							<td>${invoiceDetail.product.quantity}</td>
							<td>$${invoiceDetail.product.price * invoiceDetail.product.quantity}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-6">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>Total:</th>
						<td><fmt:formatNumber value="${total}" type="currency" /></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<c:if test="${invoices.status == 'Pending'}">
		<div class="row">
			<div class="col-xs-12">
				<a class="btn btn-primary pull-right" style="margin-right: 5px;"
					href="${pageContext.request.contextPath}/admin/invoices/update/${invoices.id}">
					<i class="fa fa-undo"></i> Update
				</a>
			</div>
		</div>
	</c:if>
</section>
