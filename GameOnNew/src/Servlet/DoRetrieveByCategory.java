package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import DAOPackage.VideogameDAO;
import JavaBeans.VideogameBean;


@WebServlet("/DoRetrieveByCategory")
public class DoRetrieveByCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoRetrieveByCategory() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("category");
		VideogameDAO catHandler = new VideogameDAO();
		ArrayList<VideogameBean> ret= null;
		try {
			ret = new ArrayList<VideogameBean>(catHandler.retrieveVideogameByFilter(category));
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		}
		
		request.setAttribute("searchRes", ret);
		request.getRequestDispatcher("/WEB-INF/jsp/searchresults.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}
	
	
	@SuppressWarnings("unused")
	private String toJSONCategoryObjects(ArrayList<VideogameBean> ret) {
		
		JSONArray arr = new JSONArray();
		JSONObject obj = null;
		
		for (VideogameBean c : ret) {
			obj = new JSONObject();
			obj.put("name", c.getTitle());
			obj.put("price", c.getPrice());
			obj.put("description", c.getDescription());
			obj.put("imgPath", c.getImgPath());
			arr.put(obj);
		}
		
		return arr.toString();
		
	}

}
