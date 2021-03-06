<%@page import="Models.Rol"%>
<%@page import="java.util.ArrayList"%>
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
        <title>ADOPTA.IO - Inicio</title>
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
                                <a class="nav-link active" aria-current="page" href="index.jsp">Inicio </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="mascotas.jsp">Mascotas</a>
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
        <main>
            <section class="login">
                <article class="login-menu">
                <%                                        
                    if ((Usuario) session.getAttribute("usuarioLogueado") == null) {
                %>
                    <div class="logueo">
                        <form action="index" class="formularioLogueo" method="post">
                            <div>
                                <input type="text" name="nombre" id="nombre" placeholder="Correo del usuario">
                                <input type="password" name="password" id="password" placeholder="Contraseña del usuario">
                            </div>
                            <input type="submit" name="iniciarSesion" id="submit" value="Iniciar sesión" class="hvr-grow-shadow">
                        </form>
                    </div>
                    <div class="login-link">
                        <p>O... <a href="registro.jsp">registrate aquí.</a></p>
                    </div>
                <%
                    } else {
                %>
                    <div class="login-logueado align-self-center">
                        <h2>Bienvenido, <%=actual.getNombre()%></h2>
                    </div>
                <%
                    }
                %>
                </article>
            </section>

            <section class="nosotros">
                <article class="nosotros-info">
                    <h2>Sobre nosotros</h2>
                    <p>Somos un puente entre usuarios, donde cada cual puede adoptar o dar en adopción a su mascota, vender/comprar artículos de segunda mano para sus mascotas, y publicar las mascotas perdídas de cada quien, para que resulte algo más fácil resolver estas dificiles situaciones.
                    </p>
                </article>
                <article class="ubicacion">
                    <h2>¿Donde estamos?</h2>
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d512.34872829286!2d-3.4073262037865018!3d43.41293280600583!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2ses!4v1646779594990!5m2!1sen!2ses"
                        width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </article>
            </section>
        </main>
        <footer class="footer bg-success">
            <p class="footer" style="color: white;">&copy; Guillermo Illera Vinatea - Calle emperador, Portal 43, Piso 4ºB</p>
        </footer>
    </body>

</html>