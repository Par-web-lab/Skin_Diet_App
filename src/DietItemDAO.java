import java.sql.*;
import java.util.*;

public class DietItemDAO {

    public List<DietItem> getDietItemsForProblems(List<Integer> problemIds) {
        List<DietItem> items = new ArrayList<>();

        if (problemIds == null || problemIds.isEmpty()) {
            return items;
        }

        StringBuilder placeholders = new StringBuilder();
        for (int i = 0; i < problemIds.size(); i++) {
            placeholders.append("?");
            if (i < problemIds.size() - 1) {
                placeholders.append(", ");
            }
        }

        String sql = "SELECT DISTINCT d.id, d.item_name, d.type FROM diet_items d " +
                     "JOIN problem_diet_map pdm ON d.id = pdm.diet_item_id " +
                     "WHERE pdm.problem_id IN (" + placeholders + ")";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            for (int i = 0; i < problemIds.size(); i++) {
                stmt.setInt(i + 1, problemIds.get(i));
            }

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String itemName = rs.getString("item_name");
                    String type = rs.getString("type");
                    items.add(new DietItem(id, itemName, type));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return items;
    }

    // Optional helper method if needed for single problem
    public List<DietItem> getDietItemsForProblem(int problemId) {
        return getDietItemsForProblems(Collections.singletonList(problemId));
    }
}
