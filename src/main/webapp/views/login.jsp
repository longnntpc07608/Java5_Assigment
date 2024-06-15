<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ TitlePage }</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous" />
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<style>
	.main-bg {
        background-image: url('../image/aa.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        height: 100vh;
    }
</style>
</head>
<body class="main-bg">

	<div class="container" style="margin-top: 10px">
	
    <h1 class="fw-bold fst-italic text-primary">HEADPHONE</h1>
    
		<div class="mt-5" style="margin-left: 60%">
		<jsp:include page="${ views }"></jsp:include>
		</div>
	</div>
	
	<!-- Modal Forgot -->
	<div class="modal fade" id="modalForgot" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="container-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="text-whitesmoke" align="center">Forgot Password</h4>
				</div>
				<form action="/ForgotPassword" method="post">
					<div class="modal-body">
						<div class="form-content">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<input type="text" class="form-control"
											placeholder="User Name *" name="usernameF" required/>
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<input type="email" class="form-control"
											placeholder="Email *" name="emailF" required/>
									</div>
								</div>
							</div>
							<button type="submit" class=" btn btn-primary">Submit</button>
						</div>
					</div>
				</form>
			</div>

		</div>
	</div>
	
</body>
</html>
