package Servlets;

import Beans.Usuario;
import Beans.Viaje;
import Daos.UsuarioDaos;
import Daos.UsuarioRegistroDaos;
import Daos.ViajeDaos;
import Dtos.RegistroUsuarioDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.swing.*;
import java.io.IOException;
import java.sql.Date;

import static com.mysql.cj.conf.PropertyKey.password2;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        UsuarioDaos usuarioDaos = new UsuarioDaos();

        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        switch (action) {
            case "crear":
                request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
                break;
            case "listar":
                request.setAttribute("lista",usuarioDaos.listarViajeTodo());
                request.getRequestDispatcher("listaViaje.jsp").forward(request, response);
                break;
            case "nuevoViaje":
                request.setAttribute("lista",usuarioDaos.listarSeguro());
                request.getRequestDispatcher("nuevoViaje.jsp").forward(request, response);

                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("p") == null ? "crear" : request.getParameter("p");

        UsuarioRegistroDaos usuarioRegistroDaos = new UsuarioRegistroDaos();

        ViajeDaos viajeDaos = new ViajeDaos();

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

            case "crearViaje":
                Viaje viaje = parseViaje(request);
                viajeDaos.nuevoViaje(viaje);
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet?a=listar");

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

    /*Registro nuevo viaje*/
    public Viaje parseViaje(HttpServletRequest request) {

        Viaje viaje = new Viaje();
        String idViajeStr = request.getParameter("identificador");
        String fechaViajeStr = request.getParameter("fechaViaje");
        String fechaReservaStr = request.getParameter("fechaReserva");
        String ciudadOrigen = request.getParameter("ciudadOrigen");
        String ciudadDestino = request.getParameter("ciudadDestino");
        String seguroStr = request.getParameter("seguro");
        String boletosStr = request.getParameter("boletos");
        String precioStr = request.getParameter("precio");

        try {
            int idViaje = Integer.parseInt(idViajeStr);
            int boletos = Integer.parseInt(boletosStr);
            int precio = Integer.parseInt(precioStr);
            int seguro = Integer.parseInt(seguroStr);

            viaje.setIdViaje(idViaje);
            viaje.setFechaViaje(Date.valueOf(fechaViajeStr));
            viaje.setFechaReserva(Date.valueOf(fechaReservaStr));
            viaje.setCiudadOrigen(ciudadOrigen);
            viaje.setCiudadDestino(ciudadDestino);
            viaje.setIdSeguros(seguro);
            viaje.setCantidadBoletos(boletos);
            viaje.setCostoTotal(precio);


            return viaje;

        } catch (NumberFormatException e) {

        }
        return viaje;
    }

}