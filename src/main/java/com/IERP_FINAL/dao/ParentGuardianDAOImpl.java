package com.IERP_FINAL.dao;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.IERP_FINAL.models.ParentGuardian;
import com.IERP_FINAL.utils.DBConnection;

public class ParentGuardianDAOImpl {

    private Connection conn;

    public ParentGuardianDAOImpl() throws Exception {
        conn = DBConnection.getConnection();
    }

    public boolean insert(ParentGuardian pg) throws Exception {
        String sql = "INSERT INTO parentsguardians (student_id, role, full_name, gender, date_of_birth, nationality, " +
                "contact_number, email_address, username, password, permanent_address, temporary_address, " +
                "citizenship_number, citizenship_issue_place, citizenship_issue_date, photo) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setObject(1, pg.getStudentId(), Types.INTEGER);
            ps.setString(2, pg.getRole());
            ps.setString(3, pg.getFullName());
            ps.setString(4, pg.getGender());
            ps.setDate(5, new java.sql.Date(pg.getDateOfBirth().getTime()));
            ps.setString(6, pg.getNationality());
            ps.setString(7, pg.getContactNumber());
            ps.setString(8, pg.getEmailAddress());
            ps.setString(9, pg.getUsername());
            ps.setString(10, pg.getPassword());
            ps.setString(11, pg.getPermanentAddress());
            ps.setString(12, pg.getTemporaryAddress());
            ps.setString(13, pg.getCitizenshipNumber());
            ps.setString(14, pg.getCitizenshipIssuePlace());
            ps.setDate(15, new java.sql.Date(pg.getCitizenshipIssueDate().getTime()));
            ps.setBytes(16, pg.getPhoto());

            int rowsInserted = ps.executeUpdate();
            if (rowsInserted == 0) {
                throw new Exception("Insertion failed: No rows affected.");
            }

            return true;
        }
    }


    public void update(ParentGuardian pg) throws Exception {
        String sql = "UPDATE parentsguardians SET student_id=?, role=?, full_name=?, gender=?, date_of_birth=?, " +
                "nationality=?, contact_number=?, email_address=?, username=?, password=?, permanent_address=?, " +
                "temporary_address=?, citizenship_number=?, citizenship_issue_place=?, citizenship_issue_date=?, photo=? " +
                "WHERE guardian_id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setObject(1, pg.getStudentId(), Types.INTEGER);
            ps.setString(2, pg.getRole());
            ps.setString(3, pg.getFullName());
            ps.setString(4, pg.getGender());
            ps.setDate(5, new java.sql.Date(pg.getDateOfBirth().getTime()));
            ps.setString(6, pg.getNationality());
            ps.setString(7, pg.getContactNumber());
            ps.setString(8, pg.getEmailAddress());
            ps.setString(9, pg.getUsername());
            ps.setString(10, pg.getPassword());
            ps.setString(11, pg.getPermanentAddress());
            ps.setString(12, pg.getTemporaryAddress());
            ps.setString(13, pg.getCitizenshipNumber());
            ps.setString(14, pg.getCitizenshipIssuePlace());
            ps.setDate(15, new java.sql.Date(pg.getCitizenshipIssueDate().getTime()));
            ps.setBytes(16, pg.getPhoto());
            ps.setInt(17, pg.getGuardianId());

            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated == 0) {
                throw new Exception("Update failed: No guardian found with ID " + pg.getGuardianId());
            }
        }
    }


    public void delete(int guardianId) throws Exception {
        String sql = "DELETE FROM parentsguardians WHERE guardian_id=?";
        
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, guardianId);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            throw new Exception("Error deleting ParentGuardian by ID", e);
        }
    }


    public ParentGuardian getById(int guardianId) throws Exception {
        String sql = "SELECT * FROM parentsguardians WHERE guardian_id=?";
        
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, guardianId);
            ResultSet rs = ps.executeQuery();
            
            ParentGuardian pg = null;
            if (rs.next()) {
                pg = extractParentGuardian(rs);
            }
            
            rs.close();
            return pg;
        } catch (SQLException e) {
            throw new Exception("Error fetching ParentGuardian by ID", e);
        }
    }


    public List<ParentGuardian> getAll() throws Exception {
        String sql = "SELECT * FROM parentsguardians";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        List<ParentGuardian> list = new ArrayList<>();
        while (rs.next()) {
            list.add(extractParentGuardian(rs));
        }
        rs.close();
        ps.close();
        return list;
    }

    private ParentGuardian extractParentGuardian(ResultSet rs) throws SQLException {
        ParentGuardian pg = new ParentGuardian();
        
        pg.setGuardianId(rs.getInt("guardian_id"));
        pg.setStudentId(rs.getInt("student_id"));
        pg.setRole(rs.getString("role"));
        pg.setFullName(rs.getString("full_name"));
        pg.setGender(rs.getString("gender"));
        pg.setDateOfBirth(rs.getDate("date_of_birth"));
        pg.setNationality(rs.getString("nationality"));
        pg.setContactNumber(rs.getString("contact_number"));
        pg.setEmailAddress(rs.getString("email_address"));
        pg.setUsername(rs.getString("username"));
        pg.setPassword(rs.getString("password"));
        pg.setPermanentAddress(rs.getString("permanent_address"));
        pg.setTemporaryAddress(rs.getString("temporary_address"));
        pg.setCitizenshipNumber(rs.getString("citizenship_number"));
        pg.setCitizenshipIssuePlace(rs.getString("citizenship_issue_place"));
        pg.setCitizenshipIssueDate(rs.getDate("citizenship_issue_date"));
        
        // Fetch the photo as bytes if available
        pg.setPhoto(rs.getBytes("photo"));
        
        return pg;
    }

}
