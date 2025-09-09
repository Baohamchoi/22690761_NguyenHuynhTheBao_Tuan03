package iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.bai02;

import iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.bai02.dao.UserDAO;
import iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.Gender;
import iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

@WebServlet(name = "registerUser", urlPatterns = "/views/registration-user")
public class UserServlet extends HttpServlet {
    UserDAO userDAO;

    @Override
    public void init(ServletConfig config) throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstname = req.getParameter("first-name");
        String lastname  = req.getParameter("last-name");
        String email     = req.getParameter("your-email");
        String password  = req.getParameter("password");

        int day   = Integer.parseInt(req.getParameter("dayOfBirth"));
        int month = Integer.parseInt(req.getParameter("monthOfBirth"));
        int year  = Integer.parseInt(req.getParameter("yearOfBirth"));

        LocalDate birthday = LocalDate.of(year, month, day);

        Gender gender = req.getParameter("gender").equals("Female") ? Gender.FEMALE : Gender.MALE;

        userDAO.insertUser(firstname, lastname, email, password, birthday, gender);

        List<User> list = userDAO.getAllUsers();
        req.setAttribute("userList", list);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/views/listUsers.jsp");
        dispatcher.forward(req, resp);
    }
}
