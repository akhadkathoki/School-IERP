package com.IERP_FINAL.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.IERP_FINAL.models.StudentAttendance;

public class AttendanceDAO {
    private Connection conn;

    public AttendanceDAO(Connection conn) {
        this.conn = conn;
    }

    public void saveAttendance(List<StudentAttendance> list) throws Exception {
        String sql = "INSERT INTO attendance (student_id, roll_no, name, parent_name, subject_name, month, class_name, total_classes, total_present, total_absent) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (StudentAttendance sa : list) {
              
                ps.setInt(1, sa.getStudentId());
                ps.setString(2, sa.getRollNo());
                ps.setString(3, sa.getName());
                ps.setString(4, sa.getParentName());
                ps.setString(5, sa.getSubjectName());
                ps.setString(6, sa.getMonth());
                ps.setString(7, sa.getClassName());
                ps.setInt(8, sa.getTotalClass());
                ps.setInt(9, sa.getTotalPresent());
                ps.setInt(10, sa.getTotalAbsent());

                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    public boolean attendanceExists(int studentId, String month) throws Exception {
        String sql = "SELECT COUNT(*) FROM attendance WHERE student_id=? AND month=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setString(2, month);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        }
    }

    public void updateAttendance(StudentAttendance sa) throws Exception {
        String sql = "UPDATE attendance SET subject_name=?, class_name=?, total_present=?, total_absent=? " +
                     "WHERE student_id=? AND month=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
         

            ps.setString(1, sa.getSubjectName());
            ps.setString(2, sa.getClassName());
            ps.setInt(3, sa.getTotalPresent());
            ps.setInt(4, sa.getTotalAbsent());
            
            ps.setInt(5, sa.getStudentId());
            ps.setString(6, sa.getMonth());

            ps.executeUpdate();
        }
    }

    public List<StudentAttendance> getAllAttendance(String className) throws Exception {
        List<StudentAttendance> list = new ArrayList<>();
        String sql = "SELECT * FROM attendance WHERE class_name = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, className);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    StudentAttendance sa = new StudentAttendance();
                    sa.setStudentId(rs.getInt("student_id"));
                    sa.setRollNo(rs.getString("roll_no"));
                    sa.setName(rs.getString("name"));
                    sa.setParentName(rs.getString("parent_name"));
                    sa.setSubjectName(rs.getString("subject_name"));
                    sa.setMonth(rs.getString("month"));
                    sa.setClassName(rs.getString("class_name"));
                    sa.setTotalPresent(rs.getInt("total_present"));
                    sa.setTotalAbsent(rs.getInt("total_absent"));
                    sa.setAttendancePercent(rs.getInt("attendance_percent"));
                    list.add(sa);
                }
            }
        }
        return list;
    }

    public List<StudentAttendance> getAttendanceByMonthAndClass(String month, String className) throws Exception {
        List<StudentAttendance> list = new ArrayList<>();
        String sql = "SELECT * FROM attendance WHERE month=? AND class_name=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, month);
            ps.setString(2, className);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    StudentAttendance sa = new StudentAttendance();
                    sa.setStudentId(rs.getInt("student_id"));
                    sa.setRollNo(rs.getString("roll_no"));
                    sa.setName(rs.getString("name"));
                    sa.setParentName(rs.getString("parent_name"));
                    sa.setSubjectName(rs.getString("subject_name"));
                    sa.setMonth(rs.getString("month"));
                    sa.setClassName(rs.getString("class_name"));
                    sa.setTotalPresent(rs.getInt("total_present"));
                    sa.setTotalAbsent(rs.getInt("total_absent"));
                    sa.setAttendancePercent(rs.getInt("attendance_percent"));
                    list.add(sa);
                }
            }
        }
        return list;
    }
}
