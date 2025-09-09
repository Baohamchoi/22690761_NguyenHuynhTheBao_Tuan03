package iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.bai02.dao;

import iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.bai02.utils.DBUtil;
import iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.Gender;
import iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.User;


import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public void insertUser(String firstName, String lastName, String email, String password, LocalDate birthday, Gender gender) {
        String sql = "INSERT INTO account(first_name,last_name,email,password,birthday,gender) VALUES(?,?,?,?,?,?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, password); // nhớ mã hóa ở thực tế
            ps.setDate(5, Date.valueOf(birthday));
            ps.setString(6, String.valueOf(gender));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM account";
        try (Connection conn = DBUtil.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new User(
                        rs.getDate("birthday").toLocalDate(),
                        rs.getString("email"),
                        rs.getString("first_name"),
                        Gender.valueOf(rs.getString("gender").toUpperCase()), // "Male" -> MALE
                        rs.getString("last_name"),
                        rs.getString("password")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}