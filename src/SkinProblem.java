public class SkinProblem {
    private int id;
    private String name;

    public SkinProblem(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() { return id; }
    public String getName() { return name; }

    @Override
    public String toString() {
        return id + ": " + name;  // Adds numbering like "1: Acne"
    }
    
}