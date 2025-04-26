package com.IERP_FINAL.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.IERP_FINAL.models.LeaveApplicationModel;
import com.IERP_FINAL.utils.DBConnection;

public class LeaveApplicationDAO {

    // CREATE - Insert new leave application
    public static boolean insertLeaveApplication(LeaveApplicationModel leave) {
        String query = "INSERT INTO leave_application (student_id, leave_type, subject, from_date, to_date, description) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
             
            ps.setInt(1, leave.getStudentId());
            ps.setString(2, leave.getLeaveType());
            ps.setString(3, leave.getSubject());
            ps.setDate(4, leave.getFromDate());
            ps.setDate(5, leave.getToDate());
            ps.setString(6, leave.getDescription());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // READ - Get all applications
    public List<LeaveApplicationModel> getAllLeaveApplications() {
        List<LeaveApplicationModel> list = new ArrayList<>();
        String query = "SELECT * FROM leave_application";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                LeaveApplicationModel leave = mapResultSet(rs);
                list.add(leave);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // READ - Get by student ID
    public static List<LeaveApplicationModel> getLeaveApplicationsByStudentId(int studentId) {
        List<LeaveApplicationModel> list = new ArrayList<>();
        String query = "SELECT * FROM leave_application WHERE student_id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
             
            ps.setInt(1, studentId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                	 LeaveApplicationModel leave = new LeaveApplicationModel();

                     // POSSIBLY MISSING THIS 👇
                     leave.setId(rs.getInt("id")); // <-- Make sure this matches your DB column name
                     leave.setLeaveType(rs.getString("leave_type")); // Example field
                     leave.setSubject(rs.getString("subject")); // Example field
                     leave.setFromDate(rs.getDate("from_date")); // Example field
                     leave.setToDate(rs.getDate("to_date"));
                     leave.setDescription(rs.getString("description"));

                     list.add(leave);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


    // READ - Get by ID
    public LeaveApplicationModel getLeaveApplicationById(int id) {
        String query = "SELECT * FROM leave_application WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
             
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // UPDATE
    public boolean updateLeaveApplication(LeaveApplicationModel leave) {
        String query = "UPDATE leave_application SET leave_type = ?, subject = ?, from_date = ?, to_date = ?, description = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
             
            ps.setString(1, leave.getLeaveType());
            ps.setString(2, leave.getSubject());
            ps.setDate(3, leave.getFromDate());
            ps.setDate(4, leave.getToDate());
            ps.setString(5, leave.getDescription());
            ps.setInt(6, leave.getId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // DELETE
    public boolean deleteLeaveApplication(int id) {
        String query = "DELETE FROM leave_application WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
             
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Helper Method to map ResultSet to LeaveApplication
    private static LeaveApplicationModel mapResultSet(ResultSet rs) throws SQLException {
        LeaveApplicationModel leave = new LeaveApplicationModel();
        leave.setId(rs.getInt("id"));
        leave.setStudentId(rs.getInt("student_id"));
        leave.setLeaveType(rs.getString("leave_type"));
        leave.setSubject(rs.getString("subject"));
        leave.setFromDate(rs.getDate("from_date"));
        leave.setToDate(rs.getDate("to_date"));
        leave.setDescription(rs.getString("description"));
        leave.setSubmittedTime(rs.getTimestamp("submitted_at"));
        return leave;
    }
}
