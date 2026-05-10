<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
    <title>Manage Users - BaloShop Admin</title>

    <!-- CSS -->
    <link href="/css/styles.css" rel="stylesheet" />

    <!-- Bootstrap Icons -->
    <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />

    <!-- Font Awesome -->
    <script
        src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
        crossorigin="anonymous"
    ></script>

 

<!-- Thêm vào trong thẻ <style> của file JSP -->
<style>/* =========================================
   RESPONSIVE DESIGN
   ========================================= */

/* ===== Mobile (<= 576px) ===== */
@media (max-width: 576px) {
    .page-title {
        font-size: 1.5rem;
    }

    .user-card .card-header {
        flex-direction: column;
        align-items: stretch !important;
        text-align: center;
    }

    .btn-create {
        width: 100%;
        margin-top: 10px;
    }

    .table-responsive {
        border-radius: 12px;
    }

    /* Action buttons xếp dọc trên điện thoại */
    .action-buttons {
        flex-direction: column;
        gap: 6px;
    }

    .action-buttons .btn {
        width: 100%;
        min-width: unset;
    }

    .table th:last-child,
    .table td:last-child {
        min-width: 180px;
        width: auto;
    }

    .pagination {
        flex-wrap: wrap;
        gap: 6px;
    }

    .pagination .page-link {
        margin: 2px;
    }
}

/* ===== Tablet (577px - 991px) ===== */
@media (min-width: 577px) and (max-width: 991px) {
    .page-title {
        font-size: 2rem;
    }

    .user-card .card-header {
        flex-wrap: wrap;
    }

    .btn-create {
        white-space: nowrap;
    }

    .action-buttons {
        flex-wrap: nowrap;
        gap: 6px;
    }

    .action-buttons .btn {
        min-width: 80px;
        font-size: 0.8rem;
        padding: 5px 10px;
    }

    .table th:last-child,
    .table td:last-child {
        min-width: 280px;
        width: 280px;
    }
}

/* ===== Laptop/Desktop (>= 992px) ===== */
@media (min-width: 992px) {
    .page-title {
        font-size: 2.25rem;
    }

    .action-buttons {
        flex-wrap: nowrap;
    }

    .action-buttons .btn {
        min-width: 85px;
    }

    .table th:last-child,
    .table td:last-child {
        min-width: 320px;
        width: 320px;
    }
}</style>
</head>

<body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="../layout/sidebar.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">

                    <!-- Page Title -->
                    <h1 class="mt-4 page-title">
                        <i class="bi bi-people-fill me-2 text-primary"></i>
                        Manage Users
                    </h1>

                    <!-- Breadcrumb -->
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item">
                            <a href="/admin">Dashboard</a>
                        </li>
                        <li class="breadcrumb-item active">Users</li>
                    </ol>

                    <!-- Main Card -->
                    <div class="card user-card mb-4">
                        <!-- Card Header -->
                        <div
                            class="card-header d-flex justify-content-between align-items-center flex-wrap gap-3"
                        >
                            <h4>
                                <i class="bi bi-table me-2"></i>
                                User List
                            </h4>

                            <a
                                href="/admin/user/create"
                                class="btn btn-light btn-create"
                            >
                                <i class="bi bi-plus-circle me-1"></i>
                                Create User
                            </a>
                        </div>

                        <!-- Card Body -->
                        <div class="card-body p-0">

                            <!-- Empty State -->
                            <c:if test="${empty users1}">
                                <div class="empty-state">
                                    <i class="bi bi-person-x"></i>
                                    <h5 class="mb-2">No Users Found</h5>
                                    <p class="mb-0">
                                        There are currently no users in the system.
                                    </p>
                                </div>
                            </c:if>

                            <!-- User Table -->
                            <c:if test="${not empty users1}">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover align-middle">
                                        <thead>
                                            <tr>
                                                <th width="8%">ID</th>
                                                <th width="28%">Email</th>
                                                <th width="24%">Full Name</th>
                                                <th width="15%">Role</th>
                                                <th width="25%">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="user" items="${users1}">
                                                <tr>
                                                    <td class="text-center">
                                                        <span class="user-id">
                                                            #${user.id}
                                                        </span>
                                                    </td>

                                                    <td>${user.email}</td>

                                                    <td>${user.fullName}</td>

                                                    <td class="text-center">
                                                        <span class="role-badge">
                                                            ${user.role.name}
                                                        </span>
                                                    </td>

                                                    <td>
                                                        <div class="action-buttons">
                                                            <a
                                                                href="/admin/user/${user.id}"
                                                                class="btn btn-success btn-sm"
                                                            >
                                                                <i class="bi bi-eye-fill me-1"></i>
                                                                View
                                                            </a>

                                                            <a
                                                                href="/admin/user/update/${user.id}"
                                                                class="btn btn-warning btn-sm"
                                                            >
                                                                <i class="bi bi-pencil-square me-1"></i>
                                                                Update
                                                            </a>

                                                            <a
                                                                href="/admin/user/delete/${user.id}"
                                                                class="btn btn-danger btn-sm"
                                                            >
                                                                <i class="bi bi-trash-fill me-1"></i>
                                                                Delete
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <!-- Pagination -->
                    <c:if test="${not empty users1}">
                        <nav aria-label="User pagination">
                            <ul class="pagination justify-content-center">

                                <!-- Previous -->
                                <li class="page-item">
                                    <a
                                        class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                        href="/admin/user?page=${currentPage - 1}"
                                        aria-label="Previous"
                                    >
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>

                                <!-- Page Numbers -->
                                <c:forEach
                                    begin="0"
                                    end="${totalPages - 1}"
                                    varStatus="loop"
                                >
                                    <li class="page-item">
                                        <a
                                            class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                            href="/admin/user?page=${loop.index + 1}"
                                        >
                                            ${loop.index + 1}
                                        </a>
                                    </li>
                                </c:forEach>

                                <!-- Next -->
                                <li class="page-item">
                                    <a
                                        class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                        href="/admin/user?page=${currentPage + 1}"
                                        aria-label="Next"
                                    >
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </c:if>

                </div>
            </main>

            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>

    <!-- JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
</body>
</html>