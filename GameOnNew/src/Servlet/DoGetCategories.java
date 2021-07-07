package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import DAOPackage.VideogameDAO;
import JavaBeans.VideogameBean;

@WebServlet("/DoGetCategories")
public class DoGetCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public DoGetCategories() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VideogameDAO pDao=new VideogameDAO();
		ArrayList<VideogameBean> prods=null;
		
		try {
			prods=pDao.doRetrieveAll(); //getting all Videogames
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String json=toJSONCategories(prods);
		
		//System.out.println(json);
		response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String toJSONCategories(ArrayList<VideogameBean> prods) {
		HashSet<String> categories=new HashSet<String>(); 	//it will contains all console
		for(VideogameBean p : prods) {
			String category=p.getConsole();
			categories.add(category); 						//adding all console
		}
		
		JSONArray arr=new JSONArray();
		
		for(String s : categories) {
			arr.put(s);
		}
		return arr.toString();
	}
}
