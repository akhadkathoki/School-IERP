package com.IERP_FINAL.dao;


import java.sql.*;
import java.sql.Date;
import java.util.*;

import com.IERP_FINAL.models.Achievement;
import com.IERP_FINAL.utils.DBConnection;



public class AchievementDAO {
    
   

    // INSERT
    public static boolean insertAchievement(Achievement achievement) {
        String sql = "INSERT INTO achievement (student_id, activity_type, title, organization, number_of_days, from_date, to_date, description, testimonial_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, achievement.getStudentId());
            stmt.setString(2, achievement.getActivityType());
            stmt.setString(3, achievement.getTitle());
            stmt.setString(4, achievement.getOrganization());
            stmt.setInt(5, achievement.getNumberOfDays());
            stmt.setDate(6, Date.valueOf(achievement.getFromDate()));
            stmt.setDate(7, Date.valueOf(achievement.getToDate()));
            stmt.setString(8, achievement.getDescription());
            stmt.setBytes(9, achievement.getTestimonialImage());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // UPDATE
    public static boolean updateAchievement(Achievement achievement) {
        String sql = "UPDATE achievement SET student_id=?, activity_type=?, title=?, organization=?, number_of_days=?, from_date=?, to_date=?, description=?, testimonial_image=? WHERE achievement_id=? AND student_id=?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, achievement.getStudentId());
            stmt.setString(2, achievement.getActivityType());
            stmt.setString(3, achievement.getTitle());
            stmt.setString(4, achievement.getOrganization());
            stmt.setInt(5, achievement.getNumberOfDays());
            stmt.setDate(6, Date.valueOf(achievement.getFromDate()));
            stmt.setDate(7, Date.valueOf(achievement.getToDate()));
            stmt.setString(8, achievement.getDescription());
            stmt.setBytes(9, achievement.getTestimonialImage());
            stmt.setInt(10, achievement.getAchievementId());
            stmt.setInt(11, achievement.getStudentId());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public static boolean deleteAchievement(int achievementId) {
        String sql = "DELETE FROM achievement WHERE achievement_id = ?";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, achievementId);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // GET BY ID
    public static Achievement getAchievementAchieveById(int achievementId,int studentId) {
        String sql = "SELECT * FROM achievement WHERE achievement_id=? AND student_id=?";
        Achievement achievement = null;

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, achievementId);
            stmt.setInt(2, studentId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                achievement = new Achievement();
                achievement.setAchievementId(rs.getInt("achievement_id"));
                achievement.setStudentId(rs.getInt("student_id"));
                achievement.setActivityType(rs.getString("activity_type"));
                achievement.setTitle(rs.getString("title"));
                achievement.setOrganization(rs.getString("organization"));
                achievement.setNumberOfDays(rs.getInt("number_of_days"));
                achievement.setFromDate(rs.getDate("from_date").toString());
                achievement.setToDate(rs.getDate("to_date").toString());
                achievement.setDescription(rs.getString("description"));
                achievement.setTestimonialImage(rs.getBytes("testimonial_image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return achievement;
    }
    public static List<Achievement> getAchievementById(int achievementId) throws SQLException {
        List<Achievement> list = new ArrayList<>();
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM achievement WHERE student_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, achievementId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Achievement a = new Achievement();
            a = new Achievement();
            a.setAchievementId(rs.getInt("achievement_id"));
            a.setStudentId(rs.getInt("student_id"));
            a.setActivityType(rs.getString("activity_type"));
            a.setTitle(rs.getString("title"));
            a.setOrganization(rs.getString("organization"));
            a.setNumberOfDays(rs.getInt("number_of_days"));
            a.setFromDate(rs.getDate("from_date").toString());
            a.setToDate(rs.getDate("to_date").toString());
            a.setDescription(rs.getString("description"));
            a.setTestimonialImage(rs.getBytes("testimonial_image"));
            list.add(a);
        }

        return list;
    }

    // GET ALL
    public static List<Achievement> getAllAchievements() {
        List<Achievement> list = new ArrayList<>();
        String sql = "SELECT * FROM achievement";

        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Achievement achievement = new Achievement();
                achievement.setAchievementId(rs.getInt("achievement_id"));
                achievement.setStudentId(rs.getInt("student_id"));
                achievement.setActivityType(rs.getString("activity_type"));
                achievement.setTitle(rs.getString("title"));
                achievement.setOrganization(rs.getString("organization"));
                achievement.setNumberOfDays(rs.getInt("number_of_days"));
                achievement.setFromDate(rs.getDate("from_date").toString());
                achievement.setToDate(rs.getDate("to_date").toString());
                achievement.setDescription(rs.getString("description"));
                achievement.setTestimonialImage(rs.getBytes("testimonial_image"));

                list.add(achievement);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
