<%@page import="Lib.util"%>
<%@page import="DAO.UsuarioDAO"%>
<%@page import="Models.Articulo"%>
<%@page import="DAO.ArticuloDAO"%>
<%@page import="DAO.ConectorBD"%>
<%@page import="Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es-ES">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio</title>
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
                                <a class="nav-link" href="mascotas.jsp">Mascotas</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="mercado.jsp">Mercado</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="perdidos.jsp">Perdidos </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="administracion.jsp">Administracion</a>
                            </li>
                    </div>
                </div>
                <form class="d-flex">
                    <%
                        Usuario actual = (Usuario) session.getAttribute("usuarioLogueado");
                        if (actual != null) {
                    %>
                    <p>Bienvenido, <%=actual.getNombre()%>. <a href="logout">Cerrar sesion</a></p>
                    <%
                    } else {
                    %>
                    <p>No estás logueado. Inicia sesion <a href="index.jsp">aquí</a></p>
                    <%
                        }

                    %>
                </form>
            </nav>
        </header>
        <main class="main-objeto">
            <%
                ConectorBD bdActual = new ConectorBD("localhost", "adoptaio", "root", "");
                ArticuloDAO informacionArticulo = new ArticuloDAO();
                informacionArticulo.setConn(bdActual.getConexion());
                UsuarioDAO informacionDuenio = new UsuarioDAO();
                informacionDuenio.setConn(bdActual.getConexion());
                Articulo articulo = informacionArticulo.informacionArtículoDetallado(Integer.parseInt(request.getParameter("idArticulo")));
                Usuario usuario = informacionDuenio.informacionUsuarioDetallada(informacionDuenio.buscarIdDuenioArticulo(Integer.parseInt(request.getParameter("idArticulo"))));
                informacionArticulo.cerrarConexion();
                informacionDuenio.cerrarConexion();
                bdActual.cerrarConexion();
            %>
            <section class="info-general-objeto">
                <img src="data:image/png;base64,<%=articulo.getFotoArticulo()%>" alt="Foto del artículo con nombre <%=articulo.getNombre()%>" />
                <div class="info-dueño">
                    <p><%=usuario.getNombre()%>, vive en <%=usuario.getComunidad()%>.</p>
                    <p> Datos de contacto </p>
                    <ul>
                        <li>Teléfono: <%=usuario.getTelefono()%></li>
                        <li>Correo: <%=usuario.getEmail()%></li>
                    </ul>
                        <a href="mailto:<%=usuario.getEmail()%>?&subject=Quiero%20contactar%20con%20usted:%20<%=usuario.getNombre()%>">Contactar con <%=usuario.getNombre()%></a>
                </div>
            </section>
            <section class="info-objeto">
                <p><%=articulo.getDescripcion()%></p>
                <a href="mailto:<%=usuario.getEmail()%>?&subject=Quiero%20comprar%20tu%20artículo:%20<%=articulo.getNombre()%>&body=Hola%20me%20gustaria%20comprar%20el%20articulo:%20<%=articulo.getNombre()%>%20por%20<%=articulo.getPrecio()%>€.%20Ruego%20se%20ponga%20en%20contacto%20para%20continuar%20con%20el%20proceso.%20Saludos%20de%20<%=usuario.getNombre()%>">Comprar artículo</a>
            </section>
        </main>
        <footer class="footer bg-success">
            <p class="footer" style="color: white;">&copy; Guillermo Illera Vinatea - Calle emperador, Portal 43, Piso 4ºB</p>
        </footer>
    </body>

</html>