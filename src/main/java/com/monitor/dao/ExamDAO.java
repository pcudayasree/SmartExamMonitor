package com.monitor.dao;

import com.monitor.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExamDAO {

    public String authenticateUser(String username, String password) {
        String sql = "SELECT role FROM users WHERE username = ? AND password = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("role");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean logTabSwitch(String username) {
        String sql = "UPDATE exam_status SET tab_switch_count = tab_switch_count + 1 WHERE username = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, username);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Map<String, Object>> getLiveDashboardData() {
        List<Map<String, Object>> dataList = new ArrayList<>();
        String sql = "SELECT u.username, u.full_name, e.tab_switch_count, e.exam_status, e.last_updated " +
                     "FROM users u JOIN exam_status e ON u.username = e.username WHERE u.role = 'STUDENT'";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("username", rs.getString("username"));
                map.put("fullName", rs.getString("full_name"));
                map.put("tabSwitches", rs.getInt("tab_switch_count"));
                map.put("status", rs.getString("exam_status"));
                map.put("lastUpdate", rs.getTimestamp("last_updated"));
                dataList.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return dataList;
    }
}