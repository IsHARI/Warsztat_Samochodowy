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
import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

@WebServlet("/orderDetails")
public class OrderDetails extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Order order = (Order) OrderDao.getInstance().selectById(id);
            @SuppressWarnings("unchecked")
            List<Employee> employees = (List<Employee>) EmployeeDao.getInstance().selectAll();
            @SuppressWarnings("unchecked")
            List<Vehicle> vehicles = (List<Vehicle>) VehicleDao.getInstance().selectAll();

            request.setAttribute("order", order);
            request.setAttribute("employees", employees);
            request.setAttribute("vehicles", vehicles);

            getServletContext().getRequestDispatcher("/WEB-INF/view/orderDetails.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order order = (Order) OrderDao.getInstance().selectById(id);
        String takeInDay = request.getParameter("takeInDay");

        if(takeInDay != null) { // Edit
            switch (order.getStatus()) {
                case CANCELLED:
                case DONE:
                    String repairEndDay = request.getParameter("repairEndDay");
                    String repairEndTime = request.getParameter("repairEndTime");
                    Instant repairEndDate = Instant.parse(repairEndDay + "T" + repairEndTime + ":00Z");
                    order.setRepairEndDate(repairEndDate);

                    String repairDescription = request.getParameter("repairDescription");
                    order.setRepairDescription(repairDescription);

                    int workHours = Integer.parseInt(request.getParameter("workHours"));
                    order.setWorkHours(workHours);
                case IN_REPAIR:
                    String repairBeginDay = request.getParameter("repairBeginDay");
                    String repairBeginTime = request.getParameter("repairBeginTime");
                    Instant repairBeginDate = Instant.parse(repairBeginDay + "T" + repairBeginTime + ":00Z");
                    order.setRepairBeginDate(repairBeginDate);
                case COSTS_APPROVED:
                    BigDecimal costForClient = new BigDecimal(request.getParameter("costForClient"));
                    order.setCostForClient(costForClient);
                    BigDecimal costOfParts = new BigDecimal(request.getParameter("costOfParts"));
                    order.setCostOfParts(costOfParts);
                case TAKEN_IN:
                    String takeInTime = request.getParameter("takeInTime");
                    Instant takeInDate = Instant.parse(takeInDay + "T" + takeInTime + ":00Z");
                    order.setTakeInDate(takeInDate);

                    String plannedRepairBeginDay = request.getParameter("plannedRepairBeginDay");
                    String plannedRepairBeginTime = request.getParameter("plannedRepairBeginTime");
                    Instant plannedRepairBeginDate = Instant.parse(plannedRepairBeginDay + "T" + plannedRepairBeginTime + ":00Z");
                    order.setPlannedRepairBeginDate(plannedRepairBeginDate);

                    int employeeId = Integer.parseInt(request.getParameter("employeeId"));
                    Employee employee = (Employee) EmployeeDao.getInstance().selectById(employeeId);
                    order.setEmployee(employee);
                    order.setCostPerHour(employee.getCostPerHour());

                    int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
                    Vehicle vehicle = (Vehicle) VehicleDao.getInstance().selectById(vehicleId);
                    order.setVehicle(vehicle);

                    String problemDescription = request.getParameter("problemDescription");
                    order.setProblemDescription(problemDescription);
            }

            OrderDao.getInstance().save(order);

            doGet(request,response);
        } else { // Advance
            switch (order.getStatus()) {
                case IN_REPAIR:
                    String repairEndDay = request.getParameter("repairEndDay");
                    String repairEndTime = request.getParameter("repairEndTime");
                    Instant repairEndDate = Instant.parse(repairEndDay + "T" + repairEndTime + ":00Z");
                    order.setRepairEndDate(repairEndDate);

                    String repairDescription = request.getParameter("repairDescription");
                    order.setRepairDescription(repairDescription);

                    int workHours = Integer.parseInt(request.getParameter("workHours"));
                    order.setWorkHours(workHours);

                    order.setStatus(Order.Status.DONE);
                    break;
                case COSTS_APPROVED:
                    String repairBeginDay = request.getParameter("repairBeginDay");
                    String repairBeginTime = request.getParameter("repairBeginTime");
                    Instant repairBeginDate = Instant.parse(repairBeginDay + "T" + repairBeginTime + ":00Z");
                    order.setRepairBeginDate(repairBeginDate);

                    order.setStatus(Order.Status.IN_REPAIR);
                    break;
                case TAKEN_IN:
                    BigDecimal costForClient = new BigDecimal(request.getParameter("costForClient"));
                    order.setCostForClient(costForClient);
                    BigDecimal costOfParts = new BigDecimal(request.getParameter("costOfParts"));
                    order.setCostOfParts(costOfParts);

                    order.setStatus(Order.Status.COSTS_APPROVED);
                    break;
            }

            OrderDao.getInstance().save(order);

            doGet(request, response);
        }
    }
}
