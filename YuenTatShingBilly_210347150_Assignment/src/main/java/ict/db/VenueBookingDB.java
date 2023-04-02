/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.VenueBookingBean;
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
public class VenueBookingDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public VenueBookingDB(String url, String username, String password) {

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

    public void createVenueBookingTable() {
        Statement stmnt = null;
        Connection cnnct = null;
        try {

            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS venuebooking("
                    + "venuebookingID varchar(25) NOT NULL,"
                    + "userID varchar(25) NOT NULL,"
                    + "venueID int(1) NOT NULL,"
                    + "venueID int(1) NOT NULL,"
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

    public boolean DisableVenueBooking(String VenueBookingID) {

        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        Connection cnnct = null;
        try {

            String preQueryStatement = "\"UPDATE VENUEBOOKING SET ENABLE = 0 WHERE VENUEBOOKINGID = ? AND USERID = ?\";?";

            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
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

    public boolean AddVenueBooking(String UserID, String Username, String Email, String Password, int Enable) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO VENUEBOOKING VALUES(?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, UserID);
            pStmnt.setString(2, Username);
            pStmnt.setString(3, Password);
            pStmnt.setString(4, Email);
            pStmnt.setInt(5, Enable);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {

                isSuccess = true;
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
        return isSuccess;
    }

    public ArrayList<VenueBookingBean> QueryVenueBookingByUserID(String UserID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<VenueBookingBean> venueBookingBeans = new ArrayList<VenueBookingBean>();

        try {

            String preQueryStatement = "SELECT * FROM BOOKING WHERE USERID=?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, UserID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                VenueBookingBean venueBookingBean;
                venueBookingBean = new VenueBookingBean(
                        rs.getString("BookingID"),
                        rs.getString("BookingRequestID"),
                        rs.getString("userID"),
                        rs.getInt("VenueID"),
                        rs.getInt("Enable")
                );
                venueBookingBeans.add(venueBookingBean);
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
        return venueBookingBeans;

    }
}
