<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Telecom</title>


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css">
    <style>
        .fondo {
            background-image: url("img/fondo.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .negro {
            background-color: #000000;
        }
    </style>
</head>

<body>

<div class="fondo">
    <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                    <div class="card mb-3 negro">

                        <div class="card-body">

                            <div class="d-flex justify-content-center">
                                <img src="img/logo.png" width="80%" alt="">
                            </div>

                            <div class="pt-4 pb-2">
                                <h5 class="card-title text-center pb-0 fs-4 text-light">Bienvenido TeleViajero</h5>
                            </div>

                            <form class="form-signin" method="POST" action="<%=request.getContextPath()%>/LoginServlet">
                                <input type="text" name="inputEmail" class="form-control" placeholder="Correo" autofocus="">
                                <input type="password" name="inputPassword" class="form-control" placeholder="Contraseña">
                                <% if (request.getAttribute("error") != null) { %>
                                <div class="text-danger mb-2">Error en usuario o contraseña</div>
                                <% } %>
                                <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
                                <p class="small mb-0"><a href="<%=request.getContextPath()%>/UsuarioServlet?a=crear"> Soy nuevo y quiero registrarme</a></p>
                            </form>

                        </div>
                    </div>


                </div>
            </div>
        </div>

    </section>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>


</body>

</html>

