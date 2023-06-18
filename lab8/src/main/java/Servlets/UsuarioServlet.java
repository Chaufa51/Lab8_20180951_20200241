package Servlets;

import Beans.Usuario;
import Daos.UsuarioDaos;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action) {
            case "crear":
                request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
                break;
            case "listar":
                request.getRequestDispatcher("listaViaje.jsp").forward(request, response);
                break;
            case "nuevoViaje":
                request.getRequestDispatcher("nuevoViaje.jsp").forward(request, response);

                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        UsuarioDaos usuarioDaos = new UsuarioDaos();

        switch (action) {
            case "crear":
                Usuario usuario = parseUsuario(request);
                usuarioDaos.nuevoUsuario(usuario);

                response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                break;
        }

    }


    /**
     * REGISTRAR USUARIO
     **/
    public Usuario parseUsuario(HttpServletRequest request) {

        Usuario usuario = new Usuario();
        /*String juegoId = request.getParameter("idJuegos") != null ? request.getParameter("idJuegos") : "";*/
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String edadStr = request.getParameter("edad");
        String codigoPucpStr = request.getParameter("codigoPucp");
        String correoPucp = request.getParameter("correoPucp");
        String especialidad = request.getParameter("especialidad");
        String password = request.getParameter("password");
        String password2 = request.getParameter("passwordConfirm");

        try {
            int edad = Integer.parseInt(edadStr);
            int codigoPucp = Integer.parseInt(codigoPucpStr);


            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setEdad(edad);
            usuario.setCodigo(codigoPucp);
            usuario.setCorreo(correoPucp);
            usuario.setEspecialidad(especialidad);


            return usuario;

        } catch (NumberFormatException e) {

        }
        return usuario;
    }

}