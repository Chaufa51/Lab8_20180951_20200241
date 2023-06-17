
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar sticky-top navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet">Vagaciones TeleViajero</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link " href=""><%=%></a>
            </li>
            <li class="nav-item">
                <a class="nav-link <%=request.getParameter("page").equals("cerrar")? "active": "" %>" href="<%=request.getContextPath()%>/LoginServlet?a=logout">Cerrar Sesión</a>
            </li>

        </ul>
    </div>
</nav>

