<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
        />
</head>
<body>
	<div class="container mt-5" style="width: 100%">
  		<div class="card">
  			<div class="card-header text-center">
  				<h2 class="text-dark text-center">HEADPHONE STORE</h2>
  				<h3 class="text-primary">Đổi mật khẩu</h3>
  			</div>
  			<div class="card-body">
			    <form action="/reset-password" method="post">
			        <div class="form-group">
			        	<label for="username">Tên đăng nhập</label>
				        <input class="form-control" type="text" name="username" readonly="true" value="${User.username}"><br>
				        <label>Mật khẩu hiện tại</label>
				        <input class="form-control" type="password" readonly="true" value="${User.password}"><br>
				        <label for="password">Mật khẩu mới</label>
				        <input class="form-control" type="password" id="password" name="password"><br>
				        <label for="cfpwd">Xác nhận mật khẩu mới</label>
				        <input class="form-control" type="password" id="cfpwd" name="cfpwd"><br>
				        <button class="btn btn-primary" style="margin-left: 80%" type="submit">Đổi mật khẩu</button>
			        </div>
			    </form>
  			</div>
  		</div>
  </div>
</body>
</html>