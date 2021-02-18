<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="well well-small">
	<h4>Featured Products
		<small class="pull-right">200+ featured products</small>
	</h4>
	<div class="row-fluid">
		<div id="featured" class="carousel slide">
			<div class="carousel-inner">
			<div class="item active">
					<ul class="thumbnails">
						<c:forEach var="product" items="${featuredProducts}">
						<c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null)}" />
							<li class="span3">
								<div class="thumbnail">
									<a href="${pageContext.request.contextPath }/product/details/${product.id}">
										<c:if test="${photo != null }">
											<img alt="¨Product Image"
												src="${pageContext.request.contextPath}/uploads/images/${photo.name}">
										</c:if>
										<c:if test="${photo == null }">
											<img alt="Product Image"
												src="${pageContext.request.contextPath}/resources/user/themes/images/no-image.jpg">
										</c:if>
									</a>
									<div class="caption">
										<h5>${product.name }</h5>
										<h4>
											<a class="btn" href="${pageContext.request.contextPath }/product/details/${product.id}">VIEW</a> 
												<span class="pull-right">$${product.price }</span>
										</h4>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<a class="left carousel-control" href="#featured" data-slide="prev">&lsaquo;</a>
			<a class="right carousel-control" href="#featured" data-slide="next">&rsaquo;</a>
		</div>
	</div>
</div>

<h4>Latest Products</h4>
<ul class="thumbnails">
	<c:forEach var="product" items="${latestProducts}">
	<c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null)}" />
	<li class="span3">
		<div class="thumbnail">
			<a href="${pageContext.request.contextPath }/product/details/${product.id}">
				<c:choose>
					<c:when test="${photo != null}">
						<img alt="Product Image"
							src="${pageContext.request.contextPath}/uploads/images/${photo.name}">
					</c:when>
					<c:otherwise>
						<img alt="Product Image"
							src="${pageContext.request.contextPath}/resources/user/themes/images/no-image.jpg">
					</c:otherwise>
				</c:choose>
			</a>
			<div class="caption">
				<h5>${product.name }</h5>
				<p>${product.descripcion }</p>
				
				<h4 style="text-align: center">
					<a class="btn" href="${pageContext.request.contextPath }/product/details/${product.id}"> 
						<i class="icon-zoom-in"></i>
					</a>
					<a class="btn" href="${pageContex.request.contextPath}/cart/buy/${product.id}">
						Add to<i class="icon-shopping-cart"></i>
					</a> 
					<a class="btn btn-primary" href="#">$${product.price }</a>
				</h4>
				
			</div>
		</div>
	</li>
	</c:forEach>
</ul>
