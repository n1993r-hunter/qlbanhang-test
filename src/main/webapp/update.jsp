<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dal.VatTuDAO" %>
<%@ page import="model.VatTu" %>
<%
    String maVTu = request.getParameter("maVTu");
    VatTuDAO dao = new VatTuDAO();
    VatTu vt = dao.getById(maVTu);
    
    // Nếu người dùng nhấn nút Cập nhật
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String tenVTu = request.getParameter("tenVTu");
        String dvTinh = request.getParameter("dvTinh");
        float phanTram = Float.parseFloat(request.getParameter("phanTram"));

        VatTu vtUpdate = new VatTu(maVTu, tenVTu, dvTinh, phanTram);
        if (dao.update(vtUpdate)) {
            response.sendRedirect("index.jsp");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa Vật Tư</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="form-container">
        
        <h2 style="text-align: center; margin-top: 0;">Chỉnh Sửa Vật Tư</h2>
        
        <form method="POST" action="update.jsp?maVTu=<%= maVTu %>">
            <div class="form-group">
                <label>Mã Vật Tư (Không thể sửa):</label>
                <input type="text" value="<%= vt.getMaVTu() %>" disabled>
            </div>
            <div class="form-group">
                <label>Tên Vật Tư:</label>
                <input type="text" name="tenVTu" value="<%= vt.getTenVTu() %>" required>
            </div>
            <div class="form-group">
                <label>Đơn Vị Tính:</label>
                <input type="text" name="dvTinh" value="<%= vt.getDvTinh() %>">
            </div>
            <div class="form-group">
                <label>Phần Trăm (%):</label>
                <input type="number" name="phanTram" step="0.1" value="<%= vt.getPhanTram() %>" required>
            </div>
            <button type="submit" class="btn">Cập Nhật</button>
            <a href="index.jsp" style="margin-left: 10px; text-decoration: none; color: #555;">Hủy</a>
        </form>
    </div>
</body>
</html>