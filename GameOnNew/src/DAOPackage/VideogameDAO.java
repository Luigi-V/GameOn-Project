package DAOPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPackage.DatabaseConnector;
import JavaBeans.VideogameBean;

public class VideogameDAO {

	/*
	 * Nel caso si debba eliminare un prodotto in base al suo codice, basta istanziare un VideogameBean dandogli solo il valore codice prodotto
	 * */
	
	//salva VideogameBean nel database
	public void doSave(VideogameBean prod) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("insert into Videogioco values (?, ?, ?, ?, ?, ?, ?, ?)");

		state.setInt(1, prod.getVideogameCode());
		state.setString(2, prod.getTitle());
		state.setString(3, prod.getDescription());
		state.setString(4, prod.getConsole());
		state.setDouble(5, prod.getPrice());
		state.setInt(6, prod.getAvailability());
		state.setInt(7, prod.getShipment());
		state.setString(8, prod.getImgPath());
		state.executeUpdate();
		connector.closeConnection();

	}
	
	//salva VideogameBean nel database: se esiste gi�, lo sovrascrive
	public void doSaveOrUpdate(VideogameBean prod) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("SELECT codiceVideogioco FROM Videogioco WHERE codiceVideogioco LIKE ?");
		state.setInt(1, prod.getVideogameCode());
		ResultSet result = state.executeQuery();
		if (result.next()==false) {
			//nel caso non esista il record
			PreparedStatement myState = null;
			myState = connector.getJdbcConnection()
					.prepareStatement("insert into Videogioco values (?, ?, ?, ?, ?, ?, ?, ?)");

			myState.setInt(1, prod.getVideogameCode());
			myState.setString(2, prod.getTitle());
			myState.setString(3, prod.getDescription());
			myState.setString(4, prod.getConsole());
			myState.setDouble(5, prod.getPrice());
			myState.setInt(6, prod.getAvailability());
			myState.setInt(7, prod.getShipment());
			myState.setString(8, prod.getImgPath());
			myState.executeUpdate();
		} else {
			//nel caso gi� esista va aggiornato
			PreparedStatement myState = connector.getJdbcConnection()
					.prepareStatement("update Videogioco set codiceVideogioco = ? , titolo = ? , descrizione = ? , console = ? , prezzo = ? , disponibilita = ? , spedizione = ? , imgPath = ? where codiceVideogioco = ?");
			myState.setInt(1, prod.getVideogameCode());
			myState.setString(2, prod.getTitle());
			myState.setString(3, prod.getDescription());
			myState.setString(4, prod.getConsole());
			myState.setDouble(5, prod.getPrice());
			myState.setInt(6, prod.getAvailability());
			myState.setInt(7, prod.getShipment());
			myState.setString(8, prod.getImgPath());
			myState.setInt(9, prod.getVideogameCode());
			myState.executeUpdate();
		}
		connector.closeConnection();
	}

	//elimina lo VideogameBean
	public void doDelete(VideogameBean prod) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement deleteRecord = connector.getJdbcConnection()
				.prepareStatement("delete from Videogioco where codiceVideogioco = ?");
		
		deleteRecord.setInt(1, prod.getVideogameCode());
		deleteRecord.executeUpdate();
		connector.closeConnection();
	}
	
	//restituisce tutti gli VideogameBean del database
	public ArrayList<VideogameBean> doRetrieveAll() throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Videogioco");
		ResultSet container = stateAll.executeQuery();
		ArrayList<VideogameBean> allBeans = new ArrayList<VideogameBean>();
		
		while(container.next()==true) {
			
			int codiceVideogioco = container.getInt("codiceVideogioco");
			String titolo = container.getString("titolo");
			String descrizione = container.getString("descrizione");
			String console = container.getString("console");
			double prezzo = container.getDouble("prezzo");
			int disp = container.getInt("disponibilita");
			int spedizione = container.getInt("spedizione");
			String imgPath = container.getString("imgPath");
			VideogameBean prod = new VideogameBean();
			prod.setVideogameCode(codiceVideogioco);
			prod.setTitle(titolo);
			prod.setDescription(descrizione);
			prod.setConsole(console);
			prod.setPrice(prezzo);
			prod.setAvailability(disp);
			prod.setShipment(spedizione);
			prod.setImgPath(imgPath);
			allBeans.add(prod);
			
		}
			
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
		
	}
	
	public VideogameBean doRetrieveVideogameByID(int i) throws SQLException {
		VideogameBean prod=null;
		DatabaseConnector conn=new DatabaseConnector();
		conn.startConnection();
		PreparedStatement stateAll = conn.getJdbcConnection()
				.prepareStatement("SELECT * FROM Videogioco WHERE codiceVideogioco = ?");
		stateAll.setInt(1, i);
		ResultSet container = stateAll.executeQuery();
		if(container.next()!=false) {
			int VideogameCode=container.getInt("codiceVideogioco");
			String title=container.getString("titolo"), description=container.getString("descrizione"), Console=container.getString("console"), imgPath=container.getString("imgPath");
			double price=container.getDouble("prezzo");
			int availability=container.getInt("disponibilita"), shipment=container.getInt("spedizione");
			prod=new VideogameBean();
			prod.setVideogameCode(VideogameCode);
			prod.setTitle(title);
			prod.setDescription(description);
			prod.setConsole(Console);
			prod.setImgPath(imgPath);
			prod.setPrice(price);
			prod.setAvailability(availability);
			prod.setShipment(shipment);
		}
			
		return prod;
	}
	
	
	public ArrayList<VideogameBean> retrieveVideogameByFilter(String category) throws SQLException {
		
		ArrayList<VideogameBean> res = new ArrayList<VideogameBean>();
		DatabaseConnector conn=new DatabaseConnector();
		conn.startConnection();
		PreparedStatement stateAll = conn.getJdbcConnection().prepareStatement("SELECT * FROM Videogioco WHERE console LIKE ?");
		stateAll.setString(1, category);
		ResultSet container = stateAll.executeQuery();
		VideogameBean prod = null;
		while(container.next()) {
			
			int VideogameCode=container.getInt("codiceVideogioco");
			String title=container.getString("titolo"), description=container.getString("descrizione"), Console=container.getString("console"), imgPath=container.getString("imgPath");
			double price=container.getDouble("prezzo");
			int availability=container.getInt("disponibilita"), shipment=container.getInt("spedizione");
			prod=new VideogameBean();
			prod.setVideogameCode(VideogameCode);
			prod.setTitle(title);
			prod.setDescription(description);
			prod.setConsole(Console);
			prod.setImgPath(imgPath);
			prod.setPrice(price);
			prod.setAvailability(availability);
			prod.setShipment(shipment);
			
			res.add(prod);
			
		}
		return res;
		
	}
	
	
	
	public ArrayList<VideogameBean> retrieveVideogameByStringName(String input) throws SQLException {
		
		ArrayList<VideogameBean> res = new ArrayList<VideogameBean> ();
		VideogameBean prod = null;
		DatabaseConnector conn=new DatabaseConnector();
		conn.startConnection();
		PreparedStatement stateAll = conn.getJdbcConnection().prepareStatement("SELECT * FROM Videogioco WHERE titolo LIKE '"+input+"%' ");
		ResultSet container = stateAll.executeQuery();
		
		
		 while(container.next()) {
			
			int VideogameCode=container.getInt("codiceVideogioco");
			String title=container.getString("titolo"), description=container.getString("descrizione"), Console=container.getString("console"), imgPath=container.getString("imgPath");
			double price=container.getDouble("prezzo");
			int availability=container.getInt("disponibilita"), shipment=container.getInt("spedizione");
			prod=new VideogameBean();
			prod.setVideogameCode(VideogameCode);
			prod.setTitle(title);
			prod.setDescription(description);
			prod.setConsole(Console);
			prod.setImgPath(imgPath);
			prod.setPrice(price);
			prod.setAvailability(availability);
			prod.setShipment(shipment);
			
			res.add(prod);
			
			
		}
		
		return res;
		 
	}
	
}