<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.VatTu" %>
<%@ page import="dal.VatTuDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý vật tư</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

    <div class="table-container" style="width: 100%; max-width: 1000px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1);">
        
        <h2 style="margin-top: 0;">Danh mục Vật tư</h2>

        <div class="header-actions">
            <a href="add.jsp" class="btn">+ Thêm vật tư mới</a>
            
            <form action="search.jsp" method="get" class="search-box">
                <input type="text" name="keyword" placeholder="Nhập tên hoặc phần trăm..." required>
                <button type="submit" class="btn">Tìm kiếm</button>
            </form>
        </div>

        <table>
            <thead>
                <tr>
                    <th>Mã VT</th>
                    <th>Tên vật tư</th>
                    <th>Đơn vị tính</th>
                    <th>Phần trăm</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Mã Java nhúng trong JSP để gọi DAO và lấy dữ liệu
                    dal.VatTuDAO dao = new dal.VatTuDAO();
                    java.util.List<model.VatTu> danhSach = dao.getAll();
                    
                    if(danhSach != null) {
                        for(model.VatTu vt : danhSach) {
                %>
                <tr>
                    <td><%= vt.getMaVTu() %></td>
                    <td><%= vt.getTenVTu() %></td>
                    <td><%= vt.getDvTinh() %></td>
                    <td><%= vt.getPhanTram() %> %</td>
                    <td>
                        <a href="update.jsp?maVTu=<%= vt.getMaVTu() %>" class="btn btn-edit">Sửa</a>
                        <a href="delete.jsp?maVTu=<%= vt.getMaVTu() %>" class="btn btn-delete" onclick="return confirm('Bạn có chắc chắn muốn xóa vật tư này?');">Xóa</a>
                    </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        
    </div> </body>
</html>