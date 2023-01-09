package entity;

import java.util.List;

public class Exhibit extends MyEntity{

    private final int ID;
    private int hallNumber;

    private String description;

    private List<Exhibition> exhibitionList;

    public Exhibit(int ID, int hallNumber, String description) {
        this.ID = ID;

        this.hallNumber = hallNumber;
        this.description = description;
    }

    public int getID() {
        return ID;
    }


    public String getDescription() {
        return description;
    }



    public int getHallNumber() {
        return hallNumber;
    }



    public void setDescription(String description) {
        this.description = description;
    }

    public void setExhibitionList(List<Exhibition> exhibitionList) {
        this.exhibitionList = exhibitionList;
    }

    @Override
    public String toString() {
        return "Exhibit{" +
                "ID=" + ID +
                ", hallNumber=" + hallNumber +
                ", description='" + description +
                '}';
    }

    public List<Exhibition> getExhibitionList() {
        return exhibitionList;
    }


}
