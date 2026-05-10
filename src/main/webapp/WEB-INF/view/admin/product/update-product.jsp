<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="Hỏi Dân IT - Dự án baloshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Dashboard - Hỏi Dân IT</title>

    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${newProduct.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Update product</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">Dashboard</a>
                <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                 <li class="breadcrumb-item active">Update</li>
              </li>
              
            </ol>
            <div>
              <div class="mt-5">
                <div class="row">
                  <div class="col-md-6 mx-auto">
                    <h3>Update a product</h3>
                    <hr />
                    <form:form
                      method="post"
                      class="row"
                      action="/admin/product/update"
                      modelAttribute="newProduct"
                      enctype="multipart/form-data"
                    >
                    <c:set var="errorName">
                          <form:errors path="name" cssClass="invalid-feedback" />
                        </c:set>
                         <c:set var="errorPrice">
                          <form:errors path="price" cssClass="invalid-feedback" />
                        </c:set>
                        <c:set var="errorDetailDesc">
                          <form:errors path="detailDesc" cssClass="invalid-feedback" />
                        </c:set>
                        <c:set var="errorShortDesc">
                          <form:errors path="shortDesc" cssClass="invalid-feedback" />
                        </c:set>
                        <c:set var="errorQuantity">
                          <form:errors path="quantity" cssClass="invalid-feedback" />
                        </c:set>
                        <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id:</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                      <div class="mb-3 col-12 col-md-6">
                       
                        <label class="form-label">Name:</label>
                        <form:input
                          type="name"
                          class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                          path="name"
                        />
                        ${errorName}
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                       
                        <label class="form-label">Price:</label>
                        <form:input
                          type="number"
                          step="any"
                          class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                          path="price"
                        />
                        ${errorPrice}   
                      </div>
                      <div class="mb-3 col-12">
                        
                        <label class="form-label">Detail Description:</label>
                        <form:textarea 
                          type="text"
                          class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                          path="detailDesc"
                        />
                        ${errorDetailDesc}
                      </div>
                      <div class="mb-3 col-12">
                        
                        <label class="form-label">short Description :</label>
                        <form:input
                          type="text"
                          class="form-control   ${not empty errorShortDesc ? 'is-invalid' : ''}"
                          path="shortDesc"
                        />
                        ${errorShortDesc}
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        
                        <label class="form-label">quantity:</label>
                        <form:input
                          type="number"
                          
                          class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                          path="quantity"
                        />
                        ${errorQuantity}
                      </div>

                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">factory:</label>
                        <form:select class="form-select" path="factory">
                          <form:option value="NIKE">Nike</form:option>
                          <form:option value="ADIDAS">Adidas</form:option>
                          <form:option value="MIKKOR">Mikkor</form:option>
                          <form:option value="RIVACASE">Rivacase</form:option>
                          <form:option value="SIMPLECARRY"
                            >Simplecarry</form:option
                          >
                          <form:option value="SUPERDRY">Superdry</form:option>
                          <form:option value="SOLO">Solo</form:option>
                          <form:option value="TUCANO">Tucano</form:option>
                          <form:option value="TARGUS">Targus</form:option>
                        </form:select>
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">Target:</label>
                        <form:select class="form-select" path="target">
                          <form:option value="LAPTOP">Laptop</form:option>
                          <form:option value="DU-LICH">Du lịch</form:option>
                          <form:option value="THOI-TRANG-THE-THAO"
                            >Thời trang thể thao</form:option
                          >
                          <form:option value="MAY-ANH">Máy ảnh</form:option>
                          <form:option value="QUAN-DOI">Quân đội</form:option>
                          <form:option value="MOT-QUAI">Một quai</form:option>
                        </form:select>
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label for="avatarFile" class="form-label"
                          >Image:</label
                        >
                        <input
                          class="form-control"
                          type="file"
                          id="avatarFile"
                          name="AvatarFile"
                          accept=".png, .jpg, .jpeg"
                        />
                      </div>
                      <div class="col-12 mb-3">
                        <img
                          style="max-height: 250px; display: none"
                          alt="avatar preview"
                          id="avatarPreview"
                        />
                      </div>
                      <div class="col-12 mb-5">
                        <button type="submit" class="btn btn-primary">
                          Update
                        </button>
                      </div>
                    </form:form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
