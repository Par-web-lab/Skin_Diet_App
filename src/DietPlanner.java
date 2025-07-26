import java.util.*;

public class DietPlanner {

    private static final String[] DAYS = {
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
    };

    /**
     * Generates a 7-day plan with at least minItemsPerDay items each day,
     * with maxLiquidPerDay liquid items max,
     * allowing repeated diet items.
     *
     * @param dietItems        List of diet items to choose from.
     * @param minItemsPerDay   Minimum items per day (e.g., 5).
     * @param maxLiquidPerDay  Maximum liquid items per day (e.g., 1).
     * @return Map of day to list of DietItems.
     */
    public Map<String, List<DietItem>> generate7DayPlan(List<DietItem> dietItems, int minItemsPerDay, int maxLiquidPerDay) {
        Map<String, List<DietItem>> plan = new LinkedHashMap<>();

        // Initialize empty lists for each day
        for (String day : DAYS) {
            plan.put(day, new ArrayList<>());
        }

        if (dietItems.isEmpty()) {
            return plan; // no items to assign
        }

        // Shuffle the input list for variety (optional)
        Collections.shuffle(dietItems);

        // Create separate lists of liquids and non-liquids
        List<DietItem> liquids = new ArrayList<>();
        List<DietItem> nonLiquids = new ArrayList<>();

        for (DietItem item : dietItems) {
            if ("liquid".equalsIgnoreCase(item.getType())) {
                liquids.add(item);
            } else {
                nonLiquids.add(item);
            }
        }

        // If no non-liquid items, fall back to all dietItems for nonLiquids to avoid empty days
        if (nonLiquids.isEmpty()) {
            nonLiquids.addAll(dietItems);
        }

        // To fill each day:
        // 1. Add maxLiquidPerDay liquid(s) if available (repeat if needed),
        // 2. Fill the rest with non-liquid (repeat if needed).

        int totalDays = DAYS.length;

        // Use indices for cycling through source lists
        int liquidIdx = 0;
        int nonLiquidIdx = 0;

        for (int d = 0; d < totalDays; d++) {
            List<DietItem> dayItems = plan.get(DAYS[d]);

            // Add liquid items (maxLiquidPerDay)
            for (int i = 0; i < maxLiquidPerDay; i++) {
                if (!liquids.isEmpty()) {
                    dayItems.add(liquids.get(liquidIdx % liquids.size()));
                    liquidIdx++;
                }
            }

            // Add remaining items as non-liquids to meet minItemsPerDay
            int remaining = minItemsPerDay - dayItems.size();
            for (int i = 0; i < remaining; i++) {
                dayItems.add(nonLiquids.get(nonLiquidIdx % nonLiquids.size()));
                nonLiquidIdx++;
            }
        }

        return plan;
    }
}
