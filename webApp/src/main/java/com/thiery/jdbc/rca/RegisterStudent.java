package com.thiery.jdbc.rca;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;


public class RegisterStudent extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int age;
        try {
            age = Integer.parseInt(request.getParameter("age"));
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid age format");
            return;
        }

        String dobString = request.getParameter("dob");
        LocalDate dobLocalDate = LocalDate.parse(dobString);
        Date dob = Date.valueOf(dobLocalDate);

        String school = request.getParameter("school");
        String code = request.getParameter("code");
        Student student = new Student(0, name, age, dob, school, code);

        StudentDao studentDao = new StudentDao();
        studentDao.insert(student);
        List<Student> result = studentDao.getAllStudents();

        request.setAttribute("result", result);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
