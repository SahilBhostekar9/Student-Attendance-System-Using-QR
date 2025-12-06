<div class="tab-content">
    <h2>Generate Student QR Code</h2>
    <form onsubmit="generateQRCode(); return false;">
        <div class="form-group">
            <label for="studentSelect">Select Student:</label>
            <select id="studentSelect" required>
                <option value="">-- Select Student --</option>
                <%
                try {
                    String sql = "SELECT * FROM students";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    
                    while (rs.next()) {
                        String value = rs.getString("id") + "|" + rs.getString("name");
                        out.println("<option value='" + value + "'>" + 
                                   rs.getString("id") + " - " + rs.getString("name") + "</option>");
                    }
                } catch (Exception e) {
                    out.println("<option value=''>Error loading students</option>");
                }
                %>
            </select>
        </div>
        <button type="submit">Generate QR Code</button>
    </form>
    
    <div class="qr-container">
        <div id="qrcode"></div>
    </div>
</div>

<script>
function generateQRCode() {
    var studentData = document.getElementById("studentSelect").value;
    if (studentData) {
        document.getElementById("qrcode").innerHTML = "";
        var qrcode = new QRCode(document.getElementById("qrcode"), {
            text: studentData,
            width: 200,
            height: 200,
            colorDark : "#000000",
            colorLight : "#ffffff",
            correctLevel : QRCode.CorrectLevel.H
        });
    }
}
</script>