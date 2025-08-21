
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
@Table(name = "Constructoras")
public class Constructoras implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigoConstructora")
    private Integer codigoConstructora;

    @Column(name = "nombreConstructora")
    private String nombreConstructora;
    
    @Column(name = "telefonoConstructora")
    private String telefonoConstructora;
    
    @Column(name = "correoConstructora")
    private String correoConstructora;
    
    @Column(name = "direccionConstructora")
    private String direccionConstructora;

    public Constructoras() {
    }

    
    
    
    public Integer getCodigoConstructora() {
        return codigoConstructora;
    }

    public void setCodigoConstructora(Integer codigoConstructora) {
        this.codigoConstructora = codigoConstructora;
    }

    public String getNombreConstructora() {
        return nombreConstructora;
    }

    public void setNombreConstructora(String nombreConstructora) {
        this.nombreConstructora = nombreConstructora;
    }

    public String getTelefonoConstructora() {
        return telefonoConstructora;
    }

    public void setTelefonoConstructora(String telefonoConstructora) {
        this.telefonoConstructora = telefonoConstructora;
    }

    public String getCorreoConstructora() {
        return correoConstructora;
    }

    public void setCorreoConstructora(String correoConstructora) {
        this.correoConstructora = correoConstructora;
    }

    public String getDireccionConstructora() {
        return direccionConstructora;
    }

    public void setDireccionConstructora(String direccionConstructora) {
        this.direccionConstructora = direccionConstructora;
    }

    @Override
    public String toString() {
        return "Constructoras{" + "codigoConstructora=" + codigoConstructora + ", nombreConstructora=" + nombreConstructora + ", telefonoConstructora=" + telefonoConstructora + ", correoConstructora=" + correoConstructora + ", direccionConstructora=" + direccionConstructora + '}';
    }
    
    
    
    
}