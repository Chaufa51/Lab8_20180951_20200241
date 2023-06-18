package Servlets;

import Beans.Usuario;
import Daos.UsuarioDaos;
import Daos.UsuarioRegistroDaos;
import Dtos.RegistroUsuarioDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.swing.*;
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

        UsuarioRegistroDaos usuarioRegistroDaos = new UsuarioRegistroDaos();
        switch (action) {
            case "crear":
                RegistroUsuarioDto registroUsuarioDto = parseUsuario(request);

                boolean b = registroUsuarioDto.getPassword1().equals(registroUsuarioDto.getPassword2());
                if(b){
                    usuarioRegistroDaos.nuevoUsuario(registroUsuarioDto);
                    response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                }else{
                    response.sendRedirect(request.getContextPath() + "/UsuarioServlet?a=crear");
                }
                break;


            case "editar":
                break;
        }

    }


    /**
     * REGISTRAR USUARIO
     **/
    public RegistroUsuarioDto parseUsuario(HttpServletRequest request) {

        RegistroUsuarioDto usuario = new RegistroUsuarioDto();
        /*String idUsuario = request.getParameter("idUsuario") != null ? request.getParameter("idJuegos") : "";*/
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
            usuario.setCodigoPucp(codigoPucp);
            usuario.setCorreoPucp(correoPucp);
            usuario.setEspecialidad(especialidad);
            usuario.setPassword1(password);
            usuario.setPassword2(password2);


            return usuario;

        } catch (NumberFormatException e) {

        }
        return usuario;
    }

}