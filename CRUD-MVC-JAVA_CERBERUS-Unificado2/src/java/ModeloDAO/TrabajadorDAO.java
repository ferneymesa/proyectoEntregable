package ModeloDAO;

import Config.Conexion;
import Modelo.Trabajador;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import Interfaces.CRUDTrabajador;

public class TrabajadorDAO implements CRUDTrabajador {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Trabajador p = new Trabajador();

    @Override
    public List listarRH() {
        ArrayList<Trabajador> list = new ArrayList<>();
        String sql = "select * from trabajador";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Trabajador recursoH = new Trabajador();
                recursoH.setIdRH(rs.getInt("IdRH"));
                recursoH.setDocumentoRH(rs.getString("DocumentoRH"));
                recursoH.setNombreRH(rs.getString("NombreRH"));
                recursoH.setTelefonoRH(rs.getString("TelefonoRH"));
                list.add(recursoH);
            }
        } catch (Exception e) {
            System.out.println("Error al Listar: " + e);
        }
        return list;
    }

    @Override
    public boolean addRH(Trabajador recursoH) {
        String sql = "insert into trabajador(DocumentoRH,NombreRH,TelefonoRH) values('"
                + recursoH.getDocumentoRH() + "','" + recursoH.getNombreRH() + "','" + recursoH.getTelefonoRH() + "')";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Agregar(PersonaDAO): " + e);
        }
        return false;
    }

    @Override
    public Trabajador listRH(int idRH) {
        String sql = "select * from trabajador where IdRH=" + idRH;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                p.setIdRH(rs.getInt("IdRH"));
                p.setDocumentoRH(rs.getString("DocumentoRH"));
                p.setNombreRH(rs.getString("NombreRH"));
                p.setTelefonoRH(rs.getString("TelefonoRH"));
                System.out.println("Modificando Persona: " + p.getDocumentoRH());
            }
        } catch (SQLException e) {
            System.out.println("Error al listar (PesonaDAO) en metodo List: " + e);
        }
        return p;
    }

    @Override
    public boolean eliminarRH(int idRH) {
        String sql = "delete from trabajador where IdRH=" + idRH;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Eliminar (productoDAO): " + e);
        }
        return false;
    }

    @Override
    public boolean editRH(Trabajador recursoH) {
        String sql = "update trabajador set DocumentoRH='" + recursoH.getDocumentoRH()
                + "', NombreRH='" + recursoH.getNombreRH() + "', TelefonoRH='" + recursoH.getTelefonoRH() + "'  where IdRH=" + recursoH.getIdRH();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al Actualizar (edit) (productoDAO): " + e);
        }
        return false;
    }

    @Override
    public Trabajador buscarPorDocumentoRH(String DocumentoRH) {
        String sql = "SELECT * FROM trabajador WHERE DocumentoRH = ?";
        Trabajador recursoH = null;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, DocumentoRH);
            rs = ps.executeQuery();

            if (rs.next()) {
                recursoH = new Trabajador();
                recursoH.setIdRH(rs.getInt("IdRH"));
                recursoH.setDocumentoRH(rs.getString("DocumentoRH"));
                recursoH.setNombreRH(rs.getString("NombreRH"));
                recursoH.setTelefonoRH(rs.getString("TelefonoRH"));
                
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar por DNI: " + e);
        }
        return recursoH;
    }

}
