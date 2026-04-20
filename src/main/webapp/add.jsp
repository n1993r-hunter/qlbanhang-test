<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dal.VatTuDAO" %>
<%@ page import="model.VatTu" %>
<%
    String errorMsg = "";
    // Xử lý khi người dùng bấm nút Submit (gửi dữ liệu qua phương thức POST)
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String maVTu = request.getParameter("maVTu");
        String tenVTu = request.getParameter("tenVTu");
        String dvTinh = request.getParameter("dvTinh");
        float phanTram = Float.parseFloat(request.getParameter("phanTram"));

        VatTuDAO dao = new VatTuDAO();
        // Kiểm tra mã vật tư không trùng theo yêu cầu đề bài
        if (dao.isMaVTuExists(maVTu)) {
            errorMsg = "Mã vật tư này đã tồn tại. Vui lòng nhập mã khác!";
        } else {
            VatTu vt = new VatTu(maVTu, tenVTu, dvTinh, phanTram);
            if (dao.add(vt)) {
                // Nếu thêm thành công, chuyển hướng về trang chủ
                response.sendRedirect("index.jsp");
                return;
            } else {
                errorMsg = "Có lỗi xảy ra, không thể thêm vật tư!";
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Vật Tư</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
    <div class="form-container">
        
        <h2 style="text-align: center; margin-top: 0;">Thêm Vật Tư Mới</h2>

        <% if (!errorMsg.isEmpty()) { %>
            <div class="error"><%= errorMsg %></div>
        <% } %>
        
        <form method="POST" action="add.jsp">
            <div class="form-group">
                <label>Mã Vật Tư:</label>
                <input type="text" name="maVTu" required maxlength="4">
            </div>
            <div class="form-group">
                <label>Tên Vật Tư:</label>
                <input type="text" name="tenVTu" required>
            </div>
            <div class="form-group">
                <label>Đơn Vị Tính:</label>
                <input type="text" name="dvTinh">
            </div>
            <div class="form-group">
                <label>Phần Trăm (%):</label>
                <input type="number" name="phanTram" step="0.1" min="0" max="100" required>
            </div>
            <button type="submit" class="btn">Lưu Vật Tư</button>
            <a href="index.jsp" style="margin-left: 10px;">Hủy</a>
        </form>
    </div>
</body>
</html>