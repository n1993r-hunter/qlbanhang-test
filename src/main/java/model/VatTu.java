package model;

public class VatTu {
    private String maVTu, tenVTu, dvTinh;
    private float phanTram;

    public VatTu(String maVTu, String tenVTu, String dvTinh, float phanTram) {
        this.maVTu = maVTu;
        this.tenVTu = tenVTu;
        this.dvTinh = dvTinh;
        this.phanTram = phanTram;
    }

    public String getMaVTu() { return maVTu; }
    public String getTenVTu() { return tenVTu; }
    public String getDvTinh() { return dvTinh; }
    public float getPhanTram() { return phanTram; }

    public void setMaVTu(String maVTu) { this.maVTu = maVTu; }
    public void setTenVTu(String tenVTu) { this.tenVTu = tenVTu; }
    public void setDvTinh(String dvTinh) { this.dvTinh = dvTinh; }
    public void setPhanTram(float phanTram) { this.phanTram = phanTram; }
}