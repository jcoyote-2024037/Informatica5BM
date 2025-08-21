package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet; // Importa esta anotación para la configuración del servlet
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import modelo.Constructoras;
import modelo.ConstructorasDAO;
import modelo.Propiedades;
import modelo.PropiedadesDAO;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"}) // Añade esta anotación
@MultipartConfig
public class Controlador extends HttpServlet {

    PropiedadesDAO propiedadDAO = new PropiedadesDAO();
    Propiedades propiedad = new Propiedades();
    int codPropiedad;

    ConstructorasDAO constructoraDAO = new ConstructorasDAO();
    Constructoras constructora = new Constructoras();
    int codConstructora;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu == null) {
            request.getRequestDispatcher("principal.jsp").forward(request, response);
            return;
        }

        try {
            if (menu.equals("Principal")) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else if (menu.equals("Propiedades")) {
                switch (accion) {
                    case "Listar":
                        List<Propiedades> listaPropiedades = propiedadDAO.listar();
                        request.setAttribute("propiedades", listaPropiedades);
                        request.getRequestDispatcher("propiedad.jsp").forward(request, response);
                        break;
                    case "Agregar":

                        String nombrep = request.getParameter("nombre-propiedad");
                        String preciop = request.getParameter("precio-propiedad");
                        String categoriap = request.getParameter("categoria-propiedad");
                        String ubicacionp = request.getParameter("ubicacion-propiedad");
                        int disponiblesp = Integer.parseInt(request.getParameter("disponibles-propiedad"));
                        propiedad.setNombrePropiedad(nombrep);
                        propiedad.setPrecio(new BigDecimal(preciop)); // 👈 conversión String -> BigDecimal
                        propiedad.setCategoria(categoriap);
                        propiedad.setUbicacion(ubicacionp);
                        propiedad.setDisponibles(disponiblesp);
                        propiedadDAO.agregarPr(propiedad);
                        request.getSession().setAttribute("mensaje", "Se agregó correctamente");

                        request.getRequestDispatcher("Controlador?menu=Propiedades&accion=Listar").forward(request, response);

                        break;
                    case "Editar":
                        int idEditar = Integer.parseInt(request.getParameter("codigoPropiedad"));
                        Propiedades propiedadSeleccionado = propiedadDAO.listarId(idEditar);
                        request.setAttribute("propiedadSeleccionado", propiedadSeleccionado);
                        List<Propiedades> listaPropiedadesEditar = propiedadDAO.listar();
                        request.setAttribute("propiedades", listaPropiedadesEditar);
                        request.getRequestDispatcher("propiedad.jsp").forward(request, response);
                        return;

                    case "Actualizar":
                        codPropiedad = Integer.parseInt(request.getParameter("codigoPropiedad"));
                        String nombrepr = request.getParameter("nombre-propiedad");
                        String preciopr = request.getParameter("precio-propiedad");
                        String categoriapr = request.getParameter("categoria-propiedad");
                        String ubicacionpr = request.getParameter("ubicacion-propiedad");
                        int stockpr = Integer.parseInt(request.getParameter("disponibles-propiedad"));
                        Propiedades propiedad = new Propiedades();
                        propiedad.setCodigoPropiedad(codPropiedad);
                        propiedad.setNombrePropiedad(nombrepr);
                        propiedad.setPrecio(new BigDecimal(preciopr));
                        propiedad.setCategoria(categoriapr);
                        propiedad.setUbicacion(ubicacionpr);
                        propiedad.setDisponibles(stockpr);
                        propiedadDAO.actualizar(propiedad);

                        request.getSession().setAttribute("mensaje", "Se actualizó correctamente");
                        request.getRequestDispatcher("Controlador?menu=Propiedades&accion=Listar").forward(request, response);
                        break;
                    case "Eliminar":
                        codPropiedad = Integer.parseInt(request.getParameter("codigoPropiedad"));
                        propiedadDAO.eliminar(codPropiedad);
                        request.getRequestDispatcher("Controlador?menu=Propiedades&accion=Listar").forward(request, response);
                        break;

                    case "Buscar":
                        String idParam = request.getParameter("id");
                        if (idParam != null && !idParam.isEmpty()) {
                            try {
                                int idBuscar = Integer.parseInt(idParam);
                                Propiedades propiedadEncontrada = propiedadDAO.listarId(idBuscar);
                                List<Propiedades> listaEncontrada = new ArrayList<>();
                                if (propiedadEncontrada != null && propiedadEncontrada.getCodigoPropiedad() != null) {
                                    listaEncontrada.add(propiedadEncontrada);
                                }
                                request.setAttribute("propiedades", listaEncontrada);
                            } catch (NumberFormatException e) {
                                request.setAttribute("propiedades", propiedadDAO.listar());
                            }
                        } else {
                            request.setAttribute("propiedades", propiedadDAO.listar());
                        }
                        request.getRequestDispatcher("propiedad.jsp").forward(request, response);
                        break;
                    default:
                }
            }else if (menu.equals("Constructoras")) {
                switch (accion) {
                    case "Listar":
                        List<Constructoras> listaConstructoras = constructoraDAO.listar();
                        request.setAttribute("constructoras", listaConstructoras);
                        request.getRequestDispatcher("constructora.jsp").forward(request, response);
                        break;
                    case "Agregar":

                        String nombrec = request.getParameter("nombre-constructora");
                        String telefonoc = request.getParameter("telefono-constructora");
                        String correoc = request.getParameter("correo-constructora");
                        String direccionc = request.getParameter("direccion-constructora");
                        constructora.setNombreConstructora(nombrec);
                        constructora.setTelefonoConstructora( telefonoc); // 👈 conversión String -> BigDecimal
                        constructora.setCorreoConstructora(correoc);
                        constructora.setDireccionConstructora(direccionc);
                        constructoraDAO.agregarCr(constructora);
                        request.getSession().setAttribute("mensaje", "Se agregó correctamente");

                        request.getRequestDispatcher("Controlador?menu=Constructoras&accion=Listar").forward(request, response);

                        break;
                    case "Editar":
                        int idEditar = Integer.parseInt(request.getParameter("codigoConstructora"));
                        Constructoras constructoraSeleccionado = constructoraDAO.listarId(idEditar);
                        request.setAttribute("constructoraSeleccionado", constructoraSeleccionado);
                        List<Constructoras> listaConstructorasEditar = constructoraDAO.listar();
                        request.setAttribute("constructoras", listaConstructorasEditar);
                        request.getRequestDispatcher("constructora.jsp").forward(request, response);
                        return;

                    case "Actualizar":
                        codConstructora = Integer.parseInt(request.getParameter("codigoConstructora"));
                        String nombrecr = request.getParameter("nombre-constructora");
                        String telefonocr = request.getParameter("telefono-constructora");
                        String correocr = request.getParameter("correo-constructora");
                        String direccioncr = request.getParameter("direccion-constructora");
                        Constructoras constructora = new Constructoras();
                        constructora.setCodigoConstructora(codConstructora);
                        constructora.setNombreConstructora(nombrecr);
                        constructora.setTelefonoConstructora(telefonocr);
                        constructora.setCorreoConstructora(correocr);
                        constructora.setDireccionConstructora(direccioncr);
                       constructoraDAO.actualizar(constructora);

                        request.getSession().setAttribute("mensaje", "Se actualizó correctamente");
                        request.getRequestDispatcher("Controlador?menu=Constructoras&accion=Listar").forward(request, response);
                        break;
                    case "Eliminar":
                        codConstructora = Integer.parseInt(request.getParameter("codigoConstructora"));
                        constructoraDAO.eliminar(codConstructora);
                        request.getRequestDispatcher("Controlador?menu=Constructoras&accion=Listar").forward(request, response);
                        break;

                    case "Buscar":
                        String idParam = request.getParameter("id");
                        if (idParam != null && !idParam.isEmpty()) {
                            try {
                                int idBuscar = Integer.parseInt(idParam);
                                Constructoras constructoraEncontrada = constructoraDAO.listarId(idBuscar);
                                List<Constructoras> listaEncontrada = new ArrayList<>();
                                if (constructoraEncontrada != null && constructoraEncontrada.getCodigoConstructora() != null) {
                                    listaEncontrada.add(constructoraEncontrada);
                                }
                                request.setAttribute("constructoras", listaEncontrada);
                            } catch (NumberFormatException e) {
                                request.setAttribute("constructoras", constructoraDAO.listar());
                            }
                        } else {
                            request.setAttribute("constructoras", constructoraDAO.listar());
                        }
                        request.getRequestDispatcher("constructora.jsp").forward(request, response);
                        break;
                    default:
                        break;
                }
            }
        } catch (Exception e) {
            System.out.println("Error en el controlador: " + e.getMessage());
            e.printStackTrace();
            // Puedes añadir una redirección a una página de error o mostrar un mensaje
            // request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador para gestionar propiedades y constructoras.";
    }
}
