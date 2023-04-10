/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.BookingBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author user
 */
public class BookingDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public BookingDB(String url, String username, String password) {

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
                    = "CREATE TABLE IF NOT EXISTS Booking("
                    + "BookingID varchar(25) NOT NULL,"
                    + "UserID varchar(25) NOT NULL,"
                    + "VenueID INT(1) NOT NULL,"
                    + "GuessListID varchar(25) NULL,"
                    + "BookingDate date NOT NULL,"
                    + "BookingTime Time NOT NULL,"
                    + "CreatedDate date NOT NULL,"
                    + "PersonInCharge double(5,2) NOT NULL,"
                    + "Status INT(1) NOT NULL,"
                    + "PRIMARY KEY (BookingID)"
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

    public ArrayList<BookingBean> QueryVenueBooking() {
        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {

            String preQueryStatement = "SELECT * FROM BOOKING";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getString("GuessListID"),
                        rs.getDate("BookingDate"),
                        rs.getTime("BookingTime"),
                        rs.getDate("CreatedDate"),
                        rs.getDouble("PersonInCharge"),
                        rs.getInt("Status")
                );
                bookingBeans.add(bookingbean);
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
        return bookingBeans;

    }

    public boolean AddRecord(String BookingID, String UserID, int VenueID, String GuessListID, String BookingDate, String BookingTime, int Status) throws ParseException {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date currentDate = new java.util.Date();
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");

            String formattedTime = "13:45:00";
            java.sql.Date bookingdate = new java.sql.Date(dateFormat.parse(BookingDate).getTime());
            java.sql.Time time = new java.sql.Time(timeFormat.parse(formattedTime).getTime());
            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO BOOKING VALUES(?,?,?,?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, BookingID);
            pStmnt.setString(2, UserID);
            pStmnt.setInt(3, VenueID);
            pStmnt.setString(4, GuessListID);
            pStmnt.setDate(5, bookingdate);
            pStmnt.setTime(6, time);
            pStmnt.setDate(7, new java.sql.Date(currentDate.getTime()));
            pStmnt.setDouble(8, 80.0);
            pStmnt.setInt(9, Status);
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

    public ArrayList<BookingBean> QueryVenueBookingByUserID(String UserID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {

            String preQueryStatement = "SELECT * FROM BOOKING WHERE USERID = ?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, UserID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getString("GuessListID"),
                        rs.getDate("BookingDate"),
                        rs.getTime("BookingTime"),
                        rs.getDate("CreatedDate"),
                        rs.getDouble("PersonInCharge"),
                        rs.getInt("Status")
                );
                bookingBeans.add(bookingbean);
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
        return bookingBeans;

    }

    public BookingBean QueryByID(String BookingID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        BookingBean bookingbean = null;
        try {

            String preQueryStatement = "SELECT * FROM BOOKING WHERE BOOKINGID=?";
            cnnct = getConnection();
            ResultSet rs = null;

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, BookingID);
            rs = pStmnt.executeQuery();

            if (rs.next()) {

                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getString("GuessListID"),
                        rs.getDate("BookingDate"),
                        rs.getTime("BookingTime"),
                        rs.getDate("CreatedDate"),
                        rs.getDouble("PersonInCharge"),
                        rs.getInt("Status")
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

        return bookingbean;

    }
}
