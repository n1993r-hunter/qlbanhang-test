<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dal.VatTuDAO" %>
<%
    String maVTu = request.getParameter("maVTu");
    if (maVTu != null && !maVTu.isEmpty()) {
        VatTuDAO dao = new VatTuDAO();
        boolean isDeleted = dao.delete(maVTu);
        
        if (isDeleted) {
            response.sendRedirect("index.jsp");
        } else {
            // Hiển thị thông báo bằng JavaScript nếu không thể xóa (do dính khóa ngoại CTDONDH)
            out.println("<script>");
            out.println("alert('Không thể xóa! Vật tư này đã có trong Chi tiết Đơn đặt hàng.');");
            out.println("window.location.href = 'index.jsp';");
            out.println("</script>");
        }
    }
%>