
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>


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
                                <img src="img/logo.png" width="40%" alt="">
                            </div>

                            <div class="pt-4 pb-2">
                                <h5 class="card-title text-center pb-0 fs-4 text-light">Registro TeleViajero</h5>
                            </div>

                            <form class="row g-3 needs-validation" id="registration-form" novalidate>

                                <div class="col-12">
                                    <input type="text" name="nombre" placeholder="Nombre" class="form-control" id="nombre" required>
                                    <div class="invalid-feedback">Por favor ingrese su usuario!</div>
                                </div>

                                <div class="col-12">
                                    <input type="text" name="apellido" placeholder="Apellido" class="form-control" id="apellido" required>
                                    <div class="invalid-feedback">Por favor ingrese su usuario!</div>
                                </div>

                                <div class="col-12">
                                    <input type="number" max="30" min="18" name="edad" placeholder="Edad" class="form-control" id="edad" required>
                                    <div class="invalid-feedback">Por favor ingrese su usuario!</div>
                                </div>

                                <div class="col-12">
                                    <input type="number" max="100000000" min="99999999" name="codigoPucp" placeholder="Código Pucp" class="form-control" id="codigoPucp" required>
                                    <div class="invalid-feedback">Por favor ingrese su usuario!</div>
                                </div>

                                <div class="col-12">
                                    <input type="text" name="correoPucp" placeholder="Correo Pucp" class="form-control" id="correoPucp" required>
                                    <div class="invalid-feedback">Por favor ingrese su usuario!</div>
                                </div>

                                <div class="col-12">
                                    <input type="text" name="especialidad" placeholder="Especialidad" class="form-control" id="especialidad" required>
                                    <div class="invalid-feedback">Por favor ingrese su usuario!</div>
                                </div>

                                <div class="col-12">
                                    <input type="password" name="password" placeholder="Contraseña" class="form-control" id="password" required>
                                    <div class="invalid-feedback">Por favor ingrese su contraseña!</div>
                                </div>

                                <div class="col-12">
                                    <input type="password" name="passwordConfirm" placeholder="Confirmación de contraseña" class="form-control" id="passwordConfirm" required>
                                    <div class="invalid-feedback">Por favor ingrese su contraseña!</div>
                                </div>


                                <div class="col-12 d-flex justify-content-center">
                                    <button type="button" class="btn btn-outline-primary rounded-pill">Registrarme</button>
                                </div>

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

