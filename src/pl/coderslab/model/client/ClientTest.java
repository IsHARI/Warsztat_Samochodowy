package pl.coderslab.model.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClientTest
 */
@WebServlet("/ClientTest")
public class ClientTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientTest() {
        super();
        // Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ClientDao clientDao = ClientDao.getInstance();
		@SuppressWarnings("unchecked")
		List<Client> all = (List<Client>) clientDao.selectAll();
		
		request.setAttribute("all", all);
		
		getServletContext().getRequestDispatcher("/WEB-INF/view/test/ClientTest.jsp").forward(request, response);;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		switch (action) {
		case "select":
			int id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("byId", ClientDao.getInstance().selectById(id));
			break;
		case "insert":
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			Client client = new Client(firstName, lastName, email, phone);
			request.setAttribute("byId", client);
			ClientDao.getInstance().save(client);
		default:
			break;
		}
		
		doGet(request, response);
	}

}
