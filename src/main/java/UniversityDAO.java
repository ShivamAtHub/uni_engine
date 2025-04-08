public List<University> searchUniversities(String name, String state, String course) {
    List<University> list = new ArrayList<>();
    try (Connection con = DBConnection.getConnection()) {
        String sql = "SELECT DISTINCT u.* FROM universities u " +
                "LEFT JOIN courses c ON u.id = c.university_id " +
                "WHERE (u.name LIKE ? OR ? = '') " +
                "AND (u.state LIKE ? OR ? = '') " +
                "AND (c.name LIKE ? OR ? = '')";

        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, "%" + name + "%");
        ps.setString(2, name);
        ps.setString(3, "%" + state + "%");
        ps.setString(4, state);
        ps.setString(5, "%" + course + "%");
        ps.setString(6, course);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            University u = new University();
            u.setId(rs.getInt("id"));
            u.setName(rs.getString("name"));
            u.setState(rs.getString("state"));
            u.setDescription(rs.getString("description"));
            u.setWebsite(rs.getString("website"));
            list.add(u);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
