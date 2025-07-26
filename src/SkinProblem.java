public class SkinProblem {
    int id;
    String name;


    public SkinProblem(int id, String name) {
        this.id = id;
        this.name = name;
    }


    public String toString() {
        return id + ": " + name;
    }
}
