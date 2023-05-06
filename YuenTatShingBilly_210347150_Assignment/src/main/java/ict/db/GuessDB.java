/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.GuessBean;
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
public class GuessDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public GuessDB(String url, String username, String password) {

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
                    = "CREATE TABLE IF NOT EXISTS Guess("
                    + "GuessID varchar(25) NOT NULL,"
                    + "GuessListID varchar(25) NOT NULL,"
                    + "FirstName varchar(45) NOT NULL,"
                    + "LastName varchar(45) NOT NULL,"
                    + "Email varchar(45) NOT NULL,"
                    + "PhoneNumber varchar(45) NOT NULL,"
                    + "PRIMARY KEY (GuessID)"
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

    public ArrayList<GuessBean> QueryGuessBeanByGuessListID(String GuessListID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<GuessBean> guessbeans = new ArrayList<GuessBean>();

        try {

            String preQueryStatement = "SELECT * FROM GUESS WHERE GUESSLISTID = ?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, GuessListID);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                GuessBean guessbean;
                guessbean = new GuessBean(
                        rs.getString("GuessID"),
                        rs.getString("GuessListID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber")
                );
                guessbeans.add(guessbean);
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
        return guessbeans;

    }

    public boolean AddRecord(String GuessID, String GuessListID, String FirstName, String LastName, String Email, String PhoneNumber) throws ParseException {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO GUESS VALUES(?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, GuessID);
            pStmnt.setString(2, GuessListID);
            pStmnt.setString(3, FirstName);
            pStmnt.setString(4, LastName);
            pStmnt.setString(5, Email);
            pStmnt.setString(6, PhoneNumber);
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
    
    
     public boolean RemoveRecord(String GuessID) {

        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        Connection cnnct = null;
        try {

            String preQueryStatement = "DELETE FROM GUESS WHERE GUESSID=?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, GuessID);
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
     
      public ArrayList<GuessBean> QueryGuessBeanByLastName(String GuessListID,String LastName) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<GuessBean> guessbeans = new ArrayList<GuessBean>();

        try {

            String preQueryStatement = "SELECT * FROM GUESS WHERE GUESSLISTID = ? AND LASTNAME = ?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, GuessListID);
            pStmnt.setString(2, LastName);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                GuessBean guessbean;
                guessbean = new GuessBean(
                        rs.getString("GuessID"),
                        rs.getString("GuessListID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber")
                );
                guessbeans.add(guessbean);
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
        return guessbeans;

    }

}
