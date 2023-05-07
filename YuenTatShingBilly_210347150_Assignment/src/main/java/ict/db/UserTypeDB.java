/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.UserTypeBean;
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
public class UserTypeDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public UserTypeDB(String url, String username, String password) {

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
                    = "CREATE TABLE IF NOT EXISTS UserType("
                    + "UserTypeID int(3) NOT NULL,"
                    + "UserTypeName varchar(40) NOT NULL,"
                    + "PRIMARY KEY (UserTypeID)"
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

    public ArrayList<UserTypeBean> QueueUserType() {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<UserTypeBean> userTypeBeans = new ArrayList<UserTypeBean>();

        try {

            String preQueryStatement = "SELECT * FROM USERTYPE";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                UserTypeBean usertypebean;
                usertypebean = new UserTypeBean(
                        rs.getInt("UserTypeID"),
                        rs.getString("UserTypeName")
                );
                userTypeBeans.add(usertypebean);
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
        return userTypeBeans;

    }

    public UserTypeBean QueryByID(int UserTypeID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        UserTypeBean UTB = null;
        try {

            String preQueryStatement = "SELECT * FROM USERTYPE WHERE USERTYPEID=?";
            cnnct = getConnection();
            ResultSet rs = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, UserTypeID);
            rs = pStmnt.executeQuery();

            if (rs.next()) {

                UTB = new UserTypeBean(
                        rs.getInt("UserTypeID"),
                        rs.getString("UserTypeName")
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

        return UTB;

    }
    
       public boolean AddRecord(String UserTypeName) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        int rowCount = 0;

        try {

            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO USERTYPE VALUES(?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, QueueUserType().size()+1);
            pStmnt.setString(2, UserTypeName);

            rowCount = pStmnt.executeUpdate();

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
       
       public boolean EditRecord(int TypeID,String UserTypeName) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        int rowCount = 0;

        try {

            cnnct = getConnection();
            String preQueryStatment = "UPDATE USERTYPE SET USERTYPENAME = ? WHERE USERTYPEID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, UserTypeName);
            pStmnt.setInt(2, TypeID);

            rowCount = pStmnt.executeUpdate();

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
}
