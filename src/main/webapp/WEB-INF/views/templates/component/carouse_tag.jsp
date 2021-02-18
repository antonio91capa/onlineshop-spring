<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<c:forEach var="slide" items="${slides}">
				<div class="item">
					<div class="container">
						<a href="register.html">
							<img style="width: 100%" alt="special offers"
								src="${pageContext.request.contextPath}/uploads/images/${slide.name}"/>
						</a>
						<div class="carousel-caption">
							<p>${slide.description}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
</div>