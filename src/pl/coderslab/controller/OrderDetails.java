package pl.coderslab.controller;

import pl.coderslab.model.employee.Employee;
import pl.coderslab.model.employee.EmployeeDao;
import pl.coderslab.model.order.Order;
import pl.coderslab.model.order.OrderDao;
import pl.coderslab.model.vehicle.Vehicle;
import pl.coderslab.model.vehicle.VehicleDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/orderDetails")
public class OrderDetails extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Order order = (Order) OrderDao.getInstance().selectById(id);
            @SuppressWarnings("unchecked")
            List<Employee> employees = (List<Employee>) EmployeeDao.getInstance().selectAll();

            request.setAttribute("order", order);
            request.setAttribute("employees", employees);

            getServletContext().getRequestDispatcher("/WEB-INF/view/orderDetails.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
