<%-- 
    Document   : publicarMascota
    Created on : 23-may-2022, 8:47:31
    Author     : Guillermo
--%>

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
                                <a class="nav-link" href="mercado.jsp">Mercado</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="perdidos.jsp">Perdidos </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
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
        <main class="">
            <section>
                <form action="mascota">
                    <section class="imagen" id="imagen-formulario">
                        <img src=""default.jpg" alt="Imagen de registro de la mascota"/></img>
                        <input type="file">
                    </section>
                    <section class="datos--mascota" id="datos-mascota">
                        <input type="text" placeholder="Nombre de la mascota" name="nombre">
                        <select id="tipo" class="tipoMascota" name="tipoMascota">
                                <option value="Perro">Perro</option>
                            <option value="gato">Gato</option>
                            <option value="Pajaro">Pajaro</option>
                            <option value="Roedor">Roedor</option>                    
                        </select>
                        <input type="text" placeholder="Introduzca la raza de la mascota" name="raza" id="raza" class="raza">
                        <section class="seccion-prioridad" id="seccion-prioridad">
                            <p id="valorPrioridad">¡Introduzca la prioridad de adopción de la mascota!</p>
                            <input type="range" min="1" max="10" step="1" id="prioridad" name="prioridad">
                        </section>
                        <section class="seccion-perdida" id="seccion-perdida">
                           <input type="radio" id="perdida" name="perdida" value="1">
                           <label for="perdida">Mi mascota está perdida</label>

                           <input type="radio" id="noperdida" name="perdida" value="0">
                           <label for="noperdida">Mi mascota no está perdida</label>
                        </section>
                    </section>
                    <input type="submit" name="registrarMascota" value="Registrar mascota" id="registrarMascota" class="registrarMascota">
                    <input type="reset" value="Reiniciar registro">
                </form>
            </section>
        </main>
        <footer class="footer bg-success">
            <p class="footer" style="color: white;">&copy; Guillermo Illera Vinatea - Calle emperador, Portal 43, Piso 4ºB</p>
        </footer>
</body>

</html>