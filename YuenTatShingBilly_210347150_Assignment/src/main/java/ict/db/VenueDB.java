/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.UserBean;
import ict.bean.VenueBean;
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
public class VenueDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public VenueDB(String url, String username, String password) {

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

    public void createVenueTable() {
        Statement stmnt = null;
        Connection cnnct = null;
        try {

            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS venue("
                    + "venueID int(1) NOT NULL,"
                    + "venueTypeID int(1) NOT NULL,"
                    + "venueLocationID int(1) NOT NULL,"
                    + "venueName varchar(25) NOT NULL,"
                    + "venueDescription varchar(100) NOT NULL,"
                    + "Enable boolean NOT NULL DEFAULT TRUE,"
                    + "PRIMARY KEY (venueID)"
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

    public VenueBean queueVenueByVenueID(int VenueID) {
        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        VenueBean venueBean = null;
        try {

            String preQueryStatement = "SELECT * FROM VENUE WHERE VENUEID=?";
            cnnct = getConnection();
            ResultSet rs = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            rs = pStmnt.executeQuery();

            if (rs.next()) {

                venueBean = new VenueBean(
                rs.getInt("venueID"),
                        rs.getInt("venueTypeID"),
                        rs.getInt("venueLocationID"),
                        rs.getString("venueName"),
                        rs.getString("venueDescription"),
                        rs.getInt("Enable")
                        
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

        return venueBean;
    }

}
