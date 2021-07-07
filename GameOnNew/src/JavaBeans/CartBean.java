package JavaBeans;

public class CartBean {

	public CartBean() {}
	
	private String userCode;
	private int VideogameCode, quantity;

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
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
