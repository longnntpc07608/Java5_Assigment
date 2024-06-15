<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Products Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h1>
        <small>Products Page</small>
    </h1>
    <hr>
    <div class="panel-group">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <!-- Table Header -->
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Image</th>
                                <th>Price</th>
                                <th>Create Date</th>
                                <th>Available</th>
                                <th>Category</th>
                                <th colspan="2">Action</th>
                            </tr>
                        </thead>
                        <!-- Table Body -->
                        <tbody>
                            <c:forEach var="item" items="${page.getContent()}">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.name}</td>
                                    <td><img alt="" src="/image/${item.image}" style="width: 50px; height: 50px;"></td>
                                    <td>${item.price}</td>
                                    <td>${item.createDate}</td>
                                    <td>${item.available ? 'Available' : 'Not Available'}</td>
                                    <td>${item.category.name}</td>
                                    <td><a href="/admin/product/edit/${item.id}"><button class="btn btn-warning open-formEdit">
                                                <span class="bi bi-pencil"></span>
                                            </button></a></td>
                                    <td><a href="/admin/product/delete/${item.id}"><button class="btn btn-danger">
                                                <span class="bi bi-trash"></span>
                                            </button></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- Pagination -->
                    <nav>
                        <ul class="pagination justify-content-center">
                            <!-- Pagination Links -->
                            <li class="page-item"><a class="page-link" href="/admin/product?p=0" aria-label="First"><i class="bi bi-skip-backward-fill"></i></a></li>
                            <li class="page-item"><a class="page-link" href="/admin/product?p=${page.number == 0 ? 0 : page.number-1}" aria-label="Previous"><i class="bi bi-caret-left-fill"></i></a></li>
                            <li class="page-item"><span class="page-link bg-light text-dark">${page.number + 1} / ${page.totalPages}</span></li>
                            <li class="page-item"><a class="page-link" href="/admin/product?p=${page.number == page.totalPages - 1 ? page.totalPages - 1 : page.number + 1}" aria-label="Next"><i class="bi bi-caret-right-fill"></i></a></li>
                            <li class="page-item"><a class="page-link" href="/admin/product?p=${page.totalPages - 1}" aria-label="Last"><i class="bi bi-skip-forward-fill"></i></a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="panel-body">
                <!-- Edit Product Form -->
                <form:form method="POST" action="/admin/product/save" modelAttribute="prod" class="form-horizontal" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${prod.id}" />
                    <div class="mb-3">
                        <label for="name" class="form-label">Product Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="${prod.name}" />
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="text" class="form-control" id="price" name="price" value="${prod.price}" />
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">Image</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="image" name="image" value="${prod.image}" readonly>
                            <button type="button" class="btn btn-secondary" id="chooseImage">Choose Image</button>
                        </div>
                        <input type="file" class="form-control-file" id="imageFile" name="imageFile" style="display: none;">
                    </div>
                    <div class="mb-3">
                        <label for="category" class="form-label">Category</label>
                        <select id="category" name="category.id" class="form-select">
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}" <c:if test="${category.id == prod.category.id}">selected</c:if>>${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="available" class="form-label">Availability</label>
                        <select id="available" name="available" class="form-select">
                            <c:forEach var="entry" items="${availables}">
                                <option value="${entry.key}" <c:if test="${entry.key == prod.available}">selected</c:if>>${entry.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                    <a href="/admin/product" class="btn btn-secondary">Cancel</a>
                </form:form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#chooseImage').on('click', function() {
                $('#imageFile').click();
            });

            $('#imageFile').on('change', function() {
                var fileName = $(this).val().split('\\').pop();
                $('#image').val(fileName);
            });
        });
    </script>
</body>
</html>
