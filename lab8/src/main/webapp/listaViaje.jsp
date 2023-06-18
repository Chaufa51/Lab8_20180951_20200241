<%@ page import="Servlets.UsuarioServlet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Viaje" %>

<% ArrayList<Viaje> lista = (ArrayList<Viaje>) request.getAttribute("lista"); %>

<html>
<jsp:include page="/static/head.jsp">
  <jsp:param name="title" value="Lista de Viajes"/>
</jsp:include>
<body>
<div class='container'>
  <jsp:include page="/includes/navbar.jsp">
    <jsp:param name="page" value="principal"/>
  </jsp:include>


  <div class="pb-5 pt-4 px-3 titlecolor">
    <div class="row">
      <div class="col-lg-6">
        <h1 class='text-light'>Lista de Viajes</h1>
      </div>
      <div class="col-lg-4 align-items-end">
        <a class="btn btn-success" href="<%=request.getContextPath()%>/UsuarioServlet?a=nuevoViaje">Añadir viaje</a>
      </div>
    </div>
  </div>


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
      <tbody>
      <% for (Viaje v : lista) { %>
      <tr>
        <td><%=v.getIdViaje()%></td>
        <td><%=v.getFechaReserva()%></td>
        <td><%=v.getFechaViaje()%></td>
        <td><%=v.getCiudadOrigen()%></td>
        <td><%=v.getCiudadDestino()%></td>
        <td><%=v.getSeguro().getNombre()%></td>
        <td><%=v.getCantidadBoletos()%></td>
        <td><%=v.getCostoTotal()%></td>
        <td>
          <a href="" class="btn btn-primary">Editar</a>
          <a href="" class="btn btn-danger">Eliminar</a>
        </td>
      </tr>
      <% } %>
      </tbody>

    </table>
  </div>

</div>
<jsp:include page="/static/scripts.jsp"/>
</body>
</html>
