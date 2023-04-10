/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.UserBean;
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
public class UserDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public UserDB(String url, String username, String password) {

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
                    = "CREATE TABLE IF NOT EXISTS user("
                    + "userID varchar(25) NOT NULL,"
                    + "username varchar(25) NOT NULL,"
                    + "password varchar(25) NOT NULL,"
                    + "email varchar(25) NOT NULL,"
                    + "Role int(1) NOT NULL,"
                    + "Enable boolean NOT NULL DEFAULT TRUE,"
                    + "PRIMARY KEY (userID)"
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

    public boolean AddRecord(String UserID, String Username, String Email, String Password, int Role, int Enable) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO USER VALUES(?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setString(1, UserID);
            pStmnt.setString(2, Username);
            pStmnt.setString(3, Password);
            pStmnt.setString(4, Email);
            pStmnt.setInt(5, Role);
            pStmnt.setInt(6, Enable);
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

    public boolean RemoveRecord(String UserID) {

        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        Connection cnnct = null;
        try {

            String preQueryStatement = "DELETE FROM USER WHERE USERID=?";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, UserID);
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
    
    public boolean DisableAccount(String UserID){
    
    
         PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        Connection cnnct = null;
        try {

            String preQueryStatement = "UPDATE USER SET ENABLE=0 WHERE USERID=?";

            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);

            pStmnt.setString(1, UserID);
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

    public boolean EditRecord(String UserID, String Username, String Password,int Enable, String Email) {

        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        Connection cnnct = null;
        try {

            String preQueryStatement = "UPDATE USER SET USERNAME=?,PASSWORD=?,EMAIL=?,ENABLE=? WHERE USERID=?";

            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);

            pStmnt.setString(1, Username);
            pStmnt.setString(2, Password);
            pStmnt.setString(3, Email);
            pStmnt.setInt(4, Enable);
            pStmnt.setString(5, UserID);
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

    public ArrayList<UserBean> QueryUser() {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<UserBean> userbeans = new ArrayList<UserBean>();

        try {

            String preQueryStatement = "SELECT * FROM USER";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                UserBean userbean;
                userbean = new UserBean(
                        rs.getString("userID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getInt("Role"),
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

    public UserBean QueryUserByName(String Name) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        UserBean userbean = null;
        try {

            String preQueryStatement = "SELECT * FROM USER WHERE LOWER(USERNAME)=LOWER(?)";
            cnnct = getConnection();
            ResultSet rs = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, Name);
            rs = pStmnt.executeQuery();

            if (rs.next()) {

                userbean = new UserBean(
                        rs.getString("userID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getInt("Role"),
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

        return userbean;

    }

    public UserBean QueryUserByID(String ID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        UserBean userbean = null;
        try {

            String preQueryStatement = "SELECT * FROM USER WHERE USERID=?";
            cnnct = getConnection();
            ResultSet rs = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, ID);
            rs = pStmnt.executeQuery();

            if (rs.next()) {

                userbean = new UserBean(
                        rs.getString("userID"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getInt("Role"),
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

        return userbean;

    }
    
    public boolean EditPersonalRecord(String UserID, String Username, String Password, String Email) {

        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        Connection cnnct = null;
        try {

            String preQueryStatement = "UPDATE USER SET USERNAME=?,PASSWORD=?,EMAIL=? WHERE USERID=?";

            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);

            pStmnt.setString(1, Username);
            pStmnt.setString(2, Password);
            pStmnt.setString(3, Email);
            pStmnt.setString(4, UserID);
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
