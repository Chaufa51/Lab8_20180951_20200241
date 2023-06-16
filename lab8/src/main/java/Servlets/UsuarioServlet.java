package Servlets;

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

        switch (action){
            case "listar":
                request.getRequestDispatcher("crearUsuario.jsp").forward(request,response);
                break;
            case "inicio":
                request.getRequestDispatcher("listaViaje.jsp").forward(request,response);
                break;
            case "nuevoViaje":
                request.getRequestDispatcher("nuevoViaje.jsp").forward(request,response);

                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
