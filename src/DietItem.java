public class DietItem {
    private int id;
    private String itemName;
    private String type;

    public DietItem(int id, String itemName, String type) {
        this.id = id;
        this.itemName = itemName;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public String getItemName() {
        return itemName;
    }

    public String getType() {
        return type;
    }

    @Override
    public String toString() {
        return id + ": " + itemName + " (" + type + ")";
    }
}
