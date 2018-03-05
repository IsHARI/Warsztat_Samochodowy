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

/**
 * Servlet implementation class Employees
 */
@WebServlet("/employees")
public class Employees extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Employees() {
        super();
        //  Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		List<Employee> employees = (List<Employee>) EmployeeDao.getInstance().selectAll();
		
		request.setAttribute("employees", employees);
		
		getServletContext().getRequestDispatcher("/WEB-INF/view/employees.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String note = request.getParameter("note");
		BigDecimal costPerHour = new BigDecimal(request.getParameter("costPerHour"));
		
		Employee employee = new Employee(firstName, lastName, address, phone, note, costPerHour);
		EmployeeDao.getInstance().save(employee);
		
		doGet(request, response);
	}

}
