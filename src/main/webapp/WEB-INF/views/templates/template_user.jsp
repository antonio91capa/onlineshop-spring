<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="mt" uri="http://nilpointer.net/" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/user/themes/bootshop/bootstrap.min.css"
	media="screen" />
<link
	href="${pageContext.request.contextPath}/resources/user/themes/css/base.css"
	rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link
	href="${pageContext.request.contextPath}/resources/user/themes/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/user/themes/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->
<link
	href="${pageContext.request.contextPath}/resources/user/themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/user/themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath}/resources/user/themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath}/resources/user/themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath}/resources/user/themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/resources/user/themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
</head>
<body>
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row"></div>
			
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="${pageContext.request.contextPath}/home">
					<img src="${pageContext.request.contextPath}/resources/user/themes/images/logo.png"
						alt="Bootsshop" />
					</a>
						
					<mt:searchTag/>
					
					<ul id="topMenu" class="nav pull-right">
						<li class=""><a href="normal.html">Delivery</a></li>
						<li class=""><a href="contact.html">Contact</a></li>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<li>
								<a href="${pageContext.request.contextPath }/customer/dashboard" role="button" 
									style="padding-right: 0">
									<span class="btn btn-large btn-success">Welcome ${pageContext.request.userPrincipal.name}</span>
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath }/customer/process-logout" role="button" 
									style="padding-right: 0">
									<span class="btn btn-large btn-success">Logout</span>
								</a>
							</li>
						</c:if>
						<c:if test="${pageContext.request.userPrincipal.name == null}">
							<li>
								<a href="${pageContext.request.contextPath }/customer-panel" role="button" 
									style="padding-right: 0">
									<span class="btn btn-large btn-success">Login</span>
								</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- Header End====================================================================== -->
	
	<c:if test="${isHome != null }">
		<mt:carouselProducts/>
	</c:if>
	
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<mt:cartTag/>
					</div>
					
					<mt:categoriesList/>
					<br />
					
					<mt:latestProducts/>
					<br />
					
					<div class="thumbnail">
						<img title="Bootshop Payment Methods" alt="Payments Methods"
							src="${pageContext.request.contextPath}/resources/user/themes/images/payment_methods.png">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->
				
				<!-- ======================================= Content ====================================== -->
				<div class="span9">
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="login.html">YOUR ACCOUNT</a> 
					<a href="login.html">PERSONAL INFORMATION</a> 
					<a href="login.html">ADDRESSES</a> 
					<a href="login.html">DISCOUNT</a> 
					<a href="login.html">ORDER HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="contact.html">CONTACT</a> 
					<a href="${pageContext.request.contextPath}/customer/register">REGISTRATION</a>
					<a href="legal_notice.html">LEGAL NOTICE</a> 
					<a href="tac.html">TERMS AND CONDITIONS</a> 
					<a href="faq.html">FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> 
					<a href="#">TOP SELLERS</a> 
					<a href="special_offer.html">SPECIAL OFFERS</a> 
					<a href="#">MANUFACTURERS</a>
					<a href="#">SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="#">
						<img width="60" height="60" title="facebook" alt="facebook"
						src="${pageContext.request.contextPath}/resources/user/themes/images/facebook.png" />
					</a> 
					<a href="#">
						<img width="60" height="60" title="twitter" alt="twitter"
						src="${pageContext.request.contextPath}/resources/user/themes/images/twitter.png" />
					</a> 
					<a href="#">
						<img width="60" height="60" title="youtube" alt="youtube"
						src="${pageContext.request.contextPath}/resources/user/themes/images/youtube.png"/>
					</a>
				</div>
			</div>
			<p class="pull-right">&copy; Bootshop</p>
		</div>
		<!-- Container End -->
	</div>


	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script
		src="${pageContext.request.contextPath}/resources/user/themes/js/jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/themes/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/themes/js/google-code-prettify/prettify.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/themes/js/bootshop.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/user/themes/js/jquery.lightbox-0.5.js"></script>

	<span id="themesBtn"></span>
</body>
</html>