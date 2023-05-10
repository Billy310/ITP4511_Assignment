/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.BookingBean;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
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
                    + "BookingDate date NOT NULL,"
                    + "BookingStart INT(2) NOT NULL,"
                    + "BookingEnd INT(2) NOT NULL,"
                    + "CreatedDate DATE NOT NULL,"
                    + "CreatedTime DATETIME NOT NULL,"
                    + "Status INT(1) NOT NULL,"
                    + "Priority INT(1) NOT NULL,"
                    + "BookingFee DOUBLE(6,2) NOT NULL,"
                    + "PersonInCharge DOUBLE(6,2) NOT NULL,"
                    + "Remark VARCHAR(100) NOT NULL,"
                    + "Comment VARCHAR(100) NOT NULL,"
                    + "CheckStatus INT(1) NOT NULL,"
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
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
                );
//                                 + "BOOKINGFEE DOUBLE(6,2) NOT NULL,"
//                    + "PERSONINCHARGE DOUBLE(6,2) NOT NULL,"
//                    + "REMARK VARCHAR(100) NOT NULL,"
//                    + "COMMENT VARCHAR(100) NOT NULL,"
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

    public ArrayList<BookingBean> QueryVenueBookingNotApproved() {
        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {

            String preQueryStatement = "SELECT * FROM BOOKING WHERE STATUS = 3 AND PRIORITY = 1";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public boolean AddRecord(String BookingID, String UserID, int VenueID, String BookingDate, int BookingStart, int BookingEnd, int Status, int Priority, double BookingFee, Double PersonInCharge, String Remark, String Comment) throws ParseException {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            java.util.Date utilDate = new java.util.Date();
            System.out.println("java.util.Date time    : " + utilDate);
            //            java.util.Date currentDate = new java.util.Date();
            java.sql.Timestamp sqlTS = new java.sql.Timestamp(utilDate.getTime());
            System.out.println("java.sql.Timestamp time: " + sqlTS);
            DateFormat df = new SimpleDateFormat("dd/MM/YYYY hh:mm:ss:SSS");
            System.out.println("Date formatted         : " + df.format(utilDate));

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            java.util.Date currentDate = new java.util.Date();
            java.sql.Date bookingdate = new java.sql.Date(dateFormat.parse(BookingDate).getTime());

            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO BOOKING VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, BookingID);
            pStmnt.setString(2, UserID);
            pStmnt.setInt(3, VenueID);
            pStmnt.setDate(4, bookingdate);
            pStmnt.setInt(5, BookingStart);
            pStmnt.setInt(6, BookingEnd);
            pStmnt.setDate(7, new java.sql.Date(currentDate.getTime()));
            pStmnt.setTimestamp(8, sqlTS);
            pStmnt.setInt(9, Status);
            pStmnt.setInt(10, Priority);
            pStmnt.setDouble(11, BookingFee);
            pStmnt.setDouble(12, PersonInCharge);
            pStmnt.setString(13, Remark);
            pStmnt.setString(14, Comment);
            pStmnt.setInt(15, 3);
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
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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
            String preQueryStatement = "SELECT * FROM BOOKING WHERE venueID = ? AND BookingDate = ? AND STATUS >=0 AND STATUS <=1 ";
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
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingByPlace(int VenueID) {

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
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingByPlaceANDDate(int VenueID, ArrayList<java.sql.Date> rangeofdate) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {
            String preQueryStatement = "SELECT * FROM BOOKING WHERE VenueID = ? AND BookingDate >= ? AND BookingDate <= ? AND STATUS = 1";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            pStmnt.setDate(2, rangeofdate.get(0));
            pStmnt.setDate(3, rangeofdate.get(1));
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingByPlaceANDDateNotEqual(int VenueID, ArrayList<java.sql.Date> rangeofdate) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {
            String preQueryStatement = "SELECT * FROM BOOKING WHERE venueID != ? AND BookingDate >= ? AND BookingDate <= ? AND STATUS = 1";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            pStmnt.setDate(2, rangeofdate.get(0));
            pStmnt.setDate(3, rangeofdate.get(1));
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingByUserIDForToday(String UserID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {

            String preQueryStatement = "SELECT * FROM BOOKING WHERE USERID = ? AND CREATEDDATE = ? ";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);

            java.util.Date currentDate = new java.util.Date();

            pStmnt.setString(1, UserID);
            pStmnt.setDate(2, new java.sql.Date(currentDate.getTime()));

            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public boolean ApproveBooking(String BookingID, String Remark) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatment = "UPDATE BOOKING SET STATUS=0, REMARK = ? WHERE BOOKINGID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, Remark);
            pStmnt.setString(2, BookingID);

            int rowCount = pStmnt.executeUpdate();

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

    public boolean DeleteNoNeed(String BookingID) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            BookingBean bb = QueryByID(BookingID);
            String UserID = bb.getUserID();
            java.sql.Date create_date = bb.getCreatedDate();
//            String preQueryStatment = "DELETE FROM BOOKING WHERE BOOKINGID != ? AND CREATEDDATE = ? AND USERID = ?";
            String preQueryStatment = "UPDATE BOOKING SET STATUS = 2 WHERE STATUS !=0 AND CREATEDDATE = ? AND USERID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setDate(1, create_date);
            pStmnt.setString(2, UserID);

            pStmnt.executeUpdate();

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

    public BookingBean DenyBooking(String BookingID, String Remark) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        BookingBean bookingbean = null;
        ResultSet rs = null;

        try {

            cnnct = getConnection();
            BookingBean bb = QueryByID(BookingID);
            String UserID = bb.getUserID();
            java.sql.Date create_date = bb.getCreatedDate();
            String preQueryStatment = "UPDATE BOOKING SET REMARK = ? , STATUS=2 WHERE BOOKINGID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, Remark);
            pStmnt.setString(2, BookingID);

            pStmnt.executeUpdate();

            int Priority = bb.getPriority();

            preQueryStatment = "Select * FROM Booking WHERE CREATEDDATE = ? AND USERID = ? AND Priority = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setDate(1, create_date);
            pStmnt.setString(2, UserID);
            pStmnt.setInt(3, Priority + 1);

            rs = pStmnt.executeQuery();

            if (rs.next()) {
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingByStatusAndOrder(int Order, int Status) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList();
        String OrderType;
        String Status_Str;

        if (Status == 0) {
            Status_Str = "AND STATUS = 0";
        } else if (Status == 1) {
            Status_Str = "AND STATUS = 1";
        } else if (Status == 2) {
            Status_Str = "AND STATUS = 2";
        } else if (Status == 3) {
            Status_Str = "AND STATUS = 3";
        } else {
            Status_Str = "";
        }

        if (Order == 1) {
            OrderType = "ASC";
        } else {
            OrderType = "DESC";
        }

        try {
            String preQueryStatement = "SELECT * FROM BOOKING WHERE Priority = 1 " + Status_Str + " ORDER BY CREATEDTIME " + OrderType;
//            String preQueryStatement = "SELECT * FROM BOOKING " + Where + Status_Str + " ORDER BY CREATEDTIME " + OrderType;
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);

            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingByStatusAndOrderUserID(int Order, int Status, String UserID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList();
        String OrderType;
        if (Order == 1) {
            OrderType = "ASC";
        } else {
            OrderType = "DESC";
        }

        try {

            String preQueryStatement = "SELECT * FROM BOOKING  WHERE STATUS = ? AND USERID = ?  ORDER BY CREATEDTIME " + OrderType;
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, Status);
            pStmnt.setString(2, UserID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryForSimilarBooking(int LocationID, Date BookingDate, int StartTime, int EndTime, String BookingID) throws ParseException {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList();

        try {

            String preQueryStatement = "SELECT * FROM BOOKING  WHERE VENUEID = ? AND BOOKINGDATE = ? AND BOOKINGSTART >= ? AND BOOKINGEND <= ? AND BOOKINGID != ? AND STATUS = 0 ORDER BY CREATEDTIME ASC";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, LocationID);
            pStmnt.setDate(2, BookingDate);
            pStmnt.setInt(3, StartTime);
            pStmnt.setInt(4, EndTime);
            pStmnt.setString(5, BookingID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingByDateAndPlaceAndBookingID(int VenueID, String BookingDate, String BookingID) throws ParseException {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date bookingdate_date = new java.sql.Date(dateFormat.parse(BookingDate).getTime());
            String preQueryStatement = "SELECT * FROM BOOKING WHERE venueID = ? AND BookingDate = ? AND Status = 1 AND BOOKINGID != ?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            pStmnt.setDate(2, bookingdate_date);
            pStmnt.setString(3, BookingID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public boolean ChangeBookingCheckStatus(String BookingID, int BookingCheckStatus, String Remark) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatment = "UPDATE BOOKING SET CHECKSTATUS = ?, REMARK = ? WHERE BOOKINGID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, BookingCheckStatus);
            pStmnt.setString(2, Remark);
            pStmnt.setString(3, BookingID);

            int rowCount = pStmnt.executeUpdate();

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

    public ArrayList<BookingBean> QueryVenueBookingWithCheckStatus(int VenueID, ArrayList<java.sql.Date> rangeofdate) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {
//            String preQueryStatement = "SELECT * FROM BOOKING WHERE venueID = ? AND BookingDate >= ? AND BookingDate <= ?  ";
            String preQueryStatement = "SELECT * FROM BOOKING WHERE VenueID = ? AND BookingDate >= ? AND BookingDate <= ? AND CHECKSTATUS = 4";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            pStmnt.setDate(2, rangeofdate.get(0));
            pStmnt.setDate(3, rangeofdate.get(1));
//            pStmnt.setInt(4, CheckStatus);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingWithNoCheckStatus(int VenueID, ArrayList<java.sql.Date> rangeofdate) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {
            String preQueryStatement = "SELECT * FROM BOOKING WHERE venueID = ? AND BookingDate >= ? AND BookingDate <= ? AND CheckStatus != 4 AND STATUS = 1  ";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            pStmnt.setDate(2, rangeofdate.get(0));
            pStmnt.setDate(3, rangeofdate.get(1));
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public boolean BookingEditTime(String BookingID, int BookingStart, int BookingEnd) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatment = "UPDATE BOOKING SET BOOKINGSTART = ?, BOOKINGEND = ? WHERE BOOKINGID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, BookingStart);
            pStmnt.setInt(2, BookingEnd);
            pStmnt.setString(3, BookingID);
            pStmnt.executeUpdate();

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
//            cnnct = getConnection();
//            BookingBean bb = QueryByID(BookingID);
//            String UserID = bb.getUserID();
//            java.sql.Date create_date = bb.getCreatedDate();
//            String preQueryStatment = "UPDATE BOOKING SET STATUS=2 WHERE BOOKINGID = ?";
//            pStmnt = cnnct.prepareStatement(preQueryStatment);
//            pStmnt.setString(1, BookingID);
//
//            pStmnt.executeUpdate();

    public boolean EditCustomerComment(String BookingID, String Comment) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatment = "UPDATE BOOKING SET COMMENT = ? WHERE BOOKINGID = ? ";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, Comment);
            pStmnt.setString(2, BookingID);
            pStmnt.executeUpdate();

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

    public void QueryVenueBookingToCSV() {
        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {

            String desktopPath = System.getProperty("user.home") + File.separator + "Desktop";
            PrintWriter pw = new PrintWriter(new File(desktopPath + "\\booking.csv"));
            StringBuilder sb = new StringBuilder();
            String preQueryStatement = "SELECT * FROM BOOKING";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            rs = pStmnt.executeQuery();
            while (rs.next()) {

                sb.append(rs.getString("BookingID"));
                sb.append(",");
                sb.append(rs.getString("UserID"));
                sb.append(",");
                sb.append(rs.getInt("VenueID"));
                sb.append(",");
                sb.append(rs.getDate("BookingDate"));
                sb.append(",");
                sb.append(rs.getDate("CreatedDate"));
                sb.append(",");
                sb.append(rs.getTimestamp("CreatedTime"));
                sb.append(",");
                sb.append(rs.getInt("BookingStart"));
                sb.append(",");
                sb.append(rs.getInt("BookingEnd"));
                sb.append(",");
                sb.append(rs.getInt("Status"));
                sb.append(",");
                sb.append(rs.getInt("Priority"));
                sb.append(",");
                sb.append(rs.getDouble("BOOKINGFEE"));
                sb.append(",");
                sb.append(rs.getDouble("PERSONINCHARGE"));
                sb.append(",");
                sb.append(rs.getString("REMARK"));
                sb.append(",");
                sb.append(rs.getString("COMMENT"));
                sb.append(",");
                sb.append(rs.getInt("CheckStatus"));
                sb.append("\r\n");
            }
            pw.write(sb.toString());
            pw.close();
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

    }

    public ArrayList<BookingBean> QueryVenueBookingByStatusAndOrderAndUserID(int Order, int Status, String UserID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList();
        String OrderType;
        String Status_Str;

        if (Status == 1) {
            Status_Str = "AND STATUS = 1";
        } else if (Status == 2) {
            Status_Str = "AND STATUS = 2";
        } else if (Status == 3) {
            Status_Str = "AND STATUS = 3";
        } else {
            Status_Str = "";
        }

        if (Order == 1) {
            OrderType = "ASC";
        } else {
            OrderType = "DESC";
        }

        try {

            String preQueryStatement = "SELECT * FROM BOOKING WHERE USERID = ?" + Status_Str + " ORDER BY CREATEDTIME " + OrderType;
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
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryVenueBookingBydOrderUserID(int Order, String UserID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList();
        String OrderType;
        if (Order == 1) {
            OrderType = "ASC";
        } else {
            OrderType = "DESC";
        }

        try {

            String preQueryStatement = "SELECT * FROM BOOKING  WHERE STATUS < 4 AND USERID = ? AND Priority = 1 ORDER BY CREATEDTIME " + OrderType;
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
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public ArrayList<BookingBean> QueryBookingPiority(String UserID, Date CreatedDate) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList();

        try {

            String preQueryStatement = "SELECT * FROM BOOKING  WHERE  USERID = ? AND CreatedDate = ?  ORDER BY Priority ASC";
            cnnct = getConnection();
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, UserID);
            pStmnt.setDate(2, CreatedDate);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public int QueryBookingWithStatus(String UserID, Date CreatedDate) {

        int Status = 3;
        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList();

        try {

            String preQueryStatement = "SELECT * FROM BOOKING  WHERE  USERID = ? AND CreatedDate = ?  ORDER BY Priority ASC";
            cnnct = getConnection();
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, UserID);
            pStmnt.setDate(2, CreatedDate);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
                );
                bookingBeans.add(bookingbean);
            }

            pStmnt.close();
            cnnct.close();
            for (int x = 0; x < bookingBeans.size(); x++) {
                BookingBean bb = bookingBeans.get(x);
                int BeanStatus = bb.getStatus();
                if (BeanStatus >= 0 && BeanStatus <= 2) {
                    return 1;
                } else {
                    return 3;
                }
            }
        } catch (SQLException ex) {
            while (ex != null) {

                ex.printStackTrace();
                ex = ex.getNextException();

            }
        } catch (IOException ex) {

            ex.printStackTrace();

        }
        return Status;

    }

    public boolean SetToPay(String BookingID) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();

//            String preQueryStatment = "DELETE FROM BOOKING WHERE BOOKINGID != ? AND CREATEDDATE = ? AND USERID = ?";
            String preQueryStatment = "UPDATE BOOKING SET STATUS = 1 WHERE  BOOKINGID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, BookingID);

            pStmnt.executeUpdate();

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

    public boolean UpdateRemark(String BookingID, String Remark) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatment = "UPDATE BOOKING SET  REMARK = ? WHERE BOOKINGID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, Remark);
            pStmnt.setString(2, BookingID);

            int rowCount = pStmnt.executeUpdate();

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

    public ArrayList<BookingBean> QueryVenueBookingSameDateSameVenueSameUser(int VenueID, String BookingDate, String UserID, String BookingID) throws ParseException {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<BookingBean> bookingBeans = new ArrayList<BookingBean>();

        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.sql.Date bookingdate_date = new java.sql.Date(dateFormat.parse(BookingDate).getTime());
            String preQueryStatement = "SELECT * FROM BOOKING WHERE venueID = ? AND BookingDate = ? AND USERID = ? AND BOOKINGID != ?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueID);
            pStmnt.setDate(2, bookingdate_date);
            pStmnt.setString(3, UserID);
            pStmnt.setString(4, BookingID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                BookingBean bookingbean;
                bookingbean = new BookingBean(
                        rs.getString("BookingID"),
                        rs.getString("UserID"),
                        rs.getInt("VenueID"),
                        rs.getDate("BookingDate"),
                        rs.getDate("CreatedDate"),
                        rs.getTimestamp("CreatedTime"),
                        rs.getInt("BookingStart"),
                        rs.getInt("BookingEnd"),
                        rs.getInt("Status"),
                        rs.getInt("Priority"),
                        rs.getDouble("BOOKINGFEE"),
                        rs.getDouble("PERSONINCHARGE"),
                        rs.getString("REMARK"),
                        rs.getString("COMMENT"),
                        rs.getInt("CheckStatus")
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

    public boolean CancelBooking(String BookingID) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            BookingBean bb = QueryByID(BookingID);
            String UserID = bb.getUserID();
            java.sql.Date create_date = bb.getCreatedDate();
            String preQueryStatment = "DELETE FROM BOOKING WHERE USERID = ? AND CREATEDDATE = ? ";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, UserID);
            pStmnt.setDate(2, create_date);

            pStmnt.executeUpdate();

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
