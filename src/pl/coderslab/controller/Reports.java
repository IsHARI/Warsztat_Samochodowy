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
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.*;

@WebServlet("/reports")
public class Reports extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/WEB-INF/view/reportSelect.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Instant beginInstant = Instant.parse(request.getParameter("begin") + "T00:00:00Z");
        Instant endInstant = Instant.parse(request.getParameter("end") + "T00:00:00Z");

        String beginDate = Timestamp.from(beginInstant).toString();
        String endDate = Timestamp.from(endInstant).toString();

        request.setAttribute("beginDate", beginInstant);
        request.setAttribute("endDate", endInstant);

        switch (request.getParameter("type")) {
            case "workHours":
                @SuppressWarnings("unchecked")
                List<Employee> employees = (List<Employee>) EmployeeDao.getInstance().selectAll();
                Map<Integer, Employee> employeeMap = new TreeMap<>(Comparator.reverseOrder());

                for (Employee employee : employees) {
                    Integer workHoursSum = 0;
                    @SuppressWarnings("unchecked")
                    List<Order> orders = (List<Order>) OrderDao.getInstance().selectByString(String.format(
                            "WHERE employee_id=%d AND status='DONE' AND repair_begin_date>='%s' AND repair_begin_date<='%s'",
                            employee.getId(), beginDate, endDate));

                    for (Order order : orders) {
                        workHoursSum += order.getWorkHours();
                    }

                    employeeMap.put(workHoursSum, employee);
                }

                request.setAttribute("employeeMap", employeeMap);

                getServletContext().getRequestDispatcher("/WEB-INF/view/reportWorkHours.jsp").forward(request, response);
                break;
            case "gains":
                @SuppressWarnings("unchecked")
                List<Order> orders = (List<Order>) OrderDao.getInstance().selectByString(String.format(
                        "WHERE status='DONE' AND repair_begin_date>='%s' AND repair_begin_date<='%s'",
                        beginDate, endDate));
                BigDecimal costForClientSum = new BigDecimal(0);
                BigDecimal costOfPartsSum = new BigDecimal(0);
                BigDecimal costPerHourSum = new BigDecimal(0);
                Integer workHoursSum = 0;

                for(Order order : orders) {
                    costForClientSum = costForClientSum.add(order.getCostForClient());
                    costOfPartsSum = costOfPartsSum.add(order.getCostOfParts());
                    costPerHourSum = costPerHourSum.add(
                            order.getCostPerHour().multiply(new BigDecimal(order.getWorkHours())));
                    workHoursSum += order.getWorkHours();
                }

                request.setAttribute("costForClientSum", costForClientSum);
                request.setAttribute("costOfPartsSum", costOfPartsSum);
                request.setAttribute("costPerHourSum", costPerHourSum);
                request.setAttribute("workHoursSum", workHoursSum);

                getServletContext().getRequestDispatcher("/WEB-INF/view/reportGains.jsp").forward(request, response);
                break;
            default:
                doGet(request, response);
        }
    }
}
