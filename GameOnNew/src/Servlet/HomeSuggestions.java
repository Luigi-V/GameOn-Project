package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import DAOPackage.VideogameDAO;
import JavaBeans.VideogameBean;

@WebServlet("/HomeSuggestions")
public class HomeSuggestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeSuggestions() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Crea un oggetto Videogame DAO
		VideogameDAO prod=new VideogameDAO();
		ArrayList<VideogameBean> all=null;
		
		try {
			//L'arraylist conterrà tutti i videogiochi
			all=prod.doRetrieveAll();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//Viene creata una stringa che conterrà i 6 videogiochi che dovranno apparire sulla home in maniera casuale
		String json=getJSONSuggestions(all);
		response.getWriter().write(json);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	//Metodi
	private String getJSONSuggestions(ArrayList<VideogameBean> prod) {
		Random index=new Random();
		JSONArray arr=new JSONArray();
		
		//Rimarranno solo 6 videogiochi
		while(prod.size()>6) {
			prod.remove(index.nextInt(prod.size()));
		}
		
		//Metodo che genera i videogiochi in ordine casuale
		VideogameBean[] vec=shuffle(prod);
		for(VideogameBean b : vec) {
			JSONObject obj=new JSONObject();
			double price;
			String title, imgPath;
			price=b.getPrice();
			title=b.getTitle();
			imgPath=b.getImgPath();
			int VideogameCode=b.getVideogameCode();
			obj.put("price", price);
			obj.put("title", title);
			obj.put("imgPath", imgPath);
			obj.put("VideogameCode", VideogameCode);
			arr.put(obj);
		}
		
		return arr.toString();
	}
	
	private VideogameBean[] shuffle(ArrayList<VideogameBean> prod) {
		Random index=new Random();
		int len=prod.size();
		VideogameBean[] arr=(VideogameBean[]) prod.toArray(new VideogameBean[prod.size()]);
		for(int i=0;i<len;i++) {
			int j=index.nextInt(len);
			while(i==j) {
				j=index.nextInt(len);
			}
			VideogameBean temp=arr[i];
			arr[i]=arr[j];
			arr[j]=temp;
		}
		return arr;
	}

}
