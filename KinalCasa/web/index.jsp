<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Lujo Inmobiliario | Kinal Casa</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="icon" href="img/kinal toys.png">
        <link rel="stylesheet" href="css/index.css">


    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <div class="customer-support d-none d-lg-flex">
                    <i class="fa-solid fa-headset"></i>
                    <div>
                        <div class="fw-bold">Llama Al Gerente</div>
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

        <!-- Carousel Principal -->
        <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&auto=format&fit=crop&w=1950&q=80" class="d-block w-100" alt="Propiedad de Lujo 1">
                    <div class="carousel-caption">
                        <h2>Propiedades</h2>
                        <p>Gestión de Propiedades de la Compañía "KinalCasa".</p>
                        <a href="Controlador?menu=Propiedades&accion=Listar" class="btn btn-luxury btn-lg">Gestionar Propiedades
                        </a>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-4.0.3&auto=format&fit=crop&w=1950&q=80" class="d-block w-100" alt="Constructoras">
                    <div class="carousel-caption">
                        <h2>Constructoras</h2>
                        <p>Gestión de Constructoras de la Compañía "KinalCasa".</p>
                        <a href="Controlador?menu=Constructoras&accion=Listar" class="btn btn-luxury btn-lg">Gestionar Constructoras
                        </a>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>


        <section class="dashboard-section">
            <div class="container">
                <div class="row g-4">
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row g-4">

                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-warning mb-3">
                            <i class="fas fa-phone me-2"></i>Información de Contacto
                        </h5>
                        <ul class="list-unstyled">
                            <li class="mb-2">
                                <i class="fas fa-map-marker-alt me-2 text-warning"></i>
                                Avenida La Reforma 12-15, Ciudad de Guatemala
                            </li>
                            <li class="mb-2">
                                <i class="fas fa-phone me-2 text-warning"></i>
                                502-3110-0319
                            </li>
                            <li class="mb-2">
                                <i class="fas fa-envelope me-2 text-warning"></i>
                                info@lujoinmobiliario.com
                            </li>
                        </ul>
                        <div class="social-icons mt-3">
                            <span class="facebook"><i class="fa-brands fa-facebook-f"></i></span>
                            <span class="twitter"><i class="fa-brands fa-twitter"></i></span>
                            <span class="youtube"><i class="fa-brands fa-youtube"></i></span>
                            <span class="pinterest"><i class="fa-brands fa-pinterest-p"></i></span>
                            <span class="instagram"><i class="fa-brands fa-instagram"></i></span>
                        </div>
                    </div>

                    <!-- Información -->
                    <div class="col-lg-3 col-md-6">
                        <h5 class="text-warning mb-3">
                            <i class="fas fa-info-circle me-2"></i>Información
                        </h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Acerca de Nosotros</a></li>
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Guía del Comprador</a></li>
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Política de Privacidad</a></li>
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Términos y Condiciones</a></li>
                            <li class="mb-2"><a href="#" class="text-light text-decoration-none">Contáctanos</a></li>
                        </ul>
                    </div>


                </div>

                <hr class="my-4">

                <div class="row align-items-center">
                    <div class="col-md-6">
                        <p class="mb-0">&copy; 2025 Lujo Inmobiliario. Todos los derechos reservados.</p>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <img src="https://via.placeholder.com/200x30/ecf0f1/2c3e50?text=Metodos+de+Pago" alt="Métodos de Pago" class="img-fluid">
                    </div>
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


    </body>
</html>