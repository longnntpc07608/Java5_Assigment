<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />

<div>
	<h1 class="logo-badge text-whitesmoke">
		<span class="fa fa-user-circle"></span>
	</h1>
</div>
<h3 class="text-whitesmoke"><a href="/">HeadPhone</a></h3>
<h4 class="text">Sign Up</h4> 
<div class="container-content">
	<p class="text-danger">${ errorMessageSignUp }</p> 
	<form:form action="/SignUp" method="post" modelAttribute="user">
		<div class="modal-body">
			<div class="form-content">
					<div class="form-group">
						<form:input path="username" class="form-control" name="username"
							placeholder="User Name *" />
					</div>
					<div class="form-group">
						<form:input path="fullname" class="form-control" name="fullname"
							placeholder="Full Name *" />
					</div>
					<div class="form-group">
						<form:input path="email" class="form-control" name="email"
							placeholder="Email *" />
					</div>
					<div class="form-group">
						<form:input path="password" class="form-control" name="password" type="password"
							placeholder="Password *" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="cfpwd"
							placeholder="Confirm Password *" />
					</div>
				<button type="submit" class="form-button button-l margin-b btn-primary">Submit</button>
			</div>
		</div>
	</form:form>
</div>
<div class="container-content">
	
	<a class="text" href="/login"><small>Sign
			In</small></a>
	
</div>


