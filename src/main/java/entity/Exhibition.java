package entity;

import java.sql.Date;
import java.util.List;

public class Exhibition extends MyEntity{

    private int id;
    private Date startDate;
    private String description;

    private List<Exhibit> exhibitList;

    public List<Exhibit> getExhibitList() {
        return exhibitList;
    }

    public void setExhibitList(List<Exhibit> exhibitList) {
        this.exhibitList = exhibitList;
    }

    public Exhibition(int id, Date startDate, String description) {
        this.id = id;
        this.startDate = startDate;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

        public void setId(int id) {
        this.id = id;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }
}
