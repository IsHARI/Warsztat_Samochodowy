package pl.coderslab.model.order;

import java.io.IOException;
import java.time.Instant;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.employee.Employee;
import pl.coderslab.model.employee.EmployeeDao;
import pl.coderslab.model.vehicle.Vehicle;
import pl.coderslab.model.vehicle.VehicleDao;

/**
 * Servlet implementation class OrderTest
 */
@WebServlet("/OrderTest")
public class OrderTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderTest() {
        super();
        // Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OrderDao orderDao = OrderDao.getInstance();
		@SuppressWarnings("unchecked")
		List<Order> all = (List<Order>) orderDao.selectAll();
		
		request.setAttribute("all", all);
		
		getServletContext().getRequestDispatcher("/WEB-INF/view/test/OrderTest.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String ids = request.getParameter("id");
		int id;
		try {
			id = Integer.parseInt(ids);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			id = 0;
		}
		
		switch (action) {
		case "select":
			request.setAttribute("byId", OrderDao.getInstance().selectById(id));
			break;
		case "insert":
			Instant takeInDate = Instant.parse(request.getParameter("takeInDate") + "T" + "00:00:00" + "Z");
			Instant plannedRepairBeginDate = Instant.parse(request.getParameter("plannedRepairBeginDate") + "T" + "00:00:00" + "Z");
			int employeeId = Integer.parseInt(request.getParameter("employeeId"));
			Employee employee = (Employee) EmployeeDao.getInstance().selectById(employeeId);
			String problemDescription = request.getParameter("problemDescription");
			int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
			Vehicle vehicle = (Vehicle) VehicleDao.getInstance().selectById(vehicleId);
			
			Order order = new Order(takeInDate, plannedRepairBeginDate, employee, problemDescription, vehicle);
			if(id!=0) {
				order.setId(id);
			}
						
			request.setAttribute("byId", order);
			OrderDao.getInstance().save(order);
			break;
		case "delete":
			OrderDao.getInstance().delete(id);
			break;
		default:
			break;
		}
		
		doGet(request, response);
	}

}
