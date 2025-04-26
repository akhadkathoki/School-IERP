package com.IERP_FINAL.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.IERP_FINAL.models.ClassSubjectStudent;
import com.IERP_FINAL.utils.DBConnection;


public class ClassSubjectStudentDAO {

	public boolean addBulk(List<ClassSubjectStudent> entries) throws SQLException {
	    String sql = "INSERT INTO class_students (roll_no, class_name, student_id) VALUES (?, ?, ?)";
	    try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
	        for (ClassSubjectStudent entry : entries) {
	            ps.setString(1, entry.getRollNo());
	            ps.setString(2, entry.getClassName());
	            ps.setInt(3, entry.getStudentId());
	            ps.addBatch();
	        }

	        int[] result = ps.executeBatch();
	        for (int count : result) {
	            if (count <= 0) {
	                return false; // At least one insert failed
	            }
	        }
	        return true; // All inserts succeeded
	    }
	}





    public ClassSubjectStudent get(String rollNo, String className,  int studentId) throws SQLException {
        String sql = "SELECT * FROM class_students WHERE roll_no = ?class_name=? AND student_id=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
        	ps.setString(1, rollNo);
            ps.setString(1, className);
            ps.setInt(2, studentId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new ClassSubjectStudent(
                	rs.getString("roll_no"),
                    rs.getString("class_name"),
                    rs.getInt("student_id")
                );
            }
        }
        return null;
    }

    public List<Map<String, Object>> getAll() throws SQLException {
        List<Map<String, Object>> list = new ArrayList<>();
        String sql = "SELECT css.roll_no, css.class_name, css.student_id, " +
                "s.full_name, s.profile_picture, " +
                "ct.full_name AS class_teacher_name " +
                "FROM class_students css " +
                "JOIN classrooms c ON css.class_name = c.class_name " +
                "JOIN students s ON css.student_id = s.student_id " +
                "JOIN teachers ct ON c.class_teacher_id = ct.teacher_id";     // Class teacher

        try (Connection con = DBConnection.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Map<String, Object> row = new HashMap<>();
                row.put("roll_no", rs.getString("roll_no"));
                row.put("class_name", rs.getString("class_name"));
                row.put("student_id", rs.getInt("student_id"));
                row.put("student_name", rs.getString("full_name"));
                row.put("student_image", rs.getString("profile_picture"));
                row.put("teacher_name", rs.getString("class_teacher_name"));
                list.add(row);
            }
        }
        return list;
    }



    public boolean update(ClassSubjectStudent entry) throws SQLException {
    	String sql = "UPDATE class_students SET class_name = ?, student_id = ? WHERE class_name = ? AND student_id = ?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
        	ps.setString(1, entry.getRollNo());
            ps.setString(2, entry.getClassName());
            ps.setInt(3, entry.getStudentId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(String rollNo, String className,int studentId) throws SQLException {
        String sql = "DELETE FROM class_students WHERE class_name=? AND student_id=?";
        try (Connection con = DBConnection.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, className);
            ps.setInt(2, studentId);
            return ps.executeUpdate() > 0;
        }
    }
}
