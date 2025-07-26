import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SkinProblemDAO {

    public List<SkinProblem> getAllSkinProblems() {
        List<SkinProblem> problems = new ArrayList<>();
        String sql = "SELECT id, problem_name AS name FROM skin_problems";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                problems.add(new SkinProblem(id, name));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return problems;
    }
}
