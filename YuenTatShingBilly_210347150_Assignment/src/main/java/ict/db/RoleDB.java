/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.RoleBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author user
 */
public class RoleDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public RoleDB(String url, String username, String password) {

        this.url = url;
        this.password = password;
        this.username = username;

    }

    public Connection getConnection() throws SQLException, IOException {

        try {

            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {

            ex.printStackTrace();
        }
        return DriverManager.getConnection(url, username, password);

    }
    
       public void createTable() {
        Statement stmnt = null;
        Connection cnnct = null;
        try {

            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS Role("
                    + "RoleID int(2) NOT NULL,"
                    + "RoleName varchar(25) NOT NULL,"
                    + "PRIMARY KEY (RoleID)"
                    + ")";
            stmnt.execute(sql);
            stmnt.close();
            cnnct.close();
        } catch (SQLException ex) {

            while (ex != null) {

                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {

            ex.printStackTrace();

        }
    }
       
        public RoleBean QueryRoleByID(int RoleID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        RoleBean rolebean = null;
        try {

            String preQueryStatement = "SELECT * FROM ROLE WHERE RoleID = ?";
            cnnct = getConnection();
            ResultSet rs = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, RoleID);
            rs = pStmnt.executeQuery();

            if (rs.next()) {

                rolebean = new RoleBean(
                        rs.getInt("RoleID"),
                        rs.getString("RoleName")
                );

            }

            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {

                ex.printStackTrace();
                ex = ex.getNextException();

            }
        } catch (IOException ex) {

            ex.printStackTrace();

        }

        return rolebean;

    }
}
