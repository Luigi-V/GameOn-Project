package JavaBeans;

import java.util.ArrayList;

public class OrderPairing {
	private OrderBean order;
	private ArrayList<VideogameInfo> Videogames;
	
	public OrderPairing(OrderBean order,ArrayList<VideogameInfo> Videogames) {
		this.order=order;
		this.Videogames=Videogames;
	}

	public OrderBean getOrder() {
		return order;
	}

	public ArrayList<VideogameInfo> getVideogames() {
		return Videogames;
	}
	
	

}
