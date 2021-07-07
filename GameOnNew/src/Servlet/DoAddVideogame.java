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
 * Servlet implementation class DoAddVideogame
 */
@WebServlet("/DoAddVideogame")
public class DoAddVideogame extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoAddVideogame() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String title, description, console, imgPath;
		double price;
		int availability, shipment;
		
		title=request.getParameter("title");
		description=request.getParameter("description");
		console=request.getParameter("Console");
		imgPath=request.getParameter("imgPath");
		price=Double.parseDouble(request.getParameter("price"));
		
		availability=Integer.parseInt(request.getParameter("availability"));
		shipment=Integer.parseInt(request.getParameter("shipment"));
		
		VideogameDAO pDao=new VideogameDAO();
		VideogameBean pBean= new VideogameBean();
		
		pBean.setAvailability(availability);
		pBean.setDescription(description);
		pBean.setImgPath(imgPath);
		pBean.setPrice(price);
		
		pBean.setShipment(shipment);
		pBean.setConsole(console);
		pBean.setTitle(title);
		
		try {
			pDao.doSave(pBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("response-add", "Object added with success!");
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
