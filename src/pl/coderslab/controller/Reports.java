package pl.coderslab.controller;

import pl.coderslab.model.employee.Employee;
import pl.coderslab.model.employee.EmployeeDao;
import pl.coderslab.model.order.Order;
import pl.coderslab.model.order.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.Instant;
import java.util.*;

@WebServlet("/reports")
public class Reports extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/WEB-INF/view/reportSelect.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        @SuppressWarnings("unchecked")
        List<Employee> employees = (List<Employee>) EmployeeDao.getInstance().selectAll();
        Map<Integer, Employee> employeeMap = new TreeMap<>(Comparator.reverseOrder());

        for (Employee employee : employees) {
            Integer workHoursSum = 0;
            @SuppressWarnings("unchecked")
            List<Order> orders = (List<Order>) OrderDao.getInstance().selectByString("WHERE employee_id="
                    + employee.getId() + " AND status='DONE'");

            for (Order order : orders) {
                workHoursSum += order.getWorkHours();
            }

            employeeMap.put(workHoursSum, employee);
        }

        request.setAttribute("employeeMap", employeeMap);

        getServletContext().getRequestDispatcher("/WEB-INF/view/reportWorkHours.jsp").forward(request,response);
    }
}
