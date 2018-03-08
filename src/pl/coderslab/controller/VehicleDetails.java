package pl.coderslab.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.Instant;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.client.Client;
import pl.coderslab.model.client.ClientDao;
import pl.coderslab.model.employee.Employee;
import pl.coderslab.model.employee.EmployeeDao;
import pl.coderslab.model.order.Order;
import pl.coderslab.model.order.OrderDao;
import pl.coderslab.model.vehicle.Vehicle;
import pl.coderslab.model.vehicle.VehicleDao;

/**
 * Servlet implementation class VehicleDetails
 */
@WebServlet("/vehicleDetails")
public class VehicleDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleDetails() {
        super();
        //  Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			Vehicle vehicle = (Vehicle) VehicleDao.getInstance().selectById(id);
			@SuppressWarnings("unchecked")
			List<Order> orders = (List<Order>) OrderDao.getInstance().selectByString("WHERE vehicle_id=" + id + " ORDER BY repair_begin_date DESC");
			
			request.setAttribute("vehicle", vehicle);
			request.setAttribute("orders", orders);
			
			getServletContext().getRequestDispatcher("/WEB-INF/view/vehicleDetails.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String takeInDay = request.getParameter("takeInDay");
		
		if(takeInDay == null) {
			String model = request.getParameter("model");
			int yearOfProduction = Integer.parseInt(request.getParameter("yearOfProduction"));
			String licenceNumber = request.getParameter("licenceNumber");
			
			String nextInspectionDay = request.getParameter("nextInspectionDay");
			String nextInspectionTime = request.getParameter("nextInspectionTime");
			Instant nextInspectionDate = Instant.parse(nextInspectionDay + "T" + nextInspectionTime + ":00Z");
			
			Client client = ((Vehicle) VehicleDao.getInstance().selectById(id)).getOwner();
			
			Vehicle vehicle = new Vehicle(model, yearOfProduction, licenceNumber, nextInspectionDate, client);
			vehicle.setId(id);
			VehicleDao.getInstance().save(vehicle);
		} else {
			String takeInTime = request.getParameter("takeInTime");
			Instant takeInDate = Instant.parse(takeInDay + "T" + takeInTime + ":00Z");
			
			String plannedRepairBeginDay = request.getParameter("plannedRepairBeginDay");
			String plannedRepairBeginTime = request.getParameter("plannedRepairBeginTime");
			Instant plannedRepairBeginDate = Instant.parse(plannedRepairBeginDay + "T" + plannedRepairBeginTime + ":00Z");
			
			int employeeId = Integer.parseInt(request.getParameter("employeeId"));
			Employee employee = (Employee) EmployeeDao.getInstance().selectById(employeeId);
			
			String problemDescription = request.getParameter("problemDescription");
			
			Vehicle vehicle = (Vehicle) VehicleDao.getInstance().selectById(id);
			
			Order order = new Order(takeInDate, plannedRepairBeginDate, employee, problemDescription, vehicle);
			OrderDao.getInstance().save(order);
		}
		
		doGet(request, response);
	}

}
