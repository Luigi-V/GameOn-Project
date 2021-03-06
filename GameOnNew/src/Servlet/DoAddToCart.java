package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOPackage.CartDAO;
import DAOPackage.VideogameDAO;
import JavaBeans.CartBean;
import JavaBeans.VideogameBean;

/**
 * Servlet implementation class DoAddToCart
 */
@WebServlet("/DoAddToCart")
public class DoAddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoAddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sess=request.getSession();
		String usrId=(String) sess.getAttribute("user");
		int prodId=Integer.parseInt(request.getParameter("prodId"));
		int number=Integer.parseInt(request.getParameter("number"));
		
		VideogameDAO pDao=new VideogameDAO();
		VideogameBean pBean=null;
		try {
			pBean=pDao.doRetrieveVideogameByID(prodId);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(pBean.getAvailability()-number<0 || number<=0) {
			request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
			return;
		}
		
		pBean.setAvailability(pBean.getAvailability()-number);
		try {
			pDao.doSaveOrUpdate(pBean);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		CartDAO cart=new CartDAO();
		CartBean prod=null;
		try {
			prod = cart.retrievebyId(usrId,prodId);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(prod!=null) {
			prod.setQuantity(prod.getQuantity()+number);
		}
		else {
			prod=new CartBean();
			prod.setVideogameCode(prodId);
			prod.setUserCode(usrId);
			prod.setQuantity(number);
		}
			
		
		try {
			cart.doSaveOrUpdate(prod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("index.jsp");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
