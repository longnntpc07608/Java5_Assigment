<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<h1>
    <small>Products Page</small>
</h1>
<hr>
<div class="panel-group">
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="table-responsive">
                <table class="table table-bordered">
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
                    <tbody>
                        <c:forEach var="item" items="${page.getContent()}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.name}</td>
                                <td><img alt="" src="/image/${item.image}" style="width: 20px; height: 20px"></td>
                                <td>${item.price}</td>
                                <td>${item.createDate}</td>
                                <td>${item.available == true ? 'Available' : 'Not Available'}</td>
                                <td>${item.category.name}</td>
                                <td><a href="/admin/product/edit/${item.id}"><button class="btn btn-warning open-formEdit"><span class="bi bi-pencil"></span></button></a></td>
                                <td><a href="/admin/product/delete/${item.id}"><button class="btn btn-danger"><span class="bi bi-trash"></span></button></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <nav>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link"
				href="/admin/product?p=0" aria-label="First"> <i
					class="bi bi-skip-backward-fill"></i>
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/admin/product?p=${page.number == 0 ? 0 : page.number-1}"
				aria-label="Previous"> <i class="bi bi-caret-left-fill"></i>
			</a></li>
			<li class="page-item"><span class="page-link bg-light text-dark">${page.number+1}
					/ ${page.totalPages}</span></li>
			<li class="page-item"><a class="page-link"
				href="/admin/product?p=${page.number == page.totalPages-1 ? page.totalPages-1 : page.number+1}"
				aria-label="Next"> <i class="bi bi-caret-right-fill"></i>
			</a></li>
			<li class="page-item"><a class="page-link"
				href="/admin/product?p=${page.totalPages-1}" aria-label="Last"> <i
					class="bi bi-skip-forward-fill"></i>
			</a></li>
		</ul>
	</nav>
            </div>
        </div>
        <div class="panel-body">
            <form:form class="form-horizontal" action="/admin/product" modelAttribute="prod">
                <div class="input-group mb-3">
                    <span class="input-group-text" style="width: 3cm;"><b>ID</b></span>
                    <form:input type="text" class="form-control" path="Id" readonly="true" />
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" style="width: 3cm;"><b>Name</b></span>
                    <form:input type="text" class="form-control" path="name" placeholder="Name Product" />
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" style="width: 3cm;"><b>Image</b></span>
                    <form:input type="file" class="form-control" path="image" placeholder="Image Product" />
                </div>
                <div class="input-group mb-3">
                    <span class="input-group-text" style="width: 3cm;"><b>Price</b></span>
                    <form:input type="text" class="form-control" path="price" placeholder="Price Product" />
                </div>
                <div class="input-group mb-3">
                    <div class="col-6">
                        <div class="form-group">
                            <label for="cate" class="form-label">Category</label>
                            <select id="cate" name="category" class="form-select">
                                <c:forEach var="cate" items="${categories}">
                                    <option value="${cate.id}">${cate.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label for="avai" class="form-label">Available</label>
                            <form:radiobuttons id="avai" path="available" items="${availables}" delimiter=" -_- " />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button class="btn btn-primary" formaction="/admin/product/save">
                            <span class="bi bi-floppy-disk">Save</span>
                        </button>
                        <button class="btn btn-success" formaction="/admin/product/clear">
                            <span class="bi bi-arrow-counterclockwise">Clear</span>
                        </button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</div>
