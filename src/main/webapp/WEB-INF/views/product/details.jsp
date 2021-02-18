<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul class="breadcrumb">
	<li><a href="${pageContext.request.contextPath }/home">Home</a> <span class="divider">/</span></li>
	<li class="active">product Details</li>
</ul>

<c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null)}"></c:set>
<div class="row">
	<div id="gallery" class="span3">
		<a href="#"	title="${product.name }">
			<c:if test="${photo != null }">
				<img alt="¨Product Image" style="width: 100%"
					src="${pageContext.request.contextPath}/uploads/images/${photo.name}">
			</c:if>
			<c:if test="${photo == null }">
				<img alt="Product Image"
					src="${pageContext.request.contextPath}/resources/user/themes/images/no-image.jpg">
			</c:if> 
		</a>
		<div id="differentview" class="moreOptopm carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<c:forEach var="p" items="${photos }">
						<a href="${pageContext.request.contextPath }/uploads/images/${p.name}"> 
							<img style="width: 29%" src="${pageContext.request.contextPath }/uploads/images/${p.name}" alt="" />
						</a>
					</c:forEach>
				</div>
			</div>
			
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a> 
		</div>

		<div class="btn-toolbar">
			<div class="btn-group">
				<span class="btn"><i class="icon-envelope"></i></span> 
				<span class="btn"><i class="icon-print"></i></span> 
				<span class="btn"><i class="icon-zoom-in"></i></span> 
				<span class="btn"><i class="icon-star"></i></span> 
				<span class="btn"><i class=" icon-thumbs-up"></i></span> 
				<span class="btn"><i class="icon-thumbs-down"></i></span>
			</div>
		</div>
	</div>
	<div class="span6">
		<h3>${product.name }</h3>
		<hr class="soft" />
		<form class="form-horizontal qtyFrm">
			<div class="control-group">
				<label class="control-label"><span>$${product.price }</span></label>
				<div class="controls">
					<input type="number" class="span1" placeholder="Qty." />
					<button type="submit" class="btn btn-large btn-primary pull-right">
						Add to cart <i class=" icon-shopping-cart"></i>
					</button>
				</div>
			</div>
		</form>

		<hr class="soft clr" />
		<p>${product.descripcion }</p>
		<a class="btn btn-small pull-right" href="#detail">More Details</a> 
		<br	class="clr" /> 
		<a href="#" name="detail"></a>
		<hr class="soft" />
	</div>

	<div class="span9">
		<ul id="productDetail" class="nav nav-tabs">
			<li class="active">
				<a href="#home" data-toggle="tab">Product Details</a>
			</li>
			<li>
				<a href="#profile" data-toggle="tab">Related Products</a>
			</li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="home">
				${product.details }
			</div>
			<div class="tab-pane fade" id="profile">
				<div id="myTab" class="pull-right">
					<a href="#listView" data-toggle="tab">
						<span class="btn btn-large"><i class="icon-list"></i>
						</span>
					</a> 
					<a href="#blockView" data-toggle="tab">
						<span class="btn btn-large btn-primary"><i class="icon-th-large"></i>
						</span>
					</a>
				</div>
				<br class="clr" />
				<hr class="soft" />
				<div class="tab-content">
					
					<div class="tab-pane" id="listView">
						<div class="row">
							<div class="span2">
								<img src="themes/images/products/4.jpg" alt="" />
							</div>
							<div class="span4">
								<h3>New | Available</h3>
								<hr class="soft" />
								<h5>Product Name</h5>
								<p>Nowadays the lingerie industry is one of the most
									successful business spheres.We always stay in touch with the
									latest fashion tendencies - that is why our goods are so
									popular..</p>
								<a class="btn btn-small pull-right" href="product_details.html">
									View Details</a> 
								<br class="clr" />
							</div>
							<div class="span3 alignR">
								<form class="form-horizontal qtyFrm">
									<h3>$222.00</h3>
									<label class="checkbox"> 
										<input type="checkbox">	Adds product to compair
									</label><br />
									<div class="btn-group">
										<a href="product_details.html" class="btn btn-large btn-primary"> 
											Add to <i class=" icon-shopping-cart"></i>
										</a> 
										<a href="product_details.html" class="btn btn-large">
											<i class="icon-zoom-in"></i>
										</a>
									</div>
								</form>
							</div>
						</div>
						<hr class="soft" />
					</div>
					
					<!---------------- Related Products ------------------------------>
					<div class="tab-pane active" id="blockView">
						<ul class="thumbnails">
						<c:forEach var="p" items="${relatedProducts}">
						<c:set var="photo" value="${p.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().orElse(null)}"></c:set>
							<li class="span3">
								<div class="thumbnail">
									<a href="${pageContext.request.contextPath }/product/details/${p.id}"><img
										src="${pageContext.request.contextPath }/uploads/images/${photo.name}" alt="" /></a>
									<div class="caption">
										<h5>${p.name}</h5>
										<p>${p.descripcion}</p>
										<h4 style="text-align: center">
											<a class="btn" href="product_details.html"> 
												<i class="icon-zoom-in"></i>
											</a> 
											<a class="btn" href="${pageContex.request.contextPath}/cart/buy/${p.id}">
												Add to<i class="icon-shopping-cart"></i>
											</a> 
											<a class="btn btn-primary" href="${pageContext.request.contextPath }/product/details/${p.id}">$${p.price}</a>
										</h4>
									</div>
								</div>
							</li>
							</c:forEach>
						</ul>
						<hr class="soft" />
					</div>
					
				</div>
				<br class="clr">
			</div>
		</div>
	</div>
</div>
