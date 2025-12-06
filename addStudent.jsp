<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    
    try {
        String checkSql = "SELECT * FROM students WHERE id = ?";
        PreparedStatement checkStmt = conn.prepareStatement(checkSql);
        checkStmt.setString(1, id);
        ResultSet rs = checkStmt.executeQuery();
        
        if (rs.next()) {
            out.println("<div class='message error'>Student ID already exists!</div>");
        } else {
            String sql = "INSERT INTO students (id, name, email) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);
            stmt.setString(2, name);
            stmt.setString(3, email);
            stmt.executeUpdate();
            out.println("<div class='message success'>Student added successfully!</div>");
        }
    } catch (Exception e) {
        out.println("<div class='message error'>Error: " + e.getMessage() + "</div>");
    }
}
%>

<div class="tab-content active">
    <h2>Add New Student</h2>
    <form method="post">
        <div class="form-group">
            <label for="id">Student ID:</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div class="form-group">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <button type="submit">Add Student</button>
    </form>
    
    <div class="student-list">
        <h3>Registered Students</h3>
        <%
        try {
            String sql = "SELECT * FROM students";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            if (!rs.isBeforeFirst()) {
                out.println("<p>No students registered yet.</p>");
            } else {
                out.println("<table>");
                out.println("<thead><tr><th>ID</th><th>Name</th><th>Email</th></tr></thead>");
                out.println("<tbody>");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("id") + "</td>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("</tr>");
                }
                out.println("</tbody></table>");
            }
        } catch (Exception e) {
            out.println("<p>Error retrieving students: " + e.getMessage() + "</p>");
        }
        %>
    </div>
</div>