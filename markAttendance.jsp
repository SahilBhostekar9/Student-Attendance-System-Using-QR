<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String qrData = request.getParameter("qrData");
    
    if (qrData != null && !qrData.trim().isEmpty()) {
        String[] dataParts = qrData.split("\\|");
        if (dataParts.length >= 2) {
            String studentId = dataParts[0];
            String timestamp = new java.util.Date().toString();
            
            try {
                // Check if attendance already marked today
                String checkSql = "SELECT * FROM attendance WHERE student_id = ? AND DATE(timestamp) = CURDATE()";
                PreparedStatement checkStmt = conn.prepareStatement(checkSql);
                checkStmt.setString(1, studentId);
                ResultSet rs = checkStmt.executeQuery();
                
                if (rs.next()) {
                    out.println("<div class='message success'>Attendance marked for this student today!</div>");
                } else {
                    String sql = "INSERT INTO attendance (student_id, timestamp) VALUES (?, NOW())";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setString(1, studentId);
                    stmt.executeUpdate();
                    out.println("<div class='message success'>Attendance marked for student ID: " + studentId + "</div>");
                }
            } catch (Exception e) {
                out.println("<div class='message error'>Error: " + e.getMessage() + "</div>");
            }
        }
    }
}
%>

<div class="tab-content">
    <h2>Mark Attendance with QR Code</h2>
    <div class="attendance-scanner">
        <div id="reader" width="400px"></div>
        <form method="post" id="attendanceForm">
            <input type="hidden" name="qrData" id="qrData">
        </form>
    </div>
    
    <div class="student-list">
        <h3>Today's Attendance Records</h3>
        <%
        try {
            String sql = "SELECT a.*, s.name FROM attendance a JOIN students s ON a.student_id = s.id WHERE DATE(a.timestamp) = CURDATE() ORDER BY a.timestamp DESC";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if (!rs.isBeforeFirst()) {
                out.println("<p>No attendance records for today.</p>");
            } else {
                out.println("<table>");
                out.println("<thead><tr><th>Student ID</th><th>Name</th><th>Time</th></tr></thead>");
                out.println("<tbody>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("student_id") + "</td>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getString("timestamp") + "</td>");
                    out.println("</tr>");
                }
                out.println("</tbody></table>");
            }
        } catch (Exception e) {
            out.println("<p>Error retrieving attendance: " + e.getMessage() + "</p>");
        }
        %>
    </div>
</div>

<script>
// Initialize scanner when tab is loaded
document.addEventListener('DOMContentLoaded', function() {
    if (document.getElementById('reader')) {
        var html5QrcodeScanner = new Html5QrcodeScanner(
            "reader", { fps: 10, qrbox: 250 });
        
        function onScanSuccess(decodedText, decodedResult) {
            document.getElementById('qrData').value = decodedText;
            document.getElementById('attendanceForm').submit();
        }
        
        html5QrcodeScanner.render(onScanSuccess);
    }
});
</script>