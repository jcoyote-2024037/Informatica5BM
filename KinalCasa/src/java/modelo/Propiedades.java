
package modelo;
import java.io.Serializable;
import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Propiedades")
public class Propiedades implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigoPropiedad")
    private Integer codigoPropiedad;

    @Column(name = "nombrePropiedad")
    private String nombrePropiedad;

    @Column(name = "precio")
    private BigDecimal precio;
    
    @Column(name = "categoria")
    private String categoria;
    
    @Column(name = "ubicacion")
    private String ubicacion;
    
    @Column(name = "disponibles")
    private Integer disponibles;

    public Propiedades() {
    }

    public Integer getCodigoPropiedad() {
        return codigoPropiedad;
    }

    public void setCodigoPropiedad(Integer codigoPropiedad) {
        this.codigoPropiedad = codigoPropiedad;
    }

    public String getNombrePropiedad() {
        return nombrePropiedad;
    }

    public void setNombrePropiedad(String nombrePropiedad) {
        this.nombrePropiedad = nombrePropiedad;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public Integer getDisponibles() {
        return disponibles;
    }

    public void setDisponibles(Integer disponibles) {
        this.disponibles = disponibles;
    }

    @Override
    public String toString() {
        return "Propiedades{" + "codigoPropiedad=" + codigoPropiedad + ", nombrePropiedad=" + nombrePropiedad + ", precio=" + precio + ", categoria=" + categoria + ", ubicacion=" + ubicacion + ", disponibles=" + disponibles + '}';
    }
    
    
    
}