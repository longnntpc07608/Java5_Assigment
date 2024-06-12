<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
        .sidebar {
            position: sticky;
            top: 0;
            height: 100vh;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                <div class="d-flex flex-column justify-content-between h-100">
                    <div>
                        <br>
                        <a href="/"><button class="btn btn-warning w-100 mb-3">
                            <i class="bi bi-arrow-left"></i> Quay về Shop
                        </button></a>
                        <h2>Online Store</h2>
                        <br>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="/admin">
                                    <i class="bi bi-speedometer2"></i> Thống Kê
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="collapse" href="#collapseProduct" role="button" aria-expanded="false" aria-controls="collapseProduct">
                                    <i class="bi bi-cart"></i> Sản Phẩm <span class="caret"></span>
                                </a>
                                <div class="collapse" id="collapseProduct">
                                    <ul class="nav flex-column ms-3">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/product">
                                                <i class="bi bi-arrow-right"></i> Quản Lý Sản Phẩm
                                            </a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/admin/category">
                                                <i class="bi bi-arrow-right"></i> Quản Lý LSP
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/bill">
                                    <i class="bi bi-receipt"></i> Hóa Đơn
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin/users">
                                    <i class="bi bi-person"></i> Người Dùng
                                </a>
                            </li>
                        </ul>
                    </div>
                    <ul class="nav flex-column mb-3">
                        <li class="nav-item">
                            <a class="nav-link" href="/login">
                                <i class="bi bi-box-arrow-in-right"></i> Đăng Xuất
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <jsp:include page="${views}"></jsp:include>
            </main>
        </div>
    </div>

    <footer class="container-fluid text-center">
        <p>
            Design By <b>Nguyễn Thành Nam © ASS_SOF3021</b>
        </p>
    </footer>

    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"></script>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"></script>
</body>
</html>
