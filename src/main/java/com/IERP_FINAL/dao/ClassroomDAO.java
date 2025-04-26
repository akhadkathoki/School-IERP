package com.IERP_FINAL.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.IERP_FINAL.models.Classroom;
import com.IERP_FINAL.utils.DBConnection;

public class ClassroomDAO {

    private static final String INSERT = "INSERT INTO classrooms (class_name, class_level, section, class_teacher_id) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ALL = "SELECT * FROM classrooms";
    private static final String SELECT_BY_ID = "SELECT * FROM classrooms WHERE class_name = ?";
    private static final String UPDATE = "UPDATE classrooms SET class_level = ?, section = ?, class_teacher_id = ? WHERE class_name = ?";
    private static final String DELETE = "DELETE FROM classrooms WHERE class_name = ?";

    // ✅ CREATE
    public void insertClassroom(Classroom c) throws SQLException {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(INSERT)) {
            stmt.setString(1, c.getClassName());
            stmt.setInt(2, c.getClassLevel());
            stmt.setString(3, c.getSection());
            stmt.setInt(4, c.getClassTeacherId());
            stmt.executeUpdate();
        }
    }

    // ✅ READ ALL
    public List<Classroom> getAllClassrooms() throws SQLException {
        List<Classroom> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_ALL)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Classroom c = new Classroom();
                c.setClassName(rs.getString("class_name"));
                c.setClassLevel(rs.getInt("class_level"));
                c.setSection(rs.getString("section"));
                c.setClassTeacherId(rs.getInt("class_teacher_id"));
                Timestamp timestamp = rs.getTimestamp("created_at");
                if (timestamp != null) {
                    c.setCreatedAt(new Date(timestamp.getTime())); // Convert Timestamp to Date
                }
                list.add(c);
            }
        }
        return list;
    }

    // ✅ READ ONE
    public Classroom getClassroomById(String className) throws SQLException {
        Classroom c = null;
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID)) {
            stmt.setString(1, className);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                c = new Classroom();
                c.setClassName(rs.getString("class_name"));
                c.setClassLevel(rs.getInt("class_level"));
                c.setSection(rs.getString("section"));
                c.setClassTeacherId(rs.getInt("class_teacher_id"));
                c.setCreatedAt(rs.getDate("created_at"));
            }
        }
        return c;
    }

    // ✅ UPDATE
    public boolean updateClassroom(Classroom c) throws SQLException {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(UPDATE)) {
            stmt.setInt(1, c.getClassLevel());
            stmt.setString(2, c.getSection());
            stmt.setInt(3, c.getClassTeacherId());
            stmt.setString(4, c.getClassName());
            return stmt.executeUpdate() > 0;
        }
    }

    // ✅ DELETE
    public boolean deleteClassroom(String className) throws SQLException {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(DELETE)) {
            stmt.setString(1, className);
            return stmt.executeUpdate() > 0;
        }
    }
}
