package com.IERP_FINAL.dao;

import com.IERP_FINAL.models.Announcement;
import java.sql.*;
import java.util.*;

public class AnnouncementDAO {
    private Connection conn;

    public AnnouncementDAO(Connection conn) {
        this.conn = conn;
    }

    // Create
    public boolean insertAnnouncement(Announcement announcement) {
        boolean status = false;
        try {
            String query = "INSERT INTO announcements (heading, date, time, description) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, announcement.getHeading());
            ps.setString(2, announcement.getDate());
            ps.setString(3, announcement.getTime());
            ps.setString(4, announcement.getDescription());
            ps.executeUpdate();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Read - get all
    public List<Announcement> getAllAnnouncements() {
        List<Announcement> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM announcements";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Announcement a = new Announcement();
                a.setId(rs.getInt("announcement_id")); // use correct column name
                a.setHeading(rs.getString("heading"));
                a.setDate(rs.getString("date"));
                a.setTime(rs.getString("time"));
                a.setDescription(rs.getString("description"));
                list.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Read - get by ID
    public Announcement getAnnouncementById(int id) {
        Announcement a = null;
        try {
            String query = "SELECT * FROM announcements WHERE announcement_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Announcement();
                a.setId(rs.getInt("announcement_id"));
                a.setHeading(rs.getString("heading"));
                a.setDate(rs.getString("date"));
                a.setTime(rs.getString("time"));
                a.setDescription(rs.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }

    // Update
    public boolean updateAnnouncement(Announcement announcement) {
        boolean status = false;
        try {
            String query = "UPDATE announcements SET heading=?, date=?, time=?, description=? WHERE announcement_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, announcement.getHeading());
            ps.setString(2, announcement.getDate());
            ps.setString(3, announcement.getTime());
            ps.setString(4, announcement.getDescription());
            ps.setInt(5, announcement.getId());
            ps.executeUpdate();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Delete
    public boolean deleteAnnouncement(int id) {
        boolean status = false;
        try {
            String query = "DELETE FROM announcements WHERE announcement_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
