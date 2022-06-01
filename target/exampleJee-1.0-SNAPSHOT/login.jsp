<%--
  Created by IntelliJ IDEA.
  User: lakteb
  Date: 11/05/2022
  Time: 17:12
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="index.jsp" %>
<% if (session.getAttribute("name")!=null){ response.sendRedirect("Home.jsp"); }%>
<body>
    <div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3 my-5">
                <div class="card-body p-4 p-sm-5">
                    <h5 class="card-title text-center mb-5 fw-light fs-5">Sign In</h5>
                    <hr class="my-4">
                    <form method="post" action="Login">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="floatingInput" name="mail" placeholder="name@example.com" required>
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="floatingPassword" name="pass" placeholder="Password" required>
                            <label for="floatingPassword">Password</label>
                        </div>

                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" value="" id="rememberPasswordCheck">
                            <label class="form-check-label" for="rememberPasswordCheck">
                                Remember password
                            </label>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Sign
                                in</button>
                        </div>
                        <hr class="my-4">
                        <a href="register.jsp"> Don't have an account, create one!</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

    <script type="text/javascript">
            var status = document.getElementsById("status").value
            if (status == "failed"){
                swal("sorry", "wrong username or password")
            }

            if (status =="invalid mail"){
                swal("sorry", "please enter your user mail", "error")
            }

            if (status =="invalid mail"){
                swal("sorry", "please enter your user mail", "error")
            }
    </script>
</body>

