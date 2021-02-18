<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tg" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="pagedListHolder" scope="request"
	type="org.springframework.beans.support.PagedListHolder"></jsp:useBean>
<c:url value="/product/category/${category.id}" var="pagedLink">
	<c:param name="p" value="~"></c:param>
</c:url>

<ul class="breadcrumb">
	<li><a href="${pageContext.request.contextPath}/home">Home</a> 
		<span class="divider">/</span>
	</li>
	<li class="active">${category.name}</li>
</ul>
<h3>
	${category.name}
	<small class="pull-right">${category.products.size()} products are available </small>
</h3>
<hr class="soft" />
<form class="form-horizontal span6">
	<div class="control-group">
		<label class="control-label alignL">Sort By </label> 
		<select>
			<option>Priduct name A - Z</option>
			<option>Priduct name Z - A</option>
			<option>Priduct Stoke</option>
			<option>Price Lowest first</option>
		</select>
	</div>
</form>

<div id="myTab" class="pull-right">
	<a href="#listView" data-toggle="tab">
		<span class="btn btn-large">
			<i class="icon-list"></i>
		</span>
	</a> 
	<a href="#blockView" data-toggle="tab">
		<span class="btn btn-large btn-primary">
			<i class="icon-th-large"></i>
		</span>
	</a>
</div>
<br class="clr" />
<div class="tab-content">
	<div class="tab-pane" id="listView">
		<c:forEach var="product" items="${pagedListHolder.pageList}">
		<c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null)}"></c:set>
			<div class="row">
				<div class="span2">
					<img src="${pageContext.request.contextPath}/uploads/images/${photo.name}" 
						alt="Product Image" />
				</div>
				<div class="span4">
					<h3>New | Available</h3>
					<hr class="soft" />
					<h5>${product.name}</h5>
					<p>${product.details}</p>
					<a class="btn btn-small pull-right" 
						href="${pageContext.request.contextPath}/product/details/${product.id}">View Details</a> 
					<br class="clr" />
				</div>
				<div class="span3 alignR">
					<form class="form-horizontal qtyFrm">
						<h3>$${product.price }</h3>
						<label class="checkbox"> 
							<input type="checkbox"> Adds product to compair
						</label><br /> 
						<a href="${pageContext.request.contextPath}/product/details/${product.id}"
							class="btn btn-large btn-primary"> 
							Add to <i class=" icon-shopping-cart"></i>
						</a> 
						<a href="${pageContext.request.contextPath}/product/details/${product.id}" class="btn btn-large">
							<i class="icon-zoom-in"></i></a>
					</form>
				</div>
			</div>
			<hr class="soft" />
		</c:forEach>
	</div>

	<div class="tab-pane active" id="blockView">
		<ul class="thumbnails">
			<c:forEach var="product" items="${pagedListHolder.pageList}">
			<c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null)}"></c:set>
				<li class="span3">
				<div class="thumbnail">
					<a href="${pageContext.request.contextPath}/product/details/${product.id}">
						<img src="${pageContext.request.contextPath}/uploads/images/${photo.name}" alt="Product Image" />
					</a>
					<div class="caption">
						<h5>${product.name}</h5>
						<p>${product.descripcion}</p>
						<h4 style="text-align: center">
							<a class="btn" href="${pageContext.request.contextPath}/product/details/${product.id}"> 
								<i class="icon-zoom-in"></i>
							</a> 
							<a class="btn" href="#">
								Add to<i class="icon-shopping-cart"></i>
							</a> 
							<a class="btn btn-primary" href="#">$${product.price}</a>
						</h4>
					</div>
				</div>
			</li>
			</c:forEach>
		</ul>
		<hr class="soft" />
	</div>
</div>

<a href="#" 
	class="btn btn-large pull-right">Compair Product</a>
<div class="pagination">
	<tg:paging pagedLink="${pagedLink}" pagedListHolder="${pagedListHolder}"></tg:paging>
</div>
<br class="clr" />
