package pl.coderslab.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
