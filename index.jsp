<%@ include file="database.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Attendance System</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Student Attendance System</h1>
            <p>Manage student attendance with QR codes</p>
        </header>
        
        <div class="nav-tabs">
            <a href="index.jsp?tab=addStudent" class="nav-tab <%= "addStudent".equals(request.getParameter("tab")) || request.getParameter("tab") == null ? "active" : "" %>">Add Student</a>
            <a href="index.jsp?tab=generateQR" class="nav-tab <%= "generateQR".equals(request.getParameter("tab")) ? "active" : "" %>">Generate QR Code</a>
            <a href="index.jsp?tab=markAttendance" class="nav-tab <%= "markAttendance".equals(request.getParameter("tab")) ? "active" : "" %>">Mark Attendance</a>
            <a href="index.jsp?tab=viewRecords" class="nav-tab <%= "viewRecords".equals(request.getParameter("tab")) ? "active" : "" %>">View Records</a>
        </div>
        
        <div class="content">
            <%
            String tab = request.getParameter("tab");
            if (tab == null) tab = "addStudent";
            
            switch(tab) {
                case "addStudent":
                    %><%@ include file="addStudent.jsp" %><%
                    break;
                case "generateQR":
                    %><%@ include file="generateQR.jsp" %><%
                    break;
                case "markAttendance":
                    %><%@ include file="markAttendance.jsp" %><%
                    break;
                case "viewRecords":
                    %><%@ include file="viewRecords.jsp" %><%
                    break;
            }
            %>
        </div>
    </div>
    
    <script src="https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"></script>
    <script src="https://unpkg.com/html5-qrcode"></script>
    <script src="script.js"></script>
</body>
</html>