<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Secure Core Portal - Gateway Authorization</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card shadow border-0 rounded-3">
                    <div class="card-body p-4">
                        <h4 class="text-center mb-4 fw-bold text-dark">Portal Authentication</h4>
                        <% if(request.getParameter("error") != null) { %>
                            <div class="alert alert-danger py-2 small text-center"><%= request.getParameter("error") %></div>
                        <% } %>
                        <form action="login" method="POST">
                            <div class="mb-3">
                                <label class="form-label text-muted small fw-bold">USER ID ACCESS KEY</label>
                                <input type="text" name="username" class="form-control form-control-lg" placeholder="e.g. SRIT101" required>
                            </div>
                            <div class="mb-4">
                                <label class="form-label text-muted small fw-bold">SECURE ACCREDITATION PIN</label>
                                <input type="password" name="password" class="form-control form-control-lg" required>
                            </div>
                            <button type="submit" class="btn btn-dark btn-lg w-100 fs-6">Initialize Web Session</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>