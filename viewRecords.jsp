<div class="tab-content">
    <h2>Attendance Records</h2>
    
    <div class="filters">
        <form method="get">
            <input type="hidden" name="tab" value="viewRecords">
            <div class="form-group">
                <label for="date">Filter by Date:</label>
                <input type="date" id="date" name="date" value="<%= request.getParameter("date") != null ? request.getParameter("date") : "" %>">
            </div>
            <div class="form-group">
                <label for="student">Filter by Student:</label>
                <select id="student" name="student">
                    <option value="">All Students</option>
                    <%
                    try {
                        String sql = "SELECT * FROM students";
                        Statement stmt = conn.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);
                        
                        while (rs.next()) {
                            String selected = rs.getString("id").equals(request.getParameter("student")) ? "selected" : "";
                            out.println("<option value='" + rs.getString("id") + "' " + selected + ">" + 
                                       rs.getString("id") + " - " + rs.getString("name") + "</option>");
                        }
                    } catch (Exception e) {
                        out.println("<option value=''>Error loading students</option>");
                    }
                    %>
                </select>
            </div>
            <button type="submit">Apply Filters</button>
        </form>
    </div>
    
    <div class="student-list">
        <%
        try {
            String sql = "SELECT a.*, s.name FROM attendance a JOIN students s ON a.student_id = s.id WHERE 1=1";
            
            if (request.getParameter("date") != null && !request.getParameter("date").isEmpty()) {
                sql += " AND DATE(a.timestamp) = '" + request.getParameter("date") + "'";
            }
            
            if (request.getParameter("student") != null && !request.getParameter("student").isEmpty()) {
                sql += " AND a.student_id = '" + request.getParameter("student") + "'";
            }
            
            sql += " ORDER BY a.timestamp DESC";
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if (!rs.isBeforeFirst()) {
                out.println("<p>No attendance records found.</p>");
            } else {
                out.println("<table>");
                out.println("<thead><tr><th>Student ID</th><th>Name</th><th>Date</th><th>Time</th></tr></thead>");
                out.println("<tbody>");
                while (rs.next()) {
                    java.sql.Timestamp timestamp = rs.getTimestamp("timestamp");
                    java.util.Date date = new java.util.Date(timestamp.getTime());
                    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    java.text.SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("HH:mm:ss");
                    
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("student_id") + "</td>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + dateFormat.format(date) + "</td>");
                    out.println("<td>" + timeFormat.format(date) + "</td>");
                    out.println("</tr>");
                }
                out.println("</tbody></table>");
            }
        } catch (Exception e) {
            out.println("<p>Error retrieving attendance records: " + e.getMessage() + "</p>");
        }
        %>
    </div>
</div>