public class University {
    private int id;
    private String name;
    private String location;
    private String website;
    private String description;

    // Constructors
    public University() {}

    public University(int id, String name, String location, String website, String description) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.website = website;
        this.description = description;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    public String getWebsite() {
        return website;
    }
    public void setWebsite(String website) {
        this.website = website;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "University [id=" + id + ", name=" + name + ", location=" + location + ", website=" + website + ", description=" + description + "]";
    }
}
