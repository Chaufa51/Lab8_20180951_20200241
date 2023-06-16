
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<jsp:include page="/static/head.jsp">
    <jsp:param name="title" value="Nueva lista"/>
</jsp:include>
<body>
<div class="container">
    <jsp:include page="/includes/navbar.jsp">
        <jsp:param name="page" value=""/>
    </jsp:include>
    <h1 class='mb-3 text-white'>Crear nuevo viaje</h1>
    <form method="POST" action="<%=request.getContextPath()%>/listaCanciones">
        <div class="mb-3">
            <label class="text-white" for="identificador">Identificador</label>
            <input type="text" class="form-control" name="identificador" id="identificador">
        </div>

        <div class="mb-3">
            <label class="text-white" for="fechaViaje">Fecha viaje</label>
            <input type="date" class="form-control" name="fechaViaje" id="fechaViaje">
        </div>

        <div class="mb-3">
            <label class="text-white" for="fechaReserva">Fecha reserva</label>
            <input type="date" class="form-control" name="fechaReserva" id="fechaReserva">
        </div>

        <div class="input-group mb-3">
            <label class="text-white" for="seguro">Seguro</label>
            <div class="col-12">
                <select name="seguro" id="seguro" class="form-control">
                    <option value="1">Rimac</option>
                    <option value="2">Pacifico</option>
                    <option value="3">Otras</option>
                </select>
            </div>
        </div>

        <div class="mb-3">
            <label class="text-white" for="boletos">Boletos</label>
            <input type="number" min="1" max="1000" class="form-control" name="boletos" id="boletos">
        </div>

        <div class="mb-3">
            <label class="text-white" for="precio">Precio</label>
            <input type="number" min="10" max="1000" class="form-control" name="precio" id="precio">
        </div>

        <a class="btn btn-danger" href="<%=request.getContextPath()%>/UsuarioServlet">Cancelar viaje pipipi</a>
        <button type="submit" class="btn btn-primary">Aniadir viaje</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>
