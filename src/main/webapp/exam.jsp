<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    HttpSession sess = request.getSession(false);
    if(sess == null || sess.getAttribute("user") == null) { response.sendRedirect("login.jsp"); return; }
    String username = (String) sess.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Active Assessment Canvas Frame</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="alert alert-warning border-0 shadow-sm rounded-3 py-3 mb-4">
            <div class="fw-bold text-dark">⚠️ PROCTOR ENGINE LOGIC TRIGGER ACTIVE: Switching application windows registers an automated metric report to supervisors.</div>
        </div>
        <div class="card border-0 shadow-sm p-4 rounded-3">
            <div class="d-flex justify-content-between align-items-center border-bottom pb-3 mb-4">
                <h5 class="mb-0 text-muted">Evaluation Module: <span class="text-dark fw-bold">Enterprise Computing Frameworks</span></h5>
                <span class="badge bg-dark px-3 py-2">Candidate Context Node: <span id="userId"><%= username %></span></span>
            </div>
            <form action="logout" method="GET">
                <div class="mb-4">
                    <p class="fw-bold mb-3">Q1. Which statement best isolates connection leak tracking behaviors in relational runtime configurations?</p>
                    <div class="form-check my-2">
                        <input class="form-check-input" type="radio" name="q1" id="opt1">
                        <label class="form-check-label" for="opt1">Standard structural statement assignments</label>
                    </div>
                    <div class="form-check my-2">
                        <input class="form-check-input" type="radio" name="q1" id="opt2">
                        <label class="form-check-label" for="opt2">Try-With-Resources control code execution blocks</label>
                    </div>
                </div>
                <button type="submit" class="btn btn-dark px-4 py-2">Commit Evaluation Responses</button>
            </form>
        </div>
    </div>
    
    <script>
        // High fidelity page-state transition listeners
        document.addEventListener("visibilitychange", () => {
            if (document.hidden) {
                let user = document.getElementById("userId").innerText;
                
                // Emitting native asynchronous POST tracking flag downstream to master servlet
                fetch("logTabSwitch?username=" + encodeURIComponent(user), { method: "POST" })
                .then(res => res.text())
                .then(statusText => {
                    if(statusText === "SUCCESS") {
                        alert("SECURITY DISCLOSURE: Browser window defocus transition intercepted and written to core ledger records.");
                    }
                });
            }
        });
    </script>
</body>
</html>