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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

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
//BookingStart,BookingEnd
            cnnct = getConnection();
            stmnt = cnnct.createStatement();
            String sql
                    = "CREATE TABLE IF NOT EXISTS Booking("
                    + "BookingID varchar(25) NOT NULL,"
                    + "UserID varchar(25) NOT NULL,"
                    + "VenueID INT(1) NOT NULL,"
                    + "GuessListID varchar(25) NULL,"
                    + "BookingDate date NOT NULL,"
                    + "BookingStart INT(2) NOT NULL,"
                    + "BookingEnd INT(2) NOT NULL,"
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
                        rs.getDate("CreatedDate"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
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

    public boolean AddRecord(String BookingID, String UserID, int VenueID, String GuessListID, String BookingDate, int BookingStart, int BookingEnd, int Status) throws ParseException {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date currentDate = new java.util.Date();

            java.sql.Date bookingdate = new java.sql.Date(dateFormat.parse(BookingDate).getTime());
            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO BOOKING VALUES(?,?,?,?,?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, BookingID);
            pStmnt.setString(2, UserID);
            pStmnt.setInt(3, VenueID);
            pStmnt.setString(4, GuessListID);
            pStmnt.setDate(5, bookingdate);
            pStmnt.setInt(6, BookingStart);
            pStmnt.setInt(7, BookingEnd);
            pStmnt.setDate(8, new java.sql.Date(currentDate.getTime()));
            pStmnt.setDouble(9, 80.0);
            pStmnt.setInt(10, Status);
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
                        rs.getDate("CreatedDate"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
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

    public ArrayList<BookingBean> QueryVenueBookingByDateAndPlace(int VenueID, String BookingDate) throws ParseException {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date bookingdate_date = new java.sql.Date(dateFormat.parse(BookingDate).getTime());
            String preQueryStatement = "SELECT * FROM BOOKING WHERE venueID = ? AND BookingDate = ?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            pStmnt.setDate(2, bookingdate_date);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getString("GuessListID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
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
                        rs.getDate("CreatedDate"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
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
    
    public BookingBean QueryByBookingID(String BookingID) {

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
                        rs.getDate("CreatedDate"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
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
    
        public ArrayList<BookingBean> QueryVenueBookingByPlace(int VenueID){

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {
            String preQueryStatement = "SELECT * FROM BOOKING WHERE venueID = ?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getString("GuessListID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
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
    
    
    
}
