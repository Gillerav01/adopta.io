<%@page import="Models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error.jsp"%>
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
                                <a class="nav-link" href="perdidos.jsp">Perdidos </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contacto.jsp">Contacto</a>
                            </li>
                    </div>
                </div>
                <form class="d-flex">
                    <%
                        Usuario actual = (Usuario) session.getAttribute("usuarioLogueado");
                        if (actual != null){
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
            <main class="d-flex flex-column">
                <form class="col-12 col-xl-12 bg-light d-flex p-2 flex-column justify-content-center align-items-center rounded"  action="registro" method="post">
                    <section class="col-12 col-xl-12 bg-light d-flex p-2 justify-content-center align-items-center">
                        <section class="col-12 col-xl-5 bg-light d-flex p-2 flex-column justify-content-center align-items-center rounded">
                            <img src="" alt="" class="form_img" name="img">
                            <input type="file" class="form_file" id="form_file" name="file">
                        </section>
                        <section class="col-12 col-xl-5 bg-light d-flex p-2 flex-column justify-content-center align-items-center rounded">
                            <input type="text" placeholder="Correo" name="email">
                            <input type="password" placeholder="Contraseña" name="password">
                            <input type="password" placeholder="Repetir contraseña">
                        </section>
                    </section>
                    <section class="col-12 col-xl-12 bg-light d-flex p-2 flex-column justify-content-center align-items-center rounded">
                        <input type="text" placeholder="Nombre" name="nombre">
                        <input type="text" placeholder="Telefono" name="tlf">
                        <input type="text" placeholder="DNI" name="dni">
                        <select name="comunidad" id="select_comunidad" name="comunidad">
                            <option value="laredo">Laredo</option>
                        </select>
                        <select name="localidad" id="select_localidad" name="localidad">
                            <option value="laredo">Laredo</option>
                        </select>
                    </section>
                    <section>
                        <input type="submit" value="Registrarse" id="submit_registro" class="submit_registro" name="registrarse">
                        <input type="reset" value="Reiniciar formulario" id="reset_registro2" class="reset_registro">
                    </section>
                </form>
            </main>
            <footer class="footer bg-success">
                <p class="footer" style="color: white;">&copy; Guillermo Illera Vinatea - Calle emperador, Portal 43, Piso 4ºB</p>
            </footer>
    </body>

</html>