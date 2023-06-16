<%@ page import="Servlets.UsuarioServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<jsp:include page="/static/head.jsp">
  <jsp:param name="title" value="Lista de Canciones"/>
</jsp:include>
<body>
<div class='container'>
  <jsp:include page="/includes/navbar.jsp">
    <jsp:param name="page" value="principal"/>
  </jsp:include>

  <% if(request.getParameter("idBanda") == null){ %>
  <div class="pb-5 pt-4 px-3 titlecolor">
    <div class="row">
      <div class="col-lg-6">
        <h1 class='text-light'>Lista de Viajes</h1>
      </div>
      <div class="col-lg-4 align-items-end">
        <a class="btn btn-warning" href="<%=request.getContextPath()%>/UsuarioServlet?a=nuevoViaje">Añadir viaje</a>
      </div>
    </div>
  </div>

  <% } else {%>
  <div class="pb-5 pt-4 px-3 titlecolor">
    <div class="row">
      <div class="col-lg-6">
        <h1 class='text-light'>Lista de Canciones por banda</h1>
      </div>
      <div class="col-lg-4 align-items-end">
        <a class="btn btn-warning" href="#">Mostrar todas las canciones</a>
      </div>
    </div>
  </div>
  <%}%>

  <div class="tabla">
    <table class="table table-dark table-transparent table-hover">
      <thead>
      <th>ID</th>
      <th>Fecha reserva</th>
      <th>Fecha viaje</th>
      <th>Ciudad origen</th>
      <th>Ciudad destino</th>
      <th>Empresa de seguro</th>
      <th>Número de boletos</th>
      <th>Costo total</th>
      <th>Opciones</th>
      </thead>

      <tr>
        <td>random(8 digitos)</td>
        <td>Hoy xdd</td>
        <td>Mañana pipip</td>
        <td>Lima</td>
        <td>Cuzco</td>
        <td>Rimac</td>
        <td>2</td>
        <td>$100</td>
        <td>
          <a href="" class="btn btn-primary">Editar</a>
          <a href="" class="btn btn-danger">Eliminar</a>
        </td>
      </tr>

    </table>
  </div>

</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>
