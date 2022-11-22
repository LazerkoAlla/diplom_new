package by.iba.servlet;

import by.iba.dao.UserDao;
import by.iba.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String INCORRECT_LOGIN_OR_PASSWORD_ERROR_MESSAGE = "Incorrect login or password! Please try again!";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("name");
        String password = request.getParameter("password");

        UserDao daoUser = new UserDao();
        User user = daoUser.getUser(login, password);
        if (user != null) {
            request.getSession().setAttribute("login", user.getLogin());
            request.getSession().setAttribute("userId", user.getId());
            response.sendRedirect(request.getContextPath() + "/MainPageServlet");
        }
        else {
            request.setAttribute("errorMessage", INCORRECT_LOGIN_OR_PASSWORD_ERROR_MESSAGE);
            request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                .forward(request, response);
        }
    }
}