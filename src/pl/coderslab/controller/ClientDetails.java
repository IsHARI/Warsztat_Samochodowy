package pl.coderslab.controller;

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
import pl.coderslab.model.vehicle.Vehicle;
import pl.coderslab.model.vehicle.VehicleDao;

/**
 * Servlet implementation class ClientDetails
 */
@WebServlet("/clientDetails")
public class ClientDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			Client client = (Client) ClientDao.getInstance().selectById(id);
			@SuppressWarnings("unchecked")
			List<Vehicle> vehicles = (List<Vehicle>) VehicleDao.getInstance().selectByString("WHERE client_id=" + id);
			
			request.setAttribute("client", client);
			request.setAttribute("vehicles", vehicles);
			
			getServletContext().getRequestDispatcher("/WEB-INF/view/clientDetails.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		if(request.getParameter("model") == null) {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			Client client = new Client(firstName, lastName, email, phone);
			client.setId(id);
			ClientDao.getInstance().save(client);
		} else {
			String model = request.getParameter("model");
			int yearOfProduction = Integer.parseInt(request.getParameter("yearOfProduction"));
			String licenceNumber = request.getParameter("licenceNumber");
			String nextInspectionDay = request.getParameter("nextInspectionDay");
			String nextInspectionTime = request.getParameter("nextInspectionTime");
			Instant nextInspectionDate = Instant.parse(nextInspectionDay + "T" + nextInspectionTime + ":00Z");
			
			Vehicle vehicle = new Vehicle(model, yearOfProduction, licenceNumber, nextInspectionDate, (Client) ClientDao.getInstance().selectById(id));
			VehicleDao.getInstance().save(vehicle);
		}
		
		doGet(request, response);
	}

}
