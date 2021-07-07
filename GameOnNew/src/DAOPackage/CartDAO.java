package DAOPackage;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DBPackage.DatabaseConnector;
import JavaBeans.CartBean;
import JavaBeans.UserBean;

public class CartDAO {

	//salva CartBean nel database
	public void doSave(CartBean cart) throws SQLException {

		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("insert into Carrello values (?, ?, ?)");

		state.setString(1, cart.getUserCode());
		state.setInt(2, cart.getVideogameCode());
		state.setInt(3, cart.getQuantity());
		
		state.executeUpdate();
		connector.closeConnection();

	}

	public void doSaveOrUpdate(CartBean cart) throws SQLException {
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement state = null;
		state = connector.getJdbcConnection()
				.prepareStatement("SELECT utente,Videogioco FROM Carrello WHERE utente = ? AND Videogioco= ?");
		state.setString(1, cart.getUserCode());
		state.setInt(2, cart.getVideogameCode());
		ResultSet container = state.executeQuery();
		PreparedStatement myState = null;
		if(container.next()==false) {
			myState = connector.getJdbcConnection()
					.prepareStatement("insert into Carrello (utente, Videogioco, quantita) values (?, ?, ?)");
			myState.setString(1, cart.getUserCode());
			myState.setInt(2, cart.getVideogameCode());
			myState.setInt(3, cart.getQuantity());
			myState.executeUpdate();
		}
		else {
			myState = connector.getJdbcConnection()
					.prepareStatement("update Carrello set utente=? , Videogioco=? ,quantita=? where utente=? AND Videogioco=?");
			myState.setString(1, cart.getUserCode());
			myState.setInt(2, cart.getVideogameCode());
			myState.setInt(3, cart.getQuantity());
			myState.setString(4, cart.getUserCode());
			myState.setInt(5, cart.getVideogameCode());
			
			myState.executeUpdate();
		}
		connector.closeConnection();
		
	}
	
	//elimina il CartBean
	public void doDelete(CartBean cart) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement deleteRecord = connector.getJdbcConnection()
				.prepareStatement("delete from Carrello where utente = ? AND Videogioco = ?");
		
		deleteRecord.setString(1, cart.getUserCode());
		deleteRecord.setInt(2, cart.getVideogameCode());
		deleteRecord.executeUpdate();
		connector.closeConnection();
	}
	
	//restituisce tutti gli CartBean del database
	public ArrayList<CartBean> doRetrieveAll_byUser(UserBean user) throws SQLException{
		DatabaseConnector connector = new DatabaseConnector();
		connector.startConnection();
		PreparedStatement stateAll = connector.getJdbcConnection()
				.prepareStatement("SELECT * FROM Carrello WHERE utente = ?");
		stateAll.setString(1, user.getUsername());
		ResultSet container = stateAll.executeQuery();
		ArrayList<CartBean> allBeans = new ArrayList<CartBean>();
		
		while(container.next()==true) {
			
			String username = container.getString("utente");
			int videogioco = container.getInt("Videogioco");
			int quantity = container.getInt("quantita");
			CartBean cartToReturn = new CartBean();
			cartToReturn.setUserCode(username);
			cartToReturn.setVideogameCode(videogioco);
			cartToReturn.setQuantity(quantity);
			allBeans.add(cartToReturn);

		}
			
		if (allBeans.size()==0) {
			connector.closeConnection();
			return null;
		}
		
		connector.closeConnection();
		return allBeans;
		
	}
	
	public CartBean retrievebyId(String userId,int VideogameId) throws SQLException {
		CartBean prod=null;
		DatabaseConnector conn=new DatabaseConnector();
		conn.startConnection();
		PreparedStatement stateAll = conn.getJdbcConnection()
				.prepareStatement("SELECT * FROM Carrello WHERE utente = ? AND Videogioco= ?");
		stateAll.setString(1, userId);
		stateAll.setInt(2,VideogameId);
		ResultSet container = stateAll.executeQuery();
		if(container.next()!=false) {
			String userCode=container.getString("utente");
			int VideogameCode=container.getInt("Videogioco"), quantity=container.getInt("quantita");
			
			prod=new CartBean();
			prod.setVideogameCode(VideogameCode);
			prod.setUserCode(userCode);
			prod.setQuantity(quantity);
			
		}
			
		conn.closeConnection();
		return prod;
		
		
	}
	
}