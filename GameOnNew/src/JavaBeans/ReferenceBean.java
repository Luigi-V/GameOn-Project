package JavaBeans;

public class ReferenceBean {

	public ReferenceBean(){}
	
	private int orderCode, VideogameCode, quantity;

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public int getVideogameCode() {
		return VideogameCode;
	}

	public void setVideogameCode(int VideogameCode) {
		this.VideogameCode = VideogameCode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
