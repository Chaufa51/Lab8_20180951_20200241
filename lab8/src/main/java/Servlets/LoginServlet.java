package Servlets;

import Beans.Usuario;
import Daos.UsuarioDaos;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("a") != null ? req.getParameter("a") : "login";

        if (action.equals("login")) {

            HttpSession session = req.getSession();

            if(session != null && session.getAttribute("usuarioLog") != null){

                Usuario usuario = (Usuario) session.getAttribute("usuarioLog");

                if(usuario.getIdusuarios()>0){ //estoy loggedIn
                    resp.sendRedirect(req.getContextPath() + "/UsuarioServlet");
                }else{ // no estoy loggedId
                    RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
                    dispatcher.forward(req, resp);
                }
            }
        }else{ //logout
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("inputEmail");
        String pass = req.getParameter("inputPassword");

        UsuarioDaos usuarioDaos = new UsuarioDaos();

        Usuario usuario = usuarioDaos.validateUsernameAndPassword(email, pass);


        if (usuario != null) { //usuario y password correctos
            HttpSession session = req.getSession();
            session.setAttribute("usuarioLog", usuario);

            session.setMaxInactiveInterval(300);//en segundos

            resp.sendRedirect(req.getContextPath());
        } else { //usuario o password incorrectos
            req.setAttribute("error", "Usuario o password incorrectos");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
