/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.VenueBean;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

    public void createTable() {
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

    public ArrayList<VenueBean> QueryVenue() {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<VenueBean> userbeans = new ArrayList<VenueBean>();

        try {

            String preQueryStatement = "SELECT * FROM VENUE";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                VenueBean userbean;
                userbean = new VenueBean(
                        rs.getInt("venueID"),
                        rs.getInt("venueTypeID"),
                        rs.getInt("venueLocationID"),
                        rs.getString("venueName"),
                        rs.getString("venueDescription"),
                        rs.getInt("Enable")
                );
                userbeans.add(userbean);
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
        return userbeans;

    }

    public ArrayList<VenueBean> QueryVenueByLocationID(int LocationID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<VenueBean> userbeans = new ArrayList<VenueBean>();

        try {

            String preQueryStatement = "SELECT * FROM VENUE WHERE venueLocationID = ?";
            cnnct = getConnection();
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, LocationID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                VenueBean userbean;
                userbean = new VenueBean(
                        rs.getInt("venueID"),
                        rs.getInt("venueTypeID"),
                        rs.getInt("venueLocationID"),
                        rs.getString("venueName"),
                        rs.getString("venueDescription"),
                        rs.getInt("Enable")
                );
                userbeans.add(userbean);
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
        return userbeans;

    }

    public boolean AddVenue(int VenueID, String VenueName, int VenueTypeID, int VenueLocationID, String VenueDescription) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO VENUE VALUES(?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);

            pStmnt.setInt(1, VenueID);
            pStmnt.setString(2, VenueName);
            pStmnt.setInt(3, VenueTypeID);
            pStmnt.setInt(4, VenueLocationID);
            pStmnt.setString(5, VenueDescription);
            pStmnt.setInt(6, 1);
            pStmnt.executeUpdate();
            isSuccess = true;
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

        return isSuccess;

    }

    public boolean EditVenue(int VenueID, String VenueName, int VenueTypeID, int VenueLocationID, String VenueDescription, int Enable) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatement = "UPDATE VENUE SET VENUETYPEID=?,VENUELOCATIONID=?,VENUENAME=?,VENUEDESCRIPTION=?, ENABLE = ?  WHERE VENUEID=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            
            pStmnt.setInt(1, VenueTypeID);
            pStmnt.setInt(2, VenueLocationID);
            pStmnt.setString(3, VenueName);
            pStmnt.setString(4, VenueDescription);
                 pStmnt.setInt(5, Enable);
            pStmnt.setInt(6, VenueID);
          
            pStmnt.executeUpdate();
            isSuccess = true;
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
        return isSuccess;

    }

}
