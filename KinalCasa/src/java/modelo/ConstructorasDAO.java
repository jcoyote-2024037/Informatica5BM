package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ConstructorasDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<Constructoras> listar() {
        String sql = "{call sp_ListarConstructoras()}";
        List<Constructoras> listaConstructoras = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Constructoras cr = new Constructoras();
                cr.setCodigoConstructora(rs.getInt(1));
                cr.setNombreConstructora(rs.getString(2));
                cr.setTelefonoConstructora(rs.getString(3));
                cr.setCorreoConstructora(rs.getString(4));
                cr.setDireccionConstructora(rs.getString(5));
                listaConstructoras.add(cr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaConstructoras;

    }

     public int agregarCr(Constructoras cr) {
        String sql = "{call sp_AgregarConstructora(?,?,?,?)}";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cr.getNombreConstructora());
            ps.setString(2, cr.getTelefonoConstructora());
            ps.setString(3, cr.getCorreoConstructora());
             ps.setString(4, cr.getDireccionConstructora());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
     
     public Constructoras listarCodigoPropiedad(int id) {
        Constructoras cr = new Constructoras();
        String sql = "{call sp_BuscarConstructora(?)}";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cr.setNombreConstructora((rs.getString(2)));
                cr.setTelefonoConstructora(rs.getString(3));
                cr.setCorreoConstructora(rs.getString(4));
                cr.setDireccionConstructora(rs.getString(5));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cr;
    }
     
   public int actualizar(Constructoras cr) {
        // Llama al procedimiento almacenado sp_EditarJuguete con 7 parámetros.
        // El orden de los parámetros en el PreparedStatement debe coincidir
        // con el orden definido en el procedimiento almacenado.
        String sql = "{call sp_EditarConstructora(?,?,?,?,?)}"; 
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, cr.getCodigoConstructora()); 
            ps.setString(2, cr.getNombreConstructora()); 
            ps.setString(3, cr.getTelefonoConstructora()); 
            ps.setString(4, cr.getCorreoConstructora()); 
            ps.setString(5, cr.getDireccionConstructora()); 
            ps.executeUpdate();
            resp = 1;
        } catch (SQLException e) {
            e.printStackTrace();
            resp = 0; 
        } 
        return resp;
    }

    public void eliminar(int id) {
        String sql = "call sp_EliminarConstructora(?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Constructoras listarId(int id) {
        String sql = "{call sp_BuscarConstructora(?)}";
        Constructoras cr = new Constructoras();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                cr.setCodigoConstructora(rs.getInt(1));
                cr.setNombreConstructora((rs.getString(2)));
                cr.setTelefonoConstructora(rs.getString(3));
                cr.setCorreoConstructora(rs.getString(4));
                cr.setDireccionConstructora(rs.getString(5));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cr;
    }
}
