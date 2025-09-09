package iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.bai01;

import iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.Qualification;
import iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.*;

@WebServlet("/registration-form")
public class RegistrationForm extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegistrationForm() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String fname = request.getParameter("firstName");
        String lname = request.getParameter("lastName");
        String dayStr = request.getParameter("dob_day");
        String monthStr = request.getParameter("dob_month");
        String yearStr = request.getParameter("dob_year");
        String genderStr = request.getParameter("gender");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String pincode = request.getParameter("pincode");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String[] hobbiesArr = request.getParameterValues("hobbies");
        String hobbyOther = request.getParameter("hobbyOther");
        String course = request.getParameter("course");

        // Xử lý giới tính (boolean)
        boolean gender = "Male".equalsIgnoreCase(genderStr);

        // Xử lý ngày sinh
        Date birthDate = null;
        try {
            int day = Integer.parseInt(dayStr);
            int year = Integer.parseInt(yearStr);
            int month = monthStrToInt(monthStr); // tự viết hàm chuyển từ "January" -> 0
            Calendar cal = Calendar.getInstance();
            cal.set(year, month, day);
            birthDate = cal.getTime();
        } catch (Exception e) {
            e.printStackTrace(); // hoặc xử lý lỗi theo nhu cầu
        }

        // Xử lý hobbies thành Set<String>
        Set<String> hobbies = new HashSet<>();
        if (hobbiesArr != null) {
            hobbies.addAll(Arrays.asList(hobbiesArr));
        }
        if (hobbyOther != null && !hobbyOther.trim().isEmpty()) {
            hobbies.add(hobbyOther.trim());
        }

        // Tạo đối tượng Student
        Student sv = new Student();
        sv.setFirstName(fname);
        sv.setLastName(lname);
        sv.setGender(gender);
        sv.setEmail(email);
        sv.setPhone(mobile);
        sv.setAddress(address);
        sv.setCity(city);
        sv.setCode(pincode);
        sv.setState(state);
        sv.setCountry(country);
        sv.setHobbies(hobbies);
        sv.setCourse(course);
        sv.setDob(birthDate);

        // Xử lý bảng điểm (Qualification)
        Set<Qualification> qualifications = new HashSet<>();

        // Class X
        String board1 = request.getParameter("board1");
        String percentage1 = request.getParameter("percentage1");
        String year1 = request.getParameter("year1");
        if (board1 != null && !board1.isEmpty()) {
            qualifications.add(new Qualification(
                    "Class X",
                    board1,
                    percentage1.isEmpty() ? 0 : Double.parseDouble(percentage1),
                    year1.isEmpty() ? 0 : Integer.parseInt(year1)
            ));
        }

        // Class XII
        String board2 = request.getParameter("board2");
        String percentage2 = request.getParameter("percentage2");
        String year2 = request.getParameter("year2");
        if (board2 != null && !board2.isEmpty()) {
            qualifications.add(new Qualification(
                    "Class XII",
                    board2,
                    percentage2.isEmpty() ? 0 : Double.parseDouble(percentage2),
                    year2.isEmpty() ? 0 : Integer.parseInt(year2)
            ));
        }

        // Graduation
        String board3 = request.getParameter("board3");
        String percentage3 = request.getParameter("percentage3");
        String year3 = request.getParameter("year3");
        if (board3 != null && !board3.isEmpty()) {
            qualifications.add(new Qualification(
                    "Graduation",
                    board3,
                    percentage3.isEmpty() ? 0 : Double.parseDouble(percentage3),
                    year3.isEmpty() ? 0 : Integer.parseInt(year3)
            ));
        }

        // Masters
        String board4 = request.getParameter("board4");
        String percentage4 = request.getParameter("percentage4");
        String year4 = request.getParameter("year4");
        if (board4 != null && !board4.isEmpty()) {
            qualifications.add(new Qualification(
                    "Masters",
                    board4,
                    percentage4.isEmpty() ? 0 : Double.parseDouble(percentage4),
                    year4.isEmpty() ? 0 : Integer.parseInt(year4)
            ));
        }

        // Set vào student
        sv.setQualifications(qualifications);


        // Gửi dữ liệu qua result-form.jsp
        request.setAttribute("student", sv);
        RequestDispatcher rd = request.getRequestDispatcher("/views/result-form.jsp");
        rd.forward(request, response);
    }

    // Hàm chuyển tên tháng sang số (0-11)
    private int monthStrToInt(String month) {
        String[] months = { "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December" };
        for (int i = 0; i < months.length; i++) {
            if (months[i].equalsIgnoreCase(month)) {
                return i;
            }
        }
        return 0; // default nếu không khớp
    }
}