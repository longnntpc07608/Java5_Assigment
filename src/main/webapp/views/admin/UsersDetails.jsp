<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<html lang="en">
<head>
<link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
<meta charset="UTF-8">
<title>Users Page</title>
</head>
<body>
	<h1>
		<small>Users Page</small>
	</h1>
	<hr>

	<div class="accordion" id="accordion">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button class="accordion-button" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapseOne"
					aria-expanded="true" aria-controls="collapseOne">User
					Details</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show"
				aria-labelledby="headingOne" data-bs-parent="#accordion">
				<div class="accordion-body">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Username</th>
									<th>Fullname</th>
									<th>Email</th>
									<th>Activated</th>
									<th>Role</th>
									<th colspan="2">Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${page.getContent()}">
									<tr>
										<td>${ item.username }</td>
										<td>${ item.fullname }</td>
										<td>${ item.email }</td>
										<td>${ item.activated ? 'Activated' : 'Not Activated' }</td>
										<td>${ item.role ? 'ADMIN' : 'USER' }</td>
										<td><a href="/admin/users/edit/${item.username}"><button
													class="btn btn-warning">
													<i class="bi bi-pencil"></i>
												</button></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<nav>
							<ul class="pagination justify-content-center">
								<li class="page-item"><a class="page-link"
									href="/admin/users?p=0" aria-label="First"> <i
										class="bi bi-skip-backward-fill"></i>
								</a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/users?p=${page.number == 0 ?  0 : page.number-1}"
									aria-label="Previous"> <i class="bi bi-caret-left-fill"></i>
								</a></li>
								<li class="page-item"><span
									class="page-link bg-light text-dark">${page.number+1} /
										${page.totalPages}</span></li>
								<li class="page-item"><a class="page-link"
									href="/admin/users?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"
									aria-label="Next"> <i class="bi bi-caret-right-fill"></i>
								</a></li>
								<li class="page-item"><a class="page-link"
									href="/admin/users?p=${page.totalPages-1}" aria-label="Last">
										<i class="bi bi-skip-forward-fill"></i>
								</a></li>
							</ul>

						</nav>
					</div>
				</div>
				<div class="accordion-body">
					<form:form class="row g-3" action="/admin/users"
						modelAttribute="user">
						<div class="input-group col-md-8 mb-3">
							<span class="input-group-text" style="width: 3cm;"><b>Username
									*</b></span>
							<form:input type="text" class="form-control" path="username"
								placeholder="Username" readonly="true" />
						</div>
						<div class="input-group col-md-8 mb-3">
							<span class="input-group-text" style="width: 3cm;"><b>Password
									*</b></span>
							<form:input type="password" class="form-control" id="pwd"
								path="password" placeholder="******" readonly="true" />
						</div>
						<div class="input-group col-md-8 mb-3">
							<span class="input-group-text" style="width: 3cm;"><b>Fullname
									*</b></span>
							<form:input type="text" class="form-control" id="fullname"
								path="fullname" placeholder="Enter Fullname" readonly="true" />
						</div>
						<div class="input-group col-md-8 mb-3">
							<span class="input-group-text" style="width: 3cm;"><b>Email
									*</b></span>
							<form:input type="text" class="form-control" id="email"
								path="email" placeholder="Enter email" readonly="true" />
						</div>
						<div class="col-md-4 mb-3">
							<div class="form-group">
								<label for="activated">Activated</label> <br>
								<form:radiobuttons id="activated" path="activated"
									items="${activated}" delimiter=" -_- " class="form-check-input" />
							</div>
						</div>
						<div class="col-md-4 mb-3">
							<div class="form-group">
								<label for="role">Role</label> <br>
								<form:radiobuttons path="role" items="${roles}"
									delimiter=" -_- " class="form-check-input" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-12">
								<button class="btn btn-primary" formaction="/admin/users/save">
									<i class="bi bi-save"></i> Save
								</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
