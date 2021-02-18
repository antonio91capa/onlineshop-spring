<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="content-header">
	<h1>Add Product</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/admin/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">Add</a></li>
	</ol>
</section>

<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-8">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Quick Example</h3>
				</div>

				<!-- form start -->
				<s:form method="post" modelAttribute="product"
					action="${pageContext.request.contextPath }/admin/product/add"
					acceptCharset="utf-8">

					<div class="box-body">
						<div class="form-group">
							<label for="name">Name</label>
							<s:input type="text" class="form-control" path="name" />
						</div>
						<div class="form-group">
							<label for="price">Price</label>
							<s:input type="number" class="form-control" path="price" />
						</div>
						<div class="form-group">
							<label for="quantity">Quantity</label>
							<s:input type="number" class="form-control" path="quantity" />
						</div>
						<div class="form-group">
							<label for="descripcion">Descripcion</label>
							<s:textarea cssClass="form-control" path="descripcion" />
						</div>
						<div class="form-group">
							<label for="details">Details</label>
							<s:textarea cssClass="form-control" path="details" />
						</div>
						<div class="form-group">
							<label for="category">Category</label>
							<s:select path="category.id" class="form-group">
								<c:forEach var="category" items="${categories}">
									<optgroup label="${category.name }"></optgroup>
									<c:if test="${!category.categories.isEmpty() }">
										<c:forEach var="subcategory" items="${category.categories }">
											<option value="${subcategory.id }">${subcategory.name}</option>
										</c:forEach>
									</c:if>
								</c:forEach>
							</s:select>
						</div>

						<div class="checkbox">
							<label><s:checkbox path="featured" />Featured</label>
						</div>
						<div class="checkbox">
							<label><s:checkbox path="status" />Status</label>
						</div>
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Save</button>
						<s:hidden path="id" />
					</div>
				</s:form>
			</div>

		</div>
	</div>
	<!-- /.row -->
</section>
