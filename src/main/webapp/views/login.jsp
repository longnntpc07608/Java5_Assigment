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
	
    <h1 class="fw-bold fst-italic text-primary">HEADPHONE STORE</h1>
    
		<div class="mt-5" style="margin-left: 60%">
		<jsp:include page="${ views }"></jsp:include>
		</div>
	</div>
	
	<!-- Modal Forgot -->
	
</body>
</html>
