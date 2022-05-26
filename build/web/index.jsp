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
    <main>
        <section class="login">
            <article class="login-menu">
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
            </article>
        </section>
        <section class="nosotros">
            <article class="nosotros-info">
                <h2>Sobre nosotros</h2>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Minima quasi earum odio totam dolorum!
                    Beatae culpa dolore velit iusto maxime accusamus perferendis iste error, quae tempora, eligendi
                    reiciendis praesentium minus.
                    Eligendi rerum possimus laborum, commodi doloremque sunt incidunt corporis sed labore ullam minus.
                    Quidem maxime blanditiis esse ipsum veritatis distinctio? A aliquam eveniet dolores tempora modi
                    dolore voluptates laboriosam distinctio?
                    A architecto odit sed. Perspiciatis eius cumque quisquam maxime sunt aliquid autem labore, eveniet,
                    esse, fugit ratione numquam perferendis dolorum cum eaque voluptatibus! Quos voluptas natus
                    inventore obcaecati, cum quis.
                    Sint, saepe id! Neque molestiae cumque corporis deleniti inventore sapiente laborum omnis corrupti
                    consectetur vel aut dolorum quasi explicabo quisquam facilis officiis, quia officia sint iure
                    itaque, repellendus reprehenderit. Ipsum?
                    Ducimus dicta nisi ex deleniti minus molestiae facere rem nesciunt voluptates consectetur
                    accusantium, perferendis et sequi omnis architecto alias consequatur modi doloribus? Obcaecati eaque
                    quidem rem quas reiciendis praesentium eveniet?
                    Maxime aspernatur repudiandae eveniet reprehenderit, sed excepturi officiis dolor fugit quibusdam
                    debitis odio inci dunt veniam. Mollitia, non! Harum, tempore a dignissimos quod repudiandae, magnam
                    excepturi laboriosam dicta similique assumenda eius!
                    Nisi placeat illo nihil, architecto ab provident asperiores corrupti fugiat assumenda. Velit ipsum
                    similique aspernatur natus, sunt laboriosam quas, neque asperiores recusandae sint libero
                    accusantium quidem molestiae sequi ex vel!
                    Molestias dignissimos fugit distinctio incidunt voluptate tenetur repellat est provident, error
                    tempore possimus temporibus blanditiis, exercitationem dolores aperiam facere inventore reiciendis
                    quidem animi fuga necessitatibus quo. Ea totam et ut.
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