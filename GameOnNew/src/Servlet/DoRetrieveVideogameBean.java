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
 * Servlet implementation class DoRetrieveJSONVideogame
 */
@WebServlet("/DoRetrieveVideogameBean")
public class DoRetrieveVideogameBean extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoRetrieveVideogameBean() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int VideogameId=Integer.parseInt(request.getParameter("VideogameId"));
		VideogameDAO pDao=new VideogameDAO();
		VideogameBean prod=null;
		
		try {
			prod=pDao.doRetrieveVideogameByID(VideogameId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("Videogame", prod);
		request.getRequestDispatcher("/WEB-INF/jsp/videogame.jsp").forward(request, response);
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
