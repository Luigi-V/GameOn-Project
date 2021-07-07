package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOPackage.VideogameDAO;
import JavaBeans.VideogameBean;


@WebServlet("/DoSearch")
public class DoSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DoSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		doPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userinput= request.getParameter("searchBar");
		VideogameDAO handler = new VideogameDAO();
		ArrayList<VideogameBean> ret = null;
		
		try {
			ret= new ArrayList<VideogameBean>(handler.retrieveVideogameByStringName(userinput));
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		request.setAttribute("searchRes", ret);
		request.getRequestDispatcher("/WEB-INF/jsp/searchresults.jsp").forward(request, response);
		
	}

}
