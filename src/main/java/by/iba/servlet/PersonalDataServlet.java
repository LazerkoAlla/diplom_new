package by.iba.servlet;

import by.iba.dao.UserDao;
import by.iba.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "PersonalDataServlet", value = "/PersonalDataServlet")
public class PersonalDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request
                .getRequestDispatcher("/WEB-INF/views/personaldata.jsp")
                .forward(request, response); }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String name = request.getParameter("LoginName");
        String password = request.getParameter("newPassword");

        UserDao daoUser = new UserDao();
        User user = new User();
        user.setLogin(name);
        user.setPassword(password);
         daoUser.changePass(user);
        request
                .getRequestDispatcher("/WEB-INF/views/personaldata.jsp")
                .forward(request, response);

    }
}
