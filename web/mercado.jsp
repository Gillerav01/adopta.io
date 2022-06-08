<%@page import="Models.Rol"%>
<%@page import="Models.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.ArticuloDAO"%>
<%@page import="DAO.ConectorBD"%>
<%@page import="Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%
    Usuario actual = (Usuario) session.getAttribute("usuarioLogueado");
    ArrayList <Rol> rolesActuales = (ArrayList <Rol>) session.getAttribute("rolesUsuarioLogueado");
%>
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
        <title>ADOPTA.IO - Mercado</title>
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
        <main class="main-mercado container-fluid p-3 d-flex flex-wrap">
            <section class="objetos col-lg-12 col-xs-12 col-sm-12 p-5 col-md-12 d-flex flex-row justify-content-center flex-wrap">
                <div class="card col-lg-3 col-xs-12 col-sm-6 col-md-3 m-5" style="">
                    <a href="publicarArticulo.jsp">
                        <svg class="card-img-top" src="./assets/img/mas.png" xmlns="http://www.w3.org/2000/svg"   viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-plus">
                        <line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line>
                        </svg>
                    </a>
                    <div class="card-body">
                        <h5 class="card-title">¡Publica aquí tu artículo!</h5>
                        <a href="publicarArticulo.jsp" class="btn btn-primary" style="width: 100%;">Publicar articulo</a>
                    </div>
                </div>
                <%                
                    ConectorBD bdActual = new ConectorBD("localhost", "adoptaio", "root", "");
                    ArticuloDAO mostrarArticulos = new ArticuloDAO();
                    mostrarArticulos.setConn(bdActual.getConexion());
                    ArrayList<Articulo> articulos;
                    if (request.getParameter("pagina") == null) {
                        articulos = mostrarArticulos.devolverArticulos(8, 0, mostrarArticulos.contarArticulos());
                    } else {
                        articulos = mostrarArticulos.devolverArticulos(8, Integer.parseInt(request.getParameter("pagina")), mostrarArticulos.contarArticulos());
                    }
                    for (Articulo articulo : articulos) {
                %>
                <div class="card col-lg-3 col-xs-12 col-sm-6 col-md-3 m-5 p-3" style="">
                    <a href="articulo.jsp?idArticulo=<%=articulo.getId()%>">
                        <img class="card-img-top" src="data:image/png;base64,<%=articulo.getFotoArticulo()%>" alt="Red dot" />
                    </a>
                    <div class="card-body">
                        <h5 class="card-title"><%=articulo.getNombre()%>
                    </div>
                    </h5>
                    <a href="articulo.jsp?idArticulo=<%=articulo.getId()%>" class="btn btn-success">Ver artículo</a>
                </div>
                <%
                    }
                %>
                <div class="col-12 d-flex justify-content-around">
                    <div class="col-5 float-left">
                        <%
                        if (request.getParameter("pagina") == null || Integer.parseInt(request.getParameter("pagina")) == 0) {
                        %>
                        <a href="#" class="btn btn-success" style="width: 100%;">Pagina anterior</a>
                        <%
                        } else {
                            int siguientePagina = Integer.parseInt(request.getParameter("pagina")) - 1;
                        %>
                        <a href="mercado.jsp?pagina=<%=siguientePagina%>" class="btn btn-success" style="width: 100%;">Pagina anterior</a>
                        <%
                            }
                        %>
                    </div>
                    <div class="col-5">
                        <%
                        if (request.getParameter("pagina") == null || Integer.parseInt(request.getParameter("pagina")) == 0) {
                        %>
                        <a href="mercado.jsp?pagina=1" class="btn btn-success" style="width: 100%;">Siguiente página</a>
                        <%
                        } else {
                            int siguientePagina = Integer.parseInt(request.getParameter("pagina")) + 1;
                        %>
                        <a href="mercado.jsp?pagina=<%=siguientePagina%>" class="btn btn-success" style="width: 100%;">Siguiente página</a>
                        <%
                            }
                        %>
                    </div>
                </div>
            </section>
        </main>
        <footer class="footer bg-success">
            <p class="footer" style="color: white;">&copy; Guillermo Illera Vinatea - Calle emperador, Portal 43, Piso 4ºB</p>
        </footer>
    </body>

</html>