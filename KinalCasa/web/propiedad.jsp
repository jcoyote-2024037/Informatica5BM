<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kinal Toy's (Propiedades)</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link rel="icon" href="img/kinal toys.png">
        <!-- CSS personalizado -->
        <link rel="stylesheet" href="css/principal.css">
        <link rel="stylesheet" href="css/crud-bootstrap.css">
        <link rel="stylesheet" href="css/administrador.css">
        <link rel="stylesheet" href="css/index.css">
    </head>

    <header>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <div class="customer-support d-none d-lg-flex">
                    <i class="fa-solid fa-headset"></i>
                    <div>
                        <div class="fw-bold">Llama al Gerente</div>
                        <small>502-3110-0319</small>
                    </div>
                </div>

                <a class="navbar-brand mx-auto" href="/">KinalCasa</a>

                <!-- User menu -->
                <div class="dropdown">
                    <div class="customer-support d-none d-lg-flex">
                        <i class="fa-solid fa-headset"></i>
                        <div>
                            <div class="fw-bold">Cuenta Administrador</div>
                        </div>
                    </div> 
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="cuenta-admin.jsp"><i class="fas fa-user me-2"></i>Mi Perfil</a></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-exchange-alt me-2"></i>Cambiar Cuenta</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="Controlador?menu=Salir"><i class="fa-solid fa-right-from-bracket me-2"></i>Salir</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Navegación secundaria -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
            <div class="container">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav mx-auto">
                        <li class="nav-item">
                            <a class="nav-link fw-bold" href="Controlador?menu=Principal"></i>Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fw-bold" href="Controlador?menu=Propiedades&accion=Listar"></i>Propiedades</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link fw-bold" href="Controlador?menu=Constructoras&accion=Listar"></i>Constructoras</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>


    <body>   
        <main class="main-users py-5">
            <div class="container">
                <!-- Título -->
                <div class="row mb-5">
                    <div class="col-12 text-center">
                        <h1 class="users-title">Propiedades</h1>
                    </div>
                </div>

                <!-- Formulario -->
                <div class="row mb-5">
                    <div class="col-12">
                        <div class="card shadow-sm border-0 users-form-card">
                            <div class="card-header bg-primary text-white">
                                <h5 class="card-title mb-0">Gestión de Propiedades</h5>
                            </div>
                            <div class="card-body p-4">
                                <form id="form-propiedad" action="Controlador" method="POST">
                                    <input type="hidden" name="menu" value="Propiedades"/>
                                    <input type="hidden" name="codigoPropiedad" value="${propiedadSeleccionado.codigoPropiedad}"/>

                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="text" 
                                                       class="form-control" 
                                                       id="nombre-propiedad" 
                                                       name="nombre-propiedad" 
                                                       placeholder="Casa en Condominio" 
                                                       value="${propiedadSeleccionado.nombrePropiedad}"
                                                       required />
                                                <label for="nombre-propiedad">Nombre de la Propiedad</label>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="number" 
                                                       step="0.01" 
                                                       class="form-control" 
                                                       id="precio-propiedad" 
                                                       name="precio-propiedad" 
                                                       placeholder="150000.00" 
                                                       value="${propiedadSeleccionado.precio}"
                                                       required />
                                                <label for="precio-propiedad">Precio</label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="text" 
                                                       class="form-control" 
                                                       id="categoria-propiedad" 
                                                       name="categoria-propiedad" 
                                                       placeholder="Residencial" 
                                                       value="${propiedadSeleccionado.categoria}"
                                                       required />
                                                <label for="categoria-propiedad">Categoría</label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="text" 
                                                       class="form-control" 
                                                       id="ubicacion-propiedad" 
                                                       name="ubicacion-propiedad" 
                                                       placeholder="Zona 15" 
                                                       value="${propiedadSeleccionado.ubicacion}"
                                                       required />
                                                <label for="ubicacion-propiedad">Ubicación</label>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-floating">
                                                <input type="number" 
                                                       class="form-control" 
                                                       id="disponibles-propiedad" 
                                                       name="disponibles-propiedad" 
                                                       placeholder="5" 
                                                       value="${propiedadSeleccionado.disponibles}"
                                                       required />
                                                <label for="disponibles-propiedad">Disponibles</label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Botones -->
                                    <div class="d-flex gap-2 justify-content-end mt-4 pt-3 border-top">
                                        <button type="submit" 
                                                form="form-propiedad" 
                                                name="accion" 
                                                value="Agregar" 
                                                class="btn btn-success btn-lg">
                                            Agregar Propiedad
                                        </button>
                                        <button type="submit" 
                                                form="form-propiedad" 
                                                name="accion" 
                                                value="Actualizar" 
                                                class="btn btn-warning btn-lg">
                                            Actualizar Propiedad
                                        </button>
                                    </div>
                                </form>


                                <div class="search-container">
                                    <form class="search-form" action="Controlador" method="POST">
                                        <input type="hidden" name="menu" value="Propiedades" />
                                        <div class="search-buttons">
                                            <button class="btn-crud" name="accion" value="Buscar">Buscar</button>
                                            <input type="text" class="input-search" placeholder="Buscar por ID..." name="id" />
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Tabla -->
                <div class="row">
                    <div class="col-12">
                        <div class="card shadow-sm border-0">
                            <div class="card-header bg-secondary text-white">
                                <h5 class="card-title mb-0">Lista de Propiedades</h5>
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-hover table-striped mb-0">
                                        <thead class="table-dark">
                                            <tr>
                                                <th scope="col">Código</th>
                                                <th scope="col">Nombre</th>
                                                <th scope="col">Precio</th>
                                                <th scope="col">Categoría</th>
                                                <th scope="col">Ubicación</th>
                                                <th scope="col">Disponibles</th>
                                                <th scope="col" class="text-center">Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody id="detalle-propiedad">
                                            <c:forEach var="propiedad" items="${propiedades}">
                                                <tr>
                                                    <td>${propiedad.getCodigoPropiedad()}</td>
                                                    <td>${propiedad.getNombrePropiedad()}</td>
                                                    <td>${propiedad.getPrecio()}</td>
                                                    <td>${propiedad.getCategoria()}</td>
                                                    <td>${propiedad.getUbicacion()}</td>
                                                    <td>${propiedad.getDisponibles()}</td>
                                                    <td>
                                                        <form action="Controlador" method="POST">
                                                            <input type="hidden" name="menu" value="Propiedades">
                                                            <input type="hidden" name="codigoPropiedad" value="${propiedad.getCodigoPropiedad()}">
                                                            <button type="submit" name="accion" value="Eliminar" class="btn btn-outline-danger btn-sm">
                                                                Eliminar
                                                            </button>
                                                        </form>
                                                        <form action="Controlador" method="POST">
                                                            <input type="hidden" name="menu" value="Propiedades">
                                                            <input type="hidden" name="codigoPropiedad" value="${propiedad.getCodigoPropiedad()}">
                                                            <button type="submit" name="accion" value="Editar" class="btn btn-outline-warning btn-sm">
                                                                Editar
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </main>

        <footer class="footer">
            <div class="container container-footer">
                <div class="menu-footer">
                    <div class="contact-info">
                        <p class="title-footer">Información de Contacto</p>
                        <ul>
                            <li>
                                Dirección: 71 Pennington Lane Vernon Rockville, CT
                                06066
                            </li>
                            <li>Teléfono: 123-456-7890</li>
                            <li>Fax: 55555300</li>
                            <li>EmaiL: baristas@support.com</li>
                        </ul>
                        <div class="social-icons">
                            <span class="facebook">
                                <i class="fa-brands fa-facebook-f"></i>
                            </span>
                            <span class="twitter">
                                <i class="fa-brands fa-twitter"></i>
                            </span>
                            <span class="youtube">
                                <i class="fa-brands fa-youtube"></i>
                            </span>
                            <span class="pinterest">
                                <i class="fa-brands fa-pinterest-p"></i>
                            </span>
                            <span class="instagram">
                                <i class="fa-brands fa-instagram"></i>
                            </span>
                        </div>
                    </div>

                    <div class="information">
                        <p class="title-footer">Información</p>
                        <ul>
                            <li><a href="#">Acerca de Nosotros</a></li>
                            <li><a href="#">Información Delivery</a></li>
                            <li><a href="#">Politicas de Privacidad</a></li>
                            <li><a href="#">Términos y condiciones</a></li>
                            <li><a href="#">Contáctanos</a></li>
                        </ul>
                    </div>

                    <div class="my-account">
                        <p class="title-footer">Mi cuenta</p>
                        <ul>
                            <li><a href="cuenta-admin.jsp">Mi cuenta</a></li>
                            <li><a href="#">Historial de ordenes</a></li>
                            <li><a href="#">Lista de deseos</a></li>
                            <li><a href="#">Boletín</a></li>
                            <li><a href="#">Reembolsos</a></li>
                        </ul>
                    </div>

                    <div class="newsletter">
                        <p class="title-footer">Boletín informativo</p>
                        <div class="content">
                            <p>
                                Suscríbete a nuestros boletines ahora y mantente al
                                día con nuevas colecciones y ofertas exclusivas.
                            </p>
                            <input type="email" placeholder="Ingresa el correo aquí...">
                            <button>Suscríbete</button>
                        </div>
                    </div>
                </div>

                <div class="copyright">
                    <p>
                        KinalCasa &copy; 2025
                    </p>
                    <img src="img/payment.png" alt="Pagos">
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS para el Carousel -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>