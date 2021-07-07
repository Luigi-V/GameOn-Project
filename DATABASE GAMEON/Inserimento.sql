use dbgameon;

/*
	INSERIMENTO DEGLI UTENTI
*/

	insert into Utente values ("userTest", "Password1", "Name", "Surname", "My Address, 1", "City", "11111", "Nation", "3930967821", "usertest@gmail.com", FALSE, TRUE);
    insert into Utente values ("Alessanos", "Alessandro98", "Alessandro", "Agnello", "Via dello schiocco, 6", "Titano", "11111", "Galassia", "39257894574", "alessanos@gmail.com", FALSE, TRUE);
    insert into Utente values ("Dottor V.", "Luigi98", "Luigi", "Vollono", "Santa Santorum, 30", "New York", "11111", "America", "3245723200", "dottorv@gmail.com", FALSE, TRUE);
	insert into Utente values ("adminTest", "Password1", "Name", "Surname", "My Address, 1", "City", "11111", "Nation", "3930967821", "admintest@gmail.com", TRUE, TRUE);

/*
	INSERIMENTO DEI PRODOTTI
*/

	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Red Dead Redemption 2", "AVVENTURA, Gioco far west", "PS4", 70.00, 100, 8, "./images/RDR2.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Monster Hunter", "RPG, azione", "XboxOne", 50.00, 12, 8, "./images/MHW.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Fifa 19", "SPORT, gioco di calcio", "PS4", 30.00, 87, 7, "./images/FIFA.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Pokemon Let's Go Pikachu", "RUOLO, gioco di avventura", "Switch", 50.00, 74, 10, "./images/POKEMON.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Tomb Raider", "SPARATUTTO, gioco di avventura", "XboxOne", 80.00, 147, 10, "./images/TB.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Mario Kart", "SIMULATORE, gioco di guida", "Switch", 20.00, 86, 6, "./images/MK.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Formula 1", "SIMULATORE, gioco di guida", "PS4", 70.00, 74, 10, "./images/F1.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Assassin's Creed", "AVVENTURA, gioco di ruolo", "XboxOne", 120.00, 147, 10, "./images/AC.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Zelda", "FANTASY, gioco di ruolo", "Switch", 20.00, 86, 6, "./images/ZELDA.png");
		
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("The Last Of Us", "Survival, gioco di avventura", "PS4", 40.00, 74, 10, "./images/TLOU.png");

	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Dragon Ball", "PICCHIADURO, Gioco fantasy", "PS4", 10.00, 150, 8, "./images/DB.png"); 
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("GTA", "OPENWORLD, Gioco di avventura", "XboxOne", 13.00, 410, 8, "./images/GTA.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Yu Gi Oh", "GCC, Gioco fantasy", "Switch", 25.00, 10, 8, "./images/YGO.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Minecraft", "SANDBOX, Gioco di avventura", "XboxOne", 5.00, 100, 8, "./images/MC.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Just Cause", "AZIONE, Gioco di avventura", "PS4", 40.00, 101, 8, "./images/JC.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Watch Dogs", "OPENWORLD, Gioco informatico", "PS4", 70.00, 2, 8, "./images/WD.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Rayman", "PLATFORM, Gioco di avventura", "Switch", 35.00, 10, 8, "./images/RAYMAN.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("One Piece", "PICCHIADURO, Gioco di azione", "Switch", 14.00, 10, 8, "./images/OP.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Call of Duty", "SPARATUTTO, Gioco di guerra", "PS4", 100.00, 80, 8, "./images/COD.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("HALO", "SPARATUTTO, Gioco di fantascienza", "XboxOne", 100.00, 80, 8, "./images/HALO.png");
    
    insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("God Of War", "PICCHIADURO, Gioco di avventura", "PS4", 40.00, 150, 8, "./images/GOW.png");
        
	insert into Videogioco (titolo, descrizione, console, prezzo, disponibilita, spedizione, imgPath)
		values ("Fifa 20", "SPORT, Gioco di calcio", "PS4", 80.00, 15, 8, "./images/FIFA20.png");
    
    