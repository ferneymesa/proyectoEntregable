package Modelo;

public class Trabajador {
    int idRH;
    String documentoRH;
    String nombreRH;
    String telefonoRH;

    public Trabajador() {
    }

    public Trabajador(String documentoRH, String nombreRH, String telefonoRH) {
        this.documentoRH = documentoRH;
        this.nombreRH = nombreRH;
        this.telefonoRH = telefonoRH;
    }

    public int getIdRH() {
        return idRH;
    }

    public void setIdRH(int idRH) {
        this.idRH = idRH;
    }

    public String getDocumentoRH() {
        return documentoRH;
    }

    public void setDocumentoRH(String documentoRH) {
        this.documentoRH = documentoRH;
    }

    public String getNombreRH() {
        return nombreRH;
    }

    public void setNombreRH(String nombreRH) {
        this.nombreRH = nombreRH;
    }

    public String getTelefonoRH() {
        return telefonoRH;
    }

    public void setTelefonoRH(String telefonoRH) {
        this.telefonoRH = telefonoRH;
    }

}