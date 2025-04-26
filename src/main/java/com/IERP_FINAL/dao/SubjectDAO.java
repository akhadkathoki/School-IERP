package com.IERP_FINAL.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.IERP_FINAL.models.Subject;
import com.IERP_FINAL.utils.DBConnection;

public class SubjectDAO {
 

    private static final String INSERT = "INSERT INTO subjects (subject_name, subject_code, subject_type, class_name, full_marks, subject_teacher_id) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL = "SELECT * FROM subjects";
    private static final String SELECT_BY_ID = "SELECT * FROM subjects WHERE subject_id = ?";
    private static final String UPDATE = "UPDATE subjects SET subject_name = ?, subject_code = ?, subject_type = ?, class_name = ?, full_marks = ?, subject_teacher_id = ? WHERE subject_id = ?";
    private static final String DELETE = "DELETE FROM subjects WHERE subject_id = ?";



    public void insertSubject(Subject subject) throws SQLException {
    	try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(INSERT)) {
            stmt.setString(1, subject.getSubjectName());
            stmt.setString(2, subject.getSubjectCode());
            stmt.setString(3, subject.getSubjectType());
            stmt.setString(4, subject.getClassName());
            stmt.setInt(5, subject.getFullMarks());     
            stmt.setInt(6, subject.getSubjectTeacherId());
            stmt.executeUpdate();
        }
    }

    public List<Subject> getAllSubjects() throws SQLException {
        List<Subject> list = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(SELECT_ALL)) {
        	ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Subject subject = new Subject(
                    rs.getInt("subject_id"),
                    rs.getString("subject_name"),
                    rs.getString("subject_code"),
                    rs.getString("subject_type"),
                    rs.getString("class_name"),
                    rs.getInt("full_marks"),
                    rs.getInt("subject_teacher_id")
                );
                list.add(subject);
            }
        }
        return list;
    }

    public Subject getSubjectById(int id) throws SQLException {
    	try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(SELECT_BY_ID)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Subject(
                    rs.getInt("subject_id"),
                    rs.getString("subject_name"),
                    rs.getString("subject_code"),
                    rs.getString("subject_type"),
                    rs.getString("class_name"),
                    rs.getInt("full_marks"),
                    rs.getInt("subject_teacher_id")
                );
            }
        }
        return null;
    }

    public boolean updateSubject(Subject subject) throws SQLException {
    	try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(UPDATE)) {
            stmt.setString(1, subject.getSubjectName());
            stmt.setString(2, subject.getSubjectCode());
            stmt.setString(3, subject.getSubjectType());
            stmt.setString(4, subject.getClassName());
            stmt.setInt(5, subject.getFullMarks());

            stmt.setInt(6, subject.getSubjectTeacherId());
            stmt.setInt(7, subject.getSubjectId());
            return stmt.executeUpdate() > 0;
        }
    }

    public boolean deleteSubject(int id) throws SQLException {
    	try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(DELETE)) {
    		stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }
}
