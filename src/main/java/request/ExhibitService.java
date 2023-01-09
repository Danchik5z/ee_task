package request;

import entity.Exhibit;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ExhibitService {
    public static String insert(Exhibit exhibit) {
        return "Insert into exhibit(hall_id,description) VALUES('" +
                exhibit.getHallNumber() + "','" +
                exhibit.getDescription() + "')";
    }

    public static String update(Exhibit exhibit) {
        return "UPDATE exhibit SET hall_id = " + exhibit.getHallNumber() +
                ", description = '" + exhibit.getDescription() +
                "' WHERE exhibit_id = " + exhibit.getID();
    }

    public static String delete(int id) {
        return "DELETE FROM exhibit WHERE exhibit_id = " + id;
    }

    public static String get(int id) {
        return "select * from exhibit where exhibit_id = " + id;
    }

    public static String getAll() {
        return "select * from exhibit";
    }

    public static String getExhibitions(Exhibit exhibit){
        return "select * from exhibition where exhibition_id in (select exhibition_id from exhibition_exhibit where exhibit_id = "
                +exhibit.getID()+")";
    }

    public static Exhibit parse(ResultSet resultSet) throws SQLException {
        return new Exhibit(resultSet.getInt("exhibit_id"),
                resultSet.getInt("hall_id"),
                resultSet.getString("description"));
    }
}
