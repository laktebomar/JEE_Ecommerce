<%--
  Created by IntelliJ IDEA.
  User: lakteb
  Date: 16/05/2022
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="index.jsp"%>
<% if (session.getAttribute("name")==null){ response.sendRedirect("login.jsp"); }%>
<section class="h-100 gradient-custom-2">
    <div class="container py-2 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-lg-9 col-xl-7">
                <div class="card">
                    <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
                        <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-profiles/avatar-1.webp"
                                 alt="Generic placeholder image" class="img-fluid img-thumbnail mt-4 mb-2"
                                 style="width: 150px; z-index: 1">
                            <button type="button" class="btn btn-outline-dark" data-mdb-ripple-color="dark"
                                    style="z-index: 1;">
                                <a href="Addproduct.jsp">Add Product</a>
                            </button>
                        </div>
                        <div class="ms-3" style="margin-top: 130px;">
                            <h5><%=session.getAttribute("name")%></h5>
                            <p><%=session.getAttribute("mail")%></p>
                        </div>
                    </div>
                    <div class="p-4 text-black" style="background-color: #f8f9fa;">
                        <div class="d-flex justify-content-end text-center py-1">
                            <div>
                                <p class="mb-1 h5">253</p>
                                <p class="small text-muted mb-0">Product listed</p>
                            </div>
                            <div class="px-3">
                                <p class="mb-1 h5">1026</p>
                                <p class="small text-muted mb-0">Product Bought</p>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-4 text-black">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0">Recent photos</p>
                            <p class="mb-0"><a href="#!" class="text-muted">Show all</a></p>
                        </div>
                        <div class="row g-2">
                            <div class="col mb-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(112).webp"
                                     alt="image 1" class="w-100 rounded-3">
                            </div>
                            <div class="col mb-2">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(107).webp"
                                     alt="image 1" class="w-100 rounded-3">
                            </div>
                        </div>
                        <div class="row g-2">
                            <div class="col">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(108).webp"
                                     alt="image 1" class="w-100 rounded-3">
                            </div>
                            <div class="col">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(114).webp"
                                     alt="image 1" class="w-100 rounded-3">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>