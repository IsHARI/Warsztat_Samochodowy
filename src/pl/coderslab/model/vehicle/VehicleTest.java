package pl.coderslab.model.vehicle;

import java.io.IOException;
import java.time.Instant;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.client.Client;
import pl.coderslab.model.client.ClientDao;

/**
 * Servlet implementation class VehicleTest
 */
@WebServlet("/VehicleTest")
public class VehicleTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleTest() {
        super();
        // Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VehicleDao vehicleDao = VehicleDao.getInstance();
		@SuppressWarnings("unchecked")
		List<Vehicle> all = (List<Vehicle>) vehicleDao.selectAll();
		
		request.setAttribute("all", all);
		
		getServletContext().getRequestDispatcher("/WEB-INF/view/test/VehicleTest.jsp").forward(request, response);
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
			request.setAttribute("byId", VehicleDao.getInstance().selectById(id));
			break;
		case "insert":
			String model = request.getParameter("model");
			int yearOfProduction = Integer.parseInt(request.getParameter("yearOfProduction"));
			String licenceNumber = request.getParameter("licenceNumber");
			String nextInspectionDate = request.getParameter("nextInspectionDate");
			String nextInspectionTime = request.getParameter("nextInspectionTime");
			Instant nextInspectionInstant = Instant.parse(nextInspectionDate + "T" + nextInspectionTime + ":00" + "Z");
			int ownerId = Integer.parseInt(request.getParameter("ownerId"));
			Client owner = (Client) ClientDao.getInstance().selectById(ownerId);
			
			Vehicle vehicle = new Vehicle(model, yearOfProduction, licenceNumber, nextInspectionInstant, owner);
			if(id!=0) {
				vehicle.setId(id);
			}
						
			request.setAttribute("byId", vehicle);
			VehicleDao.getInstance().save(vehicle);
			break;
		case "delete":
			VehicleDao.getInstance().delete(id);
			break;
		default:
			break;
		}
		
		doGet(request, response);
	}

}
