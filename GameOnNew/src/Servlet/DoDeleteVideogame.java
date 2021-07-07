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
 * Servlet implementation class DoDeleteVideogame
 */
@WebServlet("/DoDeleteVideogame")
public class DoDeleteVideogame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoDeleteVideogame() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int VideogameCode=Integer.parseInt(request.getParameter("VideogameCode"));
		VideogameDAO pDao=new VideogameDAO();
		VideogameBean prod=null;
		
		try {
			prod=pDao.doRetrieveVideogameByID(VideogameCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(prod==null) {
			request.setAttribute("response-delete","No such element in the database");
			request.getRequestDispatcher("videogamepanel.jsp").forward(request, response);
			return;
		}
		
		try {
			pDao.doDelete(prod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("response-delete","Element successfully deleted!");
		request.getRequestDispatcher("videogamepanel.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
