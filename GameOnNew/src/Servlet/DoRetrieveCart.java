package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import DAOPackage.CartDAO;
import DAOPackage.VideogameDAO;

import JavaBeans.CartBean;
import JavaBeans.VideogameBean;
import JavaBeans.UserBean;

@WebServlet("/DoRetrieveCart")
public class DoRetrieveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DoRetrieveCart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sess=request.getSession();
		String userId=(String) sess.getAttribute("user");
		
		UserBean usr=new UserBean();
		usr.setUsername(userId);
		
		ArrayList<CartBean> cart=null;
		CartDAO cartDao=new CartDAO();
		try {
			cart=cartDao.doRetrieveAll_byUser(usr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String res=null;
		
		if(cart==null) {
			res="[]";
		}
		else {
			try {
				res=cartToJSON(cart);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		response.getWriter().write(res);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private String cartToJSON(ArrayList<CartBean> cart) throws SQLException {
		
		JSONArray arr=new JSONArray();
		JSONObject obj=null;
		for(CartBean c : cart) {
			
			VideogameDAO pDao=new VideogameDAO();
			VideogameBean prod=null;
			prod=pDao.doRetrieveVideogameByID(c.getVideogameCode());
			
			obj=new JSONObject();
			obj.put("imgPath", prod.getImgPath());
			obj.put("price", prod.getPrice());
			obj.put("title", prod.getTitle());
			obj.put("number", c.getQuantity());
			obj.put("shipment", prod.getShipment());
			obj.put("prodId", prod.getVideogameCode());
			
			arr.put(obj);
		}
		
		return arr.toString();
	}
	

}
