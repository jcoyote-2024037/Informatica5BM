package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PropiedadesDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int resp;

    public List<Propiedades> listar() {
        String sql = "{call sp_ListarPropiedades()}";
        List<Propiedades> listaPropiedades = new ArrayList<>();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Propiedades pr = new Propiedades();
                pr.setCodigoPropiedad(rs.getInt(1));
                pr.setNombrePropiedad(rs.getString(2));
                pr.setPrecio(rs.getBigDecimal(3));
                pr.setCategoria(rs.getString(4));
                pr.setUbicacion(rs.getString(5));
                pr.setDisponibles(rs.getInt(6));
                listaPropiedades.add(pr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaPropiedades;

    }

     public int agregarPr(Propiedades pr) {
        String sql = "{call sp_AgregarPropiedad(?,?,?,?,?)}";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pr.getNombrePropiedad());
            ps.setBigDecimal(2, pr.getPrecio());
            ps.setString(3, pr.getCategoria());
             ps.setString(4, pr.getUbicacion());
            ps.setInt(5, pr.getDisponibles());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resp;
    }
     
     public Propiedades listarCodigoPropiedad(int id) {
        Propiedades pr = new Propiedades();
        String sql = "{call sp_BuscarPropiedad(?)}";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                pr.setNombrePropiedad((rs.getString(2)));
                pr.setPrecio(rs.getBigDecimal(3));
                pr.setCategoria(rs.getString(4));
                pr.setUbicacion(rs.getString(5));
                pr.setDisponibles(rs.getInt(6));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pr;
    }
     
   public int actualizar(Propiedades pr) {
        // Llama al procedimiento almacenado sp_EditarJuguete con 7 parámetros.
        // El orden de los parámetros en el PreparedStatement debe coincidir
        // con el orden definido en el procedimiento almacenado.
        String sql = "{call sp_EditarPropiedad(?,?,?,?,?,?)}"; 
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pr.getCodigoPropiedad()); 
            ps.setString(2, pr.getNombrePropiedad()); 
            ps.setBigDecimal(3, pr.getPrecio()); 
            ps.setString(4, pr.getCategoria()); 
            ps.setString(5, pr.getUbicacion()); 
            ps.setInt(6, pr.getDisponibles());
            ps.executeUpdate();
            resp = 1;
        } catch (SQLException e) {
            e.printStackTrace();
            resp = 0; 
        } 
        return resp;
    }

    public void eliminar(int id) {
        String sql = "call sp_EliminarPropiedad(?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Propiedades listarId(int id) {
        String sql = "{call sp_BuscarPropiedad(?)}";
        Propiedades pr = new Propiedades();
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                pr.setCodigoPropiedad(rs.getInt(1));
                pr.setNombrePropiedad((rs.getString(2)));
                pr.setPrecio(rs.getBigDecimal(3));
                pr.setCategoria(rs.getString(4));
                pr.setUbicacion(rs.getString(5));
                pr.setDisponibles(rs.getInt(6));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pr;
    }
}
