package pl.coderslab.model.employee;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmployeeTest
 */
@WebServlet("/EmployeeTest")
public class EmployeeTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeTest() {
        super();
        //  Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeDao employeeDao = EmployeeDao.getInstance();
		@SuppressWarnings("unchecked")
		List<Employee> all = (List<Employee>) employeeDao.selectAll();
		
		request.setAttribute("all", all);
		
		getServletContext().getRequestDispatcher("/WEB-INF/view/test/EmployeeTest.jsp").forward(request, response);
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
			request.setAttribute("byId", EmployeeDao.getInstance().selectById(id));
			break;
		case "insert":
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String note = request.getParameter("note");
			BigDecimal costPerHour = new BigDecimal(request.getParameter("costPerHour"));
			
			Employee employee = new Employee(firstName, lastName, address, phone, note, costPerHour);
			if(id!=0) {
				employee.setId(id);
			}
			
			request.setAttribute("byId", employee);
			EmployeeDao.getInstance().save(employee);
			break;
		case "delete":
			EmployeeDao.getInstance().delete(id);
			break;
		default:
			break;
		}
		
		doGet(request, response);
	}

}
