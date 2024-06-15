<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
     <div class="container mt-5" style="width: 100% ">
        <div class="card" >
            <div class="card-header  text-center">
        <h3 class="text-primary text-center">Đăng nhập</h3>
            </div>
            <div class="card-body">
                <c:if test="${not empty errorMessage}">
                    <div class="alert text-danger" role="alert">${ errorMessage }</div>
                </c:if>
                <form action="/login" method="post">
                    <div class="form-group">
                        <label for="tendangnhap">Tên đăng nhập</label>
                        <input class="form-control" type="text" name="username" required>
                        <br>
                        <label for="matkhau">Mật khẩu</label>
                        <input class="form-control" type="password" name="password" required>
                        <br>
                        <span>Bạn chưa có tài khoản?</span> <a href="/SignUp">Đăng ký</a> <br>
                        <a href="/ForgotPassword">Quên mật khẩu?</a> <br>
                        <button class="btn btn-primary" style="margin-left: 60%;">Đăng nhập</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Forgot -->
    
        