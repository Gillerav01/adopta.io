<%@page import="Models.Rol"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Models.Mascota"%>
<%@page import="DAO.MascotaDAO"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="DAO.ConectorBD"%>
<%@page import="Models.Usuario"%>
<%
    Usuario actual = (Usuario) session.getAttribute("usuarioLogueado");
    ArrayList<Rol> rolesActuales = (ArrayList<Rol>) session.getAttribute("rolesUsuarioLogueado");
%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html lang="es-ES">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="title" content="adopta.io">
        <meta name="description" content="Aquí podrás adoptar y dar en adopción a tus mascotas, además de poder publicar a tus mascotas pérdidas. También comprar y vender artículos de segunda mano.">
        <meta name="keywords" content="adoptar,adopcion,adopta,mascotas,perros,gatos,pajaros,compraventa,segundamano">
        <meta name="robots" content="index, follow">
        <meta name="language" content="Spanish">
        <meta name="author" content="Guillermo Illera Vinatea">
        <link rel="apple-touch-icon" sizes="180x180" href="assets/icons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/icons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/icons/favicon-16x16.png">
        <link rel="manifest" href="assets/icons/site.webmanifest">
        <link rel="mask-icon" href="assets/icons/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="apple-mobile-web-app-title" content="adopta.io">
        <meta name="application-name" content="adopta.io">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ADOPTA.IO - Mascota</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap"
              rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
        <link rel="stylesheet" href="./css/normalize/normalize.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="./css/style.css">
        <script src="./js/main.js"></script>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-success">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.jsp">ADOPTA.IO
                        <a class="navbar-brand" href="index.jsp">
                            <img src="./assets/img/logo.png" alt="" width="70px">
                        </a></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 d-flex">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="index.jsp">Inicio </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="mascotas.jsp">Mascotas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="mercado.jsp">Mercado</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="perdidos.jsp">Perdidos </a>
                            </li>
                            <%
                                if (actual != null) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                            <%
                                }
                                if (actual != null) {
                                    for (Rol rol : rolesActuales) {
                                        if (rol.getNombre().equals("Administrador")) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" href="administracion.jsp">Administracion</a>
                            </li>
                            <%
                                        }
                                    }
                                }
                            %>
                    </div>
                </div>
                <section class="d-flex col-xs-12 col-12 col-sm-12 col-md-12 col-lg-2 offset text-center align-items-center justify-content-center">
                    <%
                        if (actual != null) {
                    %>
                    <p style="color:white;">Bienvenido, <%=actual.getNombre()%>. <a href="logout" style="color:white;" >Cerrar sesion</a></p>
                    <%
                    } else {
                    %>
                    <p  style="color:white;">No estás logueado. Inicia sesion <a href="index.jsp" style="color:white;" >aquí</a></p>
                    <%
                        }

                    %>
                </section>
            </nav>
        </header>
        <main class="main-mascota container-fluid p-5">
            <%                // Saca toda la información de la mascota y del usuario al que pertenece la mascota para mostrarla
                ConectorBD bdActual = new ConectorBD("localhost", "adoptaio", "root", "");
                MascotaDAO informacionMascota = new MascotaDAO();
                informacionMascota.setConn(bdActual.getConexion());
                UsuarioDAO informacionDuenio = new UsuarioDAO();
                informacionDuenio.setConn(bdActual.getConexion());
                Mascota mascota = informacionMascota.informacionMascotaDetallado(Integer.parseInt(request.getParameter("idMascota")));
                Usuario usuario = informacionDuenio.informacionUsuarioDetallada(informacionDuenio.buscarIdDuenioMascota(Integer.parseInt(request.getParameter("idMascota"))));
                informacionMascota.cerrarConexion();
                informacionDuenio.cerrarConexion();
                bdActual.cerrarConexion();
            %>
            <section class="info-general-mascota col-xs-12 col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center container flex-wrap">
                <section class="col-xs-12 col-12 col-sm-8 col-md-8 col-lg-8 d-flex justify-content-center mt-5">
                    <img src="data:image/png;base64,<%=mascota.getImagenMascota()%>" alt="Foto del artículo con nombre <%=mascota.getNombre()%>"/>
                </section>
                <div class="info-dueño flex-column d-flex col-xs-12 col-12 col-sm-12 col-md-12 col-lg-2 justify-content-around mt-5">
                    <p><%=usuario.getNombre()%>, vive en <%=usuario.getComunidad()%>.</p>
                    <p> Datos de contacto </p>
                    <ul>
                        <li>Teléfono: <%=usuario.getTelefono()%></li>
                        <li>Correo: <%=usuario.getEmail()%></li>
                    </ul>
                    <%
                        if (actual != null) {
                    %>
                    <a href="mailto:<%=usuario.getEmail()%>?&subject=Quiero%20contactar%20con%20usted:%20<%=usuario.getNombre()%>" class="btn btn-success col-12">Contactar con <%=usuario.getNombre()%></a>
                    <a href="contacto.jsp?denunciar" class="btn btn-success col-12">Denunciar publicación</a>
                    <%
                    } else {
                    %>
                    <a href="#" class="btn btn-success col-12">Inicia sesión para contactar con el usuario.</a>
                    <%
                        }
                    %>
                </div>
            </section>
            <section class="info-mascota d-flex col-xs-12 col-12 col-sm-12 col-md-12 col-lg-12 justify-content-center align-items-center flex-column p-5 mt-5">
                <p><%=mascota.getTipo()%> - <%=mascota.getRaza()%></p>
                <p>Motivo de la adopción: <%=mascota.getMotivo()%></p>
                <%
                    if (actual != null) {
                        if (!mascota.isPerdida()) {
                %>
                <a href="mailto:<%=usuario.getEmail()%>?&subject=Quiero%20adoptar%20tu%20mascota:%20<%=usuario.getNombre()%>&body=Hola%20me%20gustaria%20comprar%20el%20mascota:%20<%=mascota.getNombre()%>%20por%20Ruego%20se%20ponga%20en%20contacto%20para%20continuar%20con%20el%20proceso.%20Saludos%20de%20<%=usuario.getNombre()%>" class="btn btn-success col-10">Adoptar mascota</a>

                <%
                } else {
                %>
                <a href="mailto:<%=usuario.getEmail()%>?&subject=Tengo%20informacion%20sober%20tu%20mascota:%20<%=usuario.getNombre()%>" class="btn btn-success col-10">Informar sobre mascota</a>
                <%
                    }
                %>
                <%
                } else {
                    if (!mascota.isPerdida()) {
                %>
                <a href="#" class="btn btn-success col-10">Inicia sesión para adoptar a esta mascota</a>

                <%
                } else {
                %>
                <a href="#" class="btn btn-success col-10">Inicia sesión para ofrecer informacion de esta mascota</a>
                <%
                    }
                %>
                <%
                    }
                %>
            </section>
        </main>
        <footer class="footer bg-success">
            <p class="footer" style="color: white;">&copy; Guillermo Illera Vinatea - Calle emperador, Portal 43, Piso 4ºB</p>
        </footer>
    </body>

</html>