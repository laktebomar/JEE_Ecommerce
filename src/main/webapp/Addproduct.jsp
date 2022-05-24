<%--
  Created by IntelliJ IDEA.
  User: lakteb
  Date: 20/05/2022
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="index.jsp"%>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h5 class="card-title text-center mb-5 fw-light fs-5">Add Product</h5>
                    <hr class="my-4">
                    <form method="post" action="AddProduct">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" name="name" placeholder="Omar">
                            <label for="floatingInput">Product Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" name="desc" placeholder="product description">
                            <label for="floatingInput">Description</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingPassword" name="price"  placeholder="Price">
                            <label for="floatingPassword">Price</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingPassword" name="quantity" placeholder="Quantity">
                            <label for="floatingPassword">Quantity</label>
                        </div>

                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Add
                                Product</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
