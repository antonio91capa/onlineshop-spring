<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="content-header">
	<h1>Categories List</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/admin/dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">Categories List</li>
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
					<h3 class="box-title">Category</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="categoryList" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="c" items="${categories }">
								<tr>
									<td>${c.id }</td>
									<td>${c.name }</td>
									<td>${c.status ? 'Show' : 'Hide'}</td>
									<td>
										<a href="${pageContext.request.contextPath }/admin/category/edit/${c.id}">Edit</a>
										| 
										<a href="${pageContext.request.contextPath }/admin/category/delete/${c.id}"
											onclick="return confirm('Are you sure?')">Delete</a>
										|
										<a href="${pageContext.request.contextPath }/admin/category/subcategories/${c.id}">Subcategories</a>
										|
										<a href="${pageContext.request.contextPath }/admin/category/addSubcategories/${c.id}">Add Subcategories</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Name</th>
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

<script type="text/javascript">
	$(document).ready(function () {
	    $('#categoryList').DataTable();
	});

	/* $(function() {
		$('#categoryList').DataTable({
			'paging' : true,
			'lengthChange' : false,
			'searching' : false,
			'ordering' : true,
			'info' : true,
			'autoWidth' : false
		});
	}); */
</script>