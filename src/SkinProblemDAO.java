import java.sql.*;
import java.util.*;


public class SkinProblemDAO {
    public List<SkinProblem> getAllSkinProblems() {
        List<SkinProblem> list = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM skin_problems")) {


            while (rs.next()) {
                list.add(new SkinProblem(rs.getInt("id"), rs.getString("problem_name")));


            }


        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}