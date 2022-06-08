<%@page import="Models.Rol"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Lib.util"%>
<%@page import="Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Usuario actual = (Usuario) session.getAttribute("usuarioLogueado");
    ArrayList<Rol> rolesActuales = (ArrayList<Rol>) session.getAttribute("rolesUsuarioLogueado");
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
        <meta name="robots" content="noindex, nofollow">
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
        <title>ADOPTA.IO - Publicar mascota</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;1,300&display=swap"
              rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/hover.css/2.3.1/css/hover-min.css">
        <link rel="stylesheet" href="./css/normalize/normalize.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/publicarMascota.css">
        <script src="./js/main.js"></script>
        <script src="./js/registrarMascota.js"></script>
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
                                <a class="nav-link active" href="perdidos.jsp">Perdidos </a>
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
        <main class="main-publicarMascota container-fluid p-3">
            <section class="col-xs-12 col-12 col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center align-items-center flex-column">
                <%                    if (actual != null) {
                %>
                <form action="mascota" method="POST" id="registrarMascota" class="form-mascota col-xs-12 col-12 col-sm-12 col-md-8 col-lg-8 p-3">
                    <%
                    } else {
                    %>
                    <form action="#" class="form-mascota col-xs-12 col-12 col-sm-12 col-md-8 col-lg-8 p-3">
                        <%
                            }

                        %>
                        <input type="hidden" value="DEFAULT" name="baseImagen" id="baseImagen">
                        <section class="imagen" id="imagen-formulario" class="col-xs-12 col-12 col-sm-12 col-md-12 col-lg-12">
                            <img src="./assets/fotosPerfil/default.png" id="imagen-subida" alt="Imagen de registro de la mascota"  class="col-xs-12 col-12 col-sm-12 col-md-6 col-lg-6"></img>
                            <input type="file" id="idFile">
                        </section>
                        <section class="datos-mascota d-flex flex-column" id="datos-mascota">
                            <input type="text" id="nombre" placeholder="Nombre de la mascota" name="nombre">
                            <select id="tipo" class="tipoMascota" name="tipoMascota">
                                <option value="">Seleccionar tipo de masccota</option>
                                <option value="Perro">Perro</option>
                                <option value="gato">Gato</option>
                                <option value="Pajaro">Pajaro</option>
                                <option value="Roedor">Roedor</option>                    
                            </select>
                                <select name="comunidad" id="comunidad">
                                    <%                                    for (String comunidad : util.devolverArrayComunidad()) {
                                    %>
                                    <option value="<%=comunidad%>"><%=comunidad%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            <textarea id="motivo" class="motivo" name="motivo" placeholder="Introduzca del motivo de la adopción"></textarea>
                            <input type="text" placeholder="Introduzca la raza de la mascota" name="raza" id="raza" class="raza">
                            <section class="seccion-prioridad d-flex flex-column" id="seccion-prioridad">
                                <p id="valorPrioridad" class="text-center">¡Introduzca la prioridad de adopción de la mascota!</p>
                                <input type="range" min="1" max="10" step="1" id="prioridad" name="prioridad">
                            </section>
                            <section class="seccion-perdida d-flex justify-content-evenly p-4 align-items-center" id="seccion-perdida">
                                <div>
                                <input type="radio" id="perdida" name="perdida" value="1">
                                <label for="perdida">Mi mascota está perdida</label>
                                </div>
                                <div>
                                <input type="radio" id="noperdida" name="perdida" value="0" checked>
                                <label for="noperdida">Mi mascota no está perdida</label>
                                </div>
                            </section>
                        </section>
                        <%
                            if (actual != null) {
                        %>
                        <input type="submit" name="registrarMascota" value="Registrar mascota" id="registrarMascota" class="btn btn-success col-xs-12 col-12 col-sm-12 col-md-12 col-lg-12">
                        <%
                        } else {
                        %>
                        <input type="submit" name="registrarMascota" value="Logueate para registrar una mascota" id="registrarMascota" class="btn btn-success col-xs-12 col-12 col-sm-12 col-md-12 col-lg-12" disabled>
                        <%
                            }

                        %>
                        <input type="reset" value="Reiniciar registro" class="btn btn-success col-xs-12 col-12 col-sm-12 col-md-12 col-lg-12">
                    </form>
            </section>
        </main>
        <footer class="footer bg-success">
            <p class="footer" style="color: white;">&copy; Guillermo Illera Vinatea - Calle emperador, Portal 43, Piso 4ºB</p>
        </footer>
    </body>

</html>