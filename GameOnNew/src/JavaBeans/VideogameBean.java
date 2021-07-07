package JavaBeans;

public class VideogameBean {

	public VideogameBean() {}
	
	private String title, description, console, imgPath;
	private double price;
	private int VideogameCode, availability, shipment;
	
	public int getVideogameCode() {
		return VideogameCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getConsole() {
		return console;
	}
	public void setConsole(String Console) {
		this.console = Console;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getAvailability() {
		return availability;
	}
	public void setAvailability(int availability) {
		this.availability = availability;
	}
	public int getShipment() {
		return shipment;
	}
	public void setShipment(int shipment) {
		this.shipment = shipment;
	}
	
	@Override
	public String toString() {
		return "VideogameBean [title=" + title + ", description=" + description + ", Console=" + console + ", imgPath="
				+ imgPath + ", price=" + price + ", VideogameCode=" + VideogameCode + ", availability=" + availability
				+ ", shipment=" + shipment + "]";
	}
	/*ATTENZIONE: IMPOSTARE IL Videogame CODE POTREBBE CREARE PROBLEMI SICCOME È PRESENTE L'AUTO_INCREMENT*/
	public void setVideogameCode(int VideogameCode) {
		this.VideogameCode = VideogameCode;
	}
	
}
