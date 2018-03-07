package pl.coderslab.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.client.Client;
import pl.coderslab.model.client.ClientDao;

/**
 * Servlet implementation class Clients
 */
@WebServlet("/clients")
public class Clients extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Clients() {
        super();
        // Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getAttribute("clients") == null) {
			@SuppressWarnings("unchecked")
			List<Client> clients = (List<Client>) ClientDao.getInstance().selectAll();
			request.setAttribute("clients", clients);
		}
		
		getServletContext().getRequestDispatcher("/WEB-INF/view/clients.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("name") == null) {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			Client client = new Client(firstName, lastName, email, phone);
			ClientDao.getInstance().save(client);
		} else {
			String name = request.getParameter("name");
			
			@SuppressWarnings("unchecked")
			List<Client> clients = (List<Client>) ClientDao.getInstance().selectByString("WHERE first_name LIKE '%" + name + "%' OR last_name LIKE '%" + name + "%'");
			request.setAttribute("clients", clients);
		}
		
		doGet(request, response);
	}

}
