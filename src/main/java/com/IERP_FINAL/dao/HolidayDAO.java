package com.IERP_FINAL.dao;

import com.IERP_FINAL.utils.DBConnection;


import java.sql.*;
import java.util.*;

import com.IERP_FINAL.models.Holiday;

public class HolidayDAO {

    // CREATE
    public void addHoliday(Holiday holiday) throws Exception {
        Connection conn = DBConnection.getConnection();
        String sql = "INSERT INTO holidays (name, from_date, to_date, description) VALUES (?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, holiday.getName());
        ps.setDate(2, new java.sql.Date(holiday.getFromDate().getTime()));
        ps.setDate(3, new java.sql.Date(holiday.getToDate().getTime()));
        ps.setString(4, holiday.getDescription());
        ps.executeUpdate();
        conn.close();
    }

    // READ (all)
    public List<Holiday> getAllHolidays() throws Exception {
        List<Holiday> list = new ArrayList<>();
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM holidays";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            Holiday h = new Holiday();
            h.setId(rs.getInt("id"));
            h.setName(rs.getString("name"));
            h.setFromDate(rs.getDate("from_date"));
            h.setToDate(rs.getDate("to_date"));
            h.setDescription(rs.getString("description"));
            list.add(h);
        }
        conn.close();
        return list;
    }

    // READ (by ID)
    public Holiday getHolidayById(int id) throws Exception {
        Connection conn = DBConnection.getConnection();
        String sql = "SELECT * FROM holidays WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        Holiday h = null;

        if (rs.next()) {
            h = new Holiday();
            h.setId(rs.getInt("id"));
            h.setName(rs.getString("name"));
            h.setFromDate(rs.getDate("from_date"));
            h.setToDate(rs.getDate("to_date"));
            h.setDescription(rs.getString("description"));
        }
        conn.close();
        return h;
    }

    // UPDATE
    public void updateHoliday(Holiday holiday) throws Exception {
        Connection conn = DBConnection.getConnection();
        String sql = "UPDATE holidays SET name=?, from_date=?, to_date=?, description=? WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, holiday.getName());
        ps.setDate(2, new java.sql.Date(holiday.getFromDate().getTime()));
        ps.setDate(3, new java.sql.Date(holiday.getToDate().getTime()));
        ps.setString(4, holiday.getDescription());
        ps.setInt(5, holiday.getId());
        ps.executeUpdate();
        conn.close();
    }

    // DELETE
    public List<Holiday> deleteHoliday(int id) throws Exception {
        Connection conn = DBConnection.getConnection();
        String sql = "DELETE FROM holidays WHERE id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        conn.close();
        List<Holiday> list  = getAllHolidays();
        return list;
     
        
    }
}
