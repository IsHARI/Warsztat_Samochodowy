package pl.coderslab.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.vehicle.Vehicle;
import pl.coderslab.model.vehicle.VehicleDao;

/**
 * Servlet implementation class VehicleDelete
 */
@WebServlet("/vehicleDelete")
public class VehicleDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleDelete() {
        super();
        // Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("clients");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Vehicle vehicle = (Vehicle) VehicleDao.getInstance().selectById(id);
		int client_id = vehicle.getOwner().getId();
		VehicleDao.getInstance().delete(id);
		response.sendRedirect("clientDetails?id=" + client_id);
	}

}
