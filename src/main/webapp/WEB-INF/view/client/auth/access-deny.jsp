<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
  
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
   <section class="d-flex align-items-center min-vh-100 py-5">
        <div class="container py-5">
            <div class="row align-items-center">
                <div class="col-md-6 order-md-2">
                    <div class="lc-block">
                        <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
                        <lottie-player src="https://assets9.lottiefiles.com/packages/lf20_kcsr6fcp.json" background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                    </div>
                </div>
                <div class="col-md-6 text-center text-md-start ">
                    <div class="lc-block mb-3">
                        <div editable="rich">
                            <!-- <h1 class="fw-bold h4">PAGE NOT FOUND!<br></h1> -->
                        </div>
                    </div>
                    <div class="lc-block mb-3">
                        <div editable="rich">
                            <h1 class="display-1 fw-bold text-muted">Error 404</h1>

                        </div>
                    </div>
                    <div class="lc-block mb-5">
                        <div editable="rich">
                            <p class="rfs-11 fw-light">Bạn không có quyền truy cập vào trang này.</p>
                        </div>
                    </div>
                    <div class="lc-block">
                        <a class="btn btn-lg btn-secondary" href="/" role="button">Về trang chủ</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
