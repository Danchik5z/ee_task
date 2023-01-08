package entity;

import java.time.LocalDate;
import java.util.Date;

public class Ticket extends MyEntity{

    private int ID;

    private int clientID;

    private int hallID;

    private int price;

    public Ticket(int ID, int clientID, int hallID, int price) {
        this.ID = ID;
        this.clientID = clientID;
        this.hallID = hallID;
        this.price = price;
    }

    public int getID() {
        return ID;
    }

    public int getClientID() {
        return clientID;
    }

    public int getHallID() {
        return hallID;
    }


    public int getPrice() {
        return price;
    }

}
