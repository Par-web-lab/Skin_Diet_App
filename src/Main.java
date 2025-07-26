import java.util.*;
import java.util.stream.Collectors;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Step 1: Show all skin problems
        SkinProblemDAO problemDAO = new SkinProblemDAO();
        List<SkinProblem> problems = problemDAO.getAllSkinProblems();

        System.out.println("=== Choose Skin Problem IDs (space separated) ===");
        for (SkinProblem p : problems) {
            System.out.println(p); // e.g. 1: Acne
        }

        System.out.print("Enter problem IDs: ");
        String inputLine = sc.nextLine();
        List<Integer> selectedIds = Arrays.stream(inputLine.trim().split("\\s+"))
                                          .map(Integer::parseInt)
                                          .collect(Collectors.toList());

        // Step 2: Fetch diet items for selected skin problems (many)
        DietItemDAO dietDAO = new DietItemDAO();
        List<DietItem> recommendedItems = dietDAO.getDietItemsForProblems(selectedIds);

        if (recommendedItems.isEmpty()) {
            System.out.println("No diet items found for these skin problems.");
            return;
        }

        // Step 3: Generate and show 7-day plan with constraints
        DietPlanner planner = new DietPlanner();
        Map<String, List<DietItem>> plan = planner.generate7DayPlan(recommendedItems, 5, 1);

        System.out.println("\n=== 7-Day Personalized Diet Plan ===");
        for (Map.Entry<String, List<DietItem>> entry : plan.entrySet()) {
            System.out.println(entry.getKey() + ":");
            for (DietItem item : entry.getValue()) {
                System.out.println(" - " + item.getItemName() + " (" + item.getType() + ")");
            }
            System.out.println();
        }
    }
}
