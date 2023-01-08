package entity;

import java.util.List;

public class Exhibit extends MyEntity{

    private final int ID;
    private String name;
    private String author;
    private int hallNumber;

    private String description;

    private List<Exhibition> exhibitionList;

    public Exhibit(int ID, String name, String author, int hallNumber, String description) {
        this.ID = ID;
        this.name = name;
        this.author = author;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
