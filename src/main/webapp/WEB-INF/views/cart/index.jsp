<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="breadcrumb">
	<li>
		<a href="${pageContext.request.contextPath }/home">Home</a> 
		<span class="divider">/</span>
	</li>
	<li class="active">SHOPPING CART</li>
</ul>
<h3>
	SHOPPING CART [ <small>${countItems} Item(s) </small>]
</h3>
<hr class="soft" />

<form action="${pageContext.request.contextPath}/cart/update" method="post">
<table class="table table-bordered">
	<thead>
		<tr>
			<th>Product</th>
			<th>Name</th>
			<th>Quantity
				<c:if test="${sessionScope.cart != null }">
					<input type="submit" value="update">
				</c:if>
			</th>
			<th>Price</th>
			<th>Total</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="item" items="${sessionScope.cart}" varStatus="i">
	<%-- <c:set var="photo" value="${item.getProduct().getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null) }"></c:set> --%>
		<tr>
			<td>
				<c:choose>
					<c:when test="${photo != null}">
						<img width="60" alt="Product Image"
							src="${pageContext.request.contextPath }/uploads/images/${photo.name}" />
					</c:when>
					<c:otherwise>
						<img alt="Product Image" width="60"
							src="${pageContext.request.contextPath}/resources/user/themes/images/no-image.jpg">
					</c:otherwise>
				</c:choose>
			</td>
			<td>${item.product.name}</td>
			<td>
				<div class="input-append">
					<button class="btn" type="button">
						<i class="icon-minus"></i>
					</button>
					<input class="span1" placeholder="1"
						style="width: 60px;" type="text" name="quantities"
						value="${item.quantity}">
					<button class="btn" type="button">
						<i class="icon-plus"></i>
					</button>
				</div>
			</td>
			<td>$${item.product.price}</td>
			<td>$${item.product.price * item.quantity }</td>
			<td>
				<a class="btn btn-danger" 
					href="${pageContext.request.contextPath }/cart/remove/${i.index}">
					<i class="icon-remove icon-white"></i>
				</a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="4" style="text-align: right">
				<strong>TOTAL</strong></td>
			<td class="label label-important" style="display: block">
				<strong>$${total} </strong></td>
		</tr>
	</tbody>
</table>
</form>

<a href="${pageContext.request.contextPath }/home" class="btn btn-large">
	<i class="icon-arrow-left"></i> Continue Shopping </a>
	
<a href="${pageContext.request.contextPath}/cart/checkout" class="btn btn-large pull-right">
	Checkout<i class="icon-arrow-right"></i></a>
