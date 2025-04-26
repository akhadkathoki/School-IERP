package com.IERP_FINAL.dao;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import com.IERP_FINAL.models.Teacher;
import com.IERP_FINAL.utils.DBConnection;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177215) // 16MB

public class TeacherDAO {

	public List<Teacher> getAllTeacherProfiles() throws SQLException {
	    List<Teacher> teacherList = new ArrayList<>();

	    String query = "SELECT DISTINCT t.*, tec.*, tq.*, tl.* " +
	               "FROM teachers t " +
	               "LEFT JOIN teacher_emergency_contacts tec ON t.teacher_id = tec.teacher_id " +
	               "LEFT JOIN teacher_qualifications tq ON t.teacher_id = tq.teacher_id " +
	               "LEFT JOIN teacher_license tl ON t.teacher_id = tl.teacher_id";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Teacher t = new Teacher();

	            // Basic Info
	            t.setTeacherId(rs.getInt("teacher_id"));
	            t.setRole(rs.getString("role"));
	            t.setFullName(rs.getString("full_name"));
	            t.setGender(rs.getString("gender"));
	            t.setDateOfBirth(rs.getDate("date_of_birth"));
	            t.setNationality(rs.getString("nationality"));
	            t.setCitizenshipNumber(rs.getString("citizenship_number"));
	            t.setCitizenshipIssuePlace(rs.getString("citizenship_issue_place"));
	            t.setCitizenshipIssueDate(rs.getDate("citizenship_issue_date"));
	            t.setContactNumber(rs.getString("contact_number"));
	            t.setEmailAddress(rs.getString("email_address"));
	            t.setPermanentAddress(rs.getString("permanent_address"));
	            t.setTemporaryAddress(rs.getString("temporary_address"));
	            t.setUsername(rs.getString("username"));
	            t.setPassword(rs.getString("password"));
	            t.setPhoto(rs.getBytes("photo"));
	            t.setCreatedAt(rs.getDate("created_at"));

	            // Emergency Contact Info
	            t.setEmergencyContactName(rs.getString("emergency_contact_name"));
	            t.setEmergencyContactNumber(rs.getString("emergency_contact_number"));
	            t.setEmergencyEmail(rs.getString("emergency_email"));
	            t.setRelationshipWithEmergencyContact(rs.getString("relationship_with_emergency_contact"));

	            // Qualification Info
	            t.setHighestQualification(rs.getString("highest_qualification"));
	            t.setSpecialization(rs.getString("specialization"));
	            t.setQualificationScore(rs.getFloat("qualification_score"));
	            t.setCertificationImage(rs.getBytes("certification_image"));

	            // License Info
	            t.setTeachingLicenseNumber(rs.getString("teaching_license_number"));
	            t.setLicenseIssueDate(rs.getDate("license_issue_date"));
	            t.setLicenseExpiryDate(rs.getDate("license_expiry_date"));
	            t.setLicenseImage(rs.getBytes("license_image"));

	            teacherList.add(t);
	        }
	    }

	    return teacherList;
	}


	public Teacher getTeacherById(int teacherId) throws SQLException {
	    Teacher t = null;

	    String query = "SELECT DISTINCT t.*, tec.*, tq.*, tl.* " +
	               "FROM teachers t " +
	               "LEFT JOIN teacher_emergency_contacts tec ON t.teacher_id = tec.teacher_id " +
	               "LEFT JOIN teacher_qualifications tq ON t.teacher_id = tq.teacher_id " +
	               "LEFT JOIN teacher_license tl ON t.teacher_id = tl.teacher_id " +  // Added space here
	               "WHERE t.teacher_id = ?";


	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {

	        ps.setInt(1, teacherId);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            t = new Teacher();

	            // Teacher basic info
	            t.setTeacherId(rs.getInt("teacher_id"));
	            t.setRole(rs.getString("role"));
	            t.setFullName(rs.getString("full_name"));
	            t.setGender(rs.getString("gender"));
	            t.setDateOfBirth(rs.getDate("date_of_birth"));
	            t.setNationality(rs.getString("nationality"));
	            t.setCitizenshipNumber(rs.getString("citizenship_number"));
	            t.setCitizenshipIssuePlace(rs.getString("citizenship_issue_place"));
	            t.setCitizenshipIssueDate(rs.getDate("citizenship_issue_date"));
	            t.setContactNumber(rs.getString("contact_number"));
	            t.setEmailAddress(rs.getString("email_address"));
	            t.setPermanentAddress(rs.getString("permanent_address"));
	            t.setTemporaryAddress(rs.getString("temporary_address"));
	            t.setUsername(rs.getString("username"));
	            t.setPassword(rs.getString("password"));
	            t.setPhoto(rs.getBytes("photo"));
	            t.setCreatedAt(rs.getDate("created_at"));

	            // Emergency contact info
	            t.setEmergencyContactName(rs.getString("emergency_contact_name"));
	            t.setEmergencyContactNumber(rs.getString("emergency_contact_number"));
	            t.setEmergencyEmail(rs.getString("emergency_email"));
	            t.setRelationshipWithEmergencyContact(rs.getString("relationship_with_emergency_contact"));

	            // Qualification info
	            t.setHighestQualification(rs.getString("highest_qualification"));
	            t.setSpecialization(rs.getString("specialization"));
	            t.setQualificationScore(rs.getFloat("qualification_score"));
	            t.setCertificationImage(rs.getBytes("certification_image"));

	            // License info
	            t.setTeachingLicenseNumber(rs.getString("teaching_license_number"));
	            t.setLicenseIssueDate(rs.getDate("license_issue_date"));
	            t.setLicenseExpiryDate(rs.getDate("license_expiry_date"));
	            t.setLicenseImage(rs.getBytes("license_image"));
	        }
	    }

	    return t;
	}


    public boolean deleteTeacher(int teacherId) throws SQLException {
        String query = "DELETE FROM teachers WHERE teacher_id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, teacherId);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }
    
    
    // Add other update methods if needed, e.g. updateTeacher, addTeacher, etc.
    public boolean updateTeacherProfile(HttpServletRequest request) throws Exception {
    	return true;

        
    }

}
