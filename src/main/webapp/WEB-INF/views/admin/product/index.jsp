<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="content-header">
	<h1>Product List</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/admin/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">Product List</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">

			<c:if test="${error!=null }">
				<div class="alert alert-danger alert-dismissible">${error }</div>
			</c:if>

			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Product</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="productList" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Price</th>
								<th>Category</th>
								<th>Featured</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products }">
								<tr>
									<td>${product.id }</td>
									<td>${product.name }</td>
									<td>${product.price }</td>
									<td>${product.category.name }</td>
									<td>${product.featured ? "featured": "" }</td>
									<td>${product.status ? 'Show' : 'Hide'}</td>
									<td><a
										href="${pageContext.request.contextPath }/admin/product/edit/${product.id}">Edit</a>
										| <a
										href="${pageContext.request.contextPath }/admin/product/delete/${product.id}"
										onclick="return confirm('Are you sure?')">Delete</a>
										|
										<a href="${pageContext.request.contextPath }/admin/photo/product/${product.id}">Photos</a>
										|
										<a href="${pageContext.request.contextPath }/admin/photo/add/${product.id}">Add Photos</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Price</th>
								<th>Category</th>
								<th>Featured</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->

		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>
<!-- /.content -->

<script src="https://code.jquery.com/jquery-3.3.1.js"></script> 
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	
<script>
$(document).ready(function(){
	$('#productList').DataTable({
		'paging' : true,
		'lengthChange' : false,
		'searching' : true,
		'ordering' : true,
		'info' : true,
		'autoWidth' : false
	})
});
</script>