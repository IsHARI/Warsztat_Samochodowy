package pl.coderslab.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.coderslab.model.employee.Employee;
import pl.coderslab.model.employee.EmployeeDao;
import pl.coderslab.model.order.Order;
import pl.coderslab.model.order.OrderDao;

/**
 * Servlet implementation class EmployeeDetails
 */
@WebServlet("/employeeDetails")
public class EmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			Employee employee = (Employee) EmployeeDao.getInstance().selectById(id);
			@SuppressWarnings("unchecked")
			List<Order> orders = (List<Order>) OrderDao.getInstance().selectByString("status='IN_REPAIR' AND employee_id=" + id + " ORDER BY repair_begin_date");
			
			request.setAttribute("employee", employee);
			request.setAttribute("orders", orders);
			
			getServletContext().getRequestDispatcher("/WEB-INF/view/employeeDetails.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String note = request.getParameter("note");
		BigDecimal costPerHour = new BigDecimal(request.getParameter("costPerHour"));
		
		Employee employee = new Employee(firstName, lastName, address, phone, note, costPerHour);
		employee.setId(id);
		
		request.setAttribute("byId", employee);
		EmployeeDao.getInstance().save(employee);
		
		doGet(request, response);
	}

}
