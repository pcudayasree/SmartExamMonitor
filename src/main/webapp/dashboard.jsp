<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Supervisor Metrics Interface Window</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container-fluid px-4">
            <span class="navbar-brand mb-0 h1 fw-bold text-white small fs-5 tracking-wide">🛡️ MONITORING PLATFORM DISPATCH PANEL</span>
            <a href="logout" class="btn btn-sm btn-outline-light px-3">De-authenticate Node</a>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h4 class="fw-bold text-dark mb-0">Active Academic Cohort Assessment Logs</h4>
            <button class="btn btn-white btn-sm border shadow-sm px-3" onclick="location.reload()">Sync Metrics Data</button>
        </div>
        <div class="card border-0 shadow rounded-3 overflow-hidden">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-light border-bottom text-uppercase small text-muted">
                        <tr>
                            <th class="ps-4">Candidate Index</th>
                            <th>Canonical Context Identity Name</th>
                            <th class="text-center">Defocus Events Tracked</th>
                            <th>System Operational State</th>
                            <th class="pe-4">Chronology Event State</th>
                        </tr>
                    </thead>
                    <tbody class="small">
                        <% 
                            List<Map<String, Object>> records = (List<Map<String, Object>>) request.getAttribute("examRecords");
                            if (records != null) {
                                for (Map<String, Object> row : records) {
                                    int counts = (Integer) row.get("tabSwitches");
                                    String colorModifier = (counts > 3) ? "table-danger text-danger fw-bold" : (counts > 0 ? "table-warning" : "");
                        %>
                        <tr class="<%= colorModifier %>">
                            <td class="ps-4 font-monospace"><%= row.get("username") %></td>
                            <td class="fw-bold"><%= row.get("fullName") %></td>
                            <td class="text-center fw-bold text-dark fs-6"><%= counts %></td>
                            <td><span class="badge <%= "PROGRESS".equals(row.get("status")) ? "bg-dark" : "bg-light text-dark border" %>"><%= row.get("status") %></span></td>
                            <td class="text-muted pe-4"><%= row.get("lastUpdate") %></td>
                        </tr>
                        <% 
                                }
                            } 
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>