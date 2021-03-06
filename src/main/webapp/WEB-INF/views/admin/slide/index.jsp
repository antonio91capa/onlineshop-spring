<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="content-header">
	<h1>Slide List</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath }/admin/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">Slide List</li>
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
					<a href="${pageContext.request.contextPath}/admin/slide/add"
						class="btn btn-success">Add Slide</a>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<table id="slideList" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Id</th>
								<th>Photo</th>
								<th>Status</th>
								<th>Description</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="slide" items="${slides}">
								<tr>
									<td>${slide.id}</td>
									<td><img src="${pageContext.request.contextPath }/uploads/images/${slide.name}"
										alt="Slide Image" width="150"></td>
									<td>${slide.status ? "show" : "hide"}</td>
									<td>${slide.description}</td>
									<td>
										<a href="${pageContext.request.contextPath }/admin/slide/edit/${slide.id}">Edit</a>
										| 
										<a href="${pageContext.request.contextPath }/admin/slide/delete/${slide.id}"
											onclick="return confirm('Are you sure?')">Delete</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Photo</th>
								<th>Status</th>
								<th>Description</th>
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
	$('#slideList').DataTable({
		'paging' : true,
		'lengthChange' : false,
		'searching' : true,
		'ordering' : true,
		'info' : true,
		'autoWidth' : false
	})
});
</script>