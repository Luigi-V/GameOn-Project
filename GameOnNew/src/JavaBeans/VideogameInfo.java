package JavaBeans;

public class VideogameInfo {
	private VideogameBean videogame;
	private int quantity;
	
	public VideogameInfo(VideogameBean Videogame,int quantity) {
		this.videogame=Videogame;
		this.quantity=quantity;
	}
	
	public VideogameBean getVideogame() {
		return videogame;
	}
	public int getQuantity() {
		return quantity;
	}
	
}
