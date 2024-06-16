<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<h1>
	<small>Categories Page</small>
</h1>
<hr>
<div class="panel-group">
	<div class="panel panel-info">
		<div class="panel-heading">
			<form:form class="form-horizontal" action="/admin/category"
				modelAttribute="cate">
				<div class="form-group">
					<label class="control-label col-sm-2" for="idCate">ID:</label>
					<div class="col-sm-5">
						<form:input path="Id" type="text" class="form-control" id="idCate"
							placeholder="Category ID" name="id" readonly="true" />
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="catename">Name:
					</label>
					<div class="col-sm-5">
						<form:input path="Name" type="text" class="form-control"
							id="catename" placeholder="Category Name" cssClass="form-control"
							cssErrorClass="has-error has-feedback" />
						<br> ${ errors }
						<form:errors path="*" element="span" cssClass="text-danger" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-primary" formaction="/admin/category/save">
							<span class="glyphicon glyphicon-floppy-save">Save</span>
						</button>
						<button class="btn btn-success" formaction="/admin/category/clear">
							<span class="glyphicon glyphicon-refresh">Clear</span>
						</button>
					</div>
				</div>
			</form:form>
		</div>
		<br>
		<div class="panel-body">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th colspan="2">Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${page.getContent()}">
						<tr>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td><a href="/admin/category/edit/${item.id}"><button
										class="btn btn-warning open-formEdit">
										<span class="bi bi-pencil"></span>
									</button></a></td>
							<td><a href="/admin/category/delete/${item.id}"><button
										class="btn btn-danger">
										<span class="bi bi-trash"></span>
									</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav>
				<ul class="pagination justify-content-center">
					<!-- Pagination Links -->
					<li class="page-item"><a class="page-link"
						href="/admin/category?p=0" aria-label="First"><i
							class="bi bi-skip-backward-fill"></i></a></li>
					<li class="page-item"><a class="page-link"
						href="/admin/category?p=${page.number == 0 ? 0 : page.number-1}"
						aria-label="Previous"><i class="bi bi-caret-left-fill"></i></a></li>
					<li class="page-item"><span
						class="page-link bg-light text-dark">${page.number + 1} /
							${page.totalPages}</span></li>
					<li class="page-item"><a class="page-link"
						href="/admin/category?p=${page.number == page.totalPages - 1 ? page.totalPages - 1 : page.number + 1}"
						aria-label="Next"><i class="bi bi-caret-right-fill"></i></a></li>
					<li class="page-item"><a class="page-link"
						href="/admin/category?p=${page.totalPages - 1}" aria-label="Last"><i
							class="bi bi-skip-forward-fill"></i></a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>