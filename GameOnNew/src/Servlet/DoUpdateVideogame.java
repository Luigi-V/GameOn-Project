package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOPackage.VideogameDAO;
import JavaBeans.VideogameBean;

/**
 * Servlet implementation class DoUpdateVideogame
 */
@WebServlet("/DoUpdateVideogame")
public class DoUpdateVideogame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoUpdateVideogame() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int VideogameCode=Integer.parseInt(request.getParameter("VideogameCode"));
		int availability=Integer.parseInt(request.getParameter("availability"));
		
		VideogameDAO pDao=new VideogameDAO();
		VideogameBean prod=null;
		try {
			prod=pDao.doRetrieveVideogameByID(VideogameCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(prod==null) {
			request.setAttribute("response-update", "No such element in the database.");
			request.getRequestDispatcher("videogamepanel.jsp").forward(request, response);
			return;
		}
		
		prod.setAvailability(availability);
		try {
			pDao.doSaveOrUpdate(prod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("response-update", "Availability successfully updated.");
		request.getRequestDispatcher("videogamepanel.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
