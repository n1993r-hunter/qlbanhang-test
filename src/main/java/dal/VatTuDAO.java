package dal;

import java.sql.*;
import java.util.*;
import model.VatTu;

public class VatTuDAO {
    
    // Lấy toàn bộ danh sách vật tư
    public List<VatTu> getAll() {
        List<VatTu> list = new ArrayList<>();
        String sql = "SELECT * FROM VATTU";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new VatTu(
                    rs.getString("MaVTu"),
                    rs.getString("TenVTu"),
                    rs.getString("DvTinh"),
                    rs.getFloat("PhanTram")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Kiểm tra MaVTu đã tồn tại chưa
    public boolean isMaVTuExists(String maVTu) {
        String sql = "SELECT COUNT(*) FROM VATTU WHERE MaVTu = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, maVTu);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1) > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    // Thêm vật tư mới
    public boolean add(VatTu vt) {
        String sql = "INSERT INTO VATTU VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, vt.getMaVTu());
            ps.setString(2, vt.getTenVTu());
            ps.setString(3, vt.getDvTinh());
            ps.setFloat(4, vt.getPhanTram());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    // Cập nhật vật tư
    public boolean update(VatTu vt) {
        String sql = "UPDATE VATTU SET TenVTu=?, DvTinh=?, PhanTram=? WHERE MaVTu=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, vt.getTenVTu());
            ps.setString(2, vt.getDvTinh());
            ps.setFloat(3, vt.getPhanTram());
            ps.setString(4, vt.getMaVTu());
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    // Xóa vật tư (kiểm tra có trong CTDONDH không)
    public boolean delete(String maVTu) {
        // Kiểm tra có trong CTDONDH không
        String check = "SELECT COUNT(*) FROM CTDONDH WHERE MaVTu = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(check)) {
            ps.setString(1, maVTu);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) return false; // không cho xóa
        } catch (Exception e) { e.printStackTrace(); }

        String sql = "DELETE FROM VATTU WHERE MaVTu = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, maVTu);
            return ps.executeUpdate() > 0;
        } catch (Exception e) { e.printStackTrace(); }
        return false;
    }

    // Tìm kiếm theo TenVTu hoặc PhanTram
    public List<VatTu> search(String keyword) {
        List<VatTu> list = new ArrayList<>();
        String sql = "SELECT * FROM VATTU WHERE TenVTu LIKE ? OR CAST(PhanTram AS NVARCHAR) LIKE ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new VatTu(
                    rs.getString("MaVTu"),
                    rs.getString("TenVTu"),
                    rs.getString("DvTinh"),
                    rs.getFloat("PhanTram")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Lấy 1 vật tư theo MaVTu
    public VatTu getById(String maVTu) {
        String sql = "SELECT * FROM VATTU WHERE MaVTu = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, maVTu);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return new VatTu(
                rs.getString("MaVTu"),
                rs.getString("TenVTu"),
                rs.getString("DvTinh"),
                rs.getFloat("PhanTram")
            );
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
}