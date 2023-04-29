/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.VenueLocationBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class VenueLocationDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public VenueLocationDB(String url, String username, String password) {

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
                    = "CREATE TABLE IF NOT EXISTS VenueLocation("
                    + "VenueLocationID int(1) NOT NULL,"
                    + "VenueLocationName varchar(45) NOT NULL,"
                    + "VenueLocation_X double(10,5) NOT NULL,"
                    + "VenueLocation_Y double(10,5) NOT NULL,"
                    + "Enable INT(1) NOT NULL,"
                    + "PRIMARY KEY (VenueLocationID)"
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

    public VenueLocationBean QueryByLocationID(int LocationID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        VenueLocationBean VLB = null;
        try {

            String preQueryStatement = "SELECT * FROM VENUELOCATION WHERE VENUELOCATIONID=?";
            cnnct = getConnection();
            ResultSet rs = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, LocationID);
            rs = pStmnt.executeQuery();

            if (rs.next()) {

                VLB = new VenueLocationBean(
                        rs.getInt("VenueLocationID"),
                        rs.getString("VenueLocationName"),
                        rs.getDouble("VenueLocation_X"),
                        rs.getDouble("VenueLocation_Y"),
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

        return VLB;

    }
    public boolean AddLocation(int LocationID,String LocationName,double x_cord,double y_cord) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        int rowCount = 0;
        try {


                cnnct = getConnection();
                String preQueryStatment = "INSERT INTO VENUELOCATION VALUES(?,?,?,?,?)";
                pStmnt = cnnct.prepareStatement(preQueryStatment);
                pStmnt.setInt(1, LocationID);
                pStmnt.setString(2,LocationName);
                pStmnt.setDouble(3,x_cord);
                 pStmnt.setDouble(4,y_cord);
                pStmnt.setInt(5, 1);
                
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

    public boolean AddRecord() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        int rowCount = 0;
        String[] VenueTypeName = {"Tuen Mun", "Sha Tin", "Tsing Yi", "Lee Wai Lee", "Chai Wan"};
        try {
            int y = 1;
            for (int x = 0; x < VenueTypeName.length; x++) {

                cnnct = getConnection();
                String preQueryStatment = "INSERT INTO VENUELOCATION VALUES(?,?,?)";
                pStmnt = cnnct.prepareStatement(preQueryStatment);
                pStmnt.setInt(1, y);
                pStmnt.setString(2, VenueTypeName[x]);
                pStmnt.setInt(3, 1);
                y++;
                rowCount = pStmnt.executeUpdate();

                if (rowCount >= 1) {

                    isSuccess = true;
                }
                pStmnt.close();
                cnnct.close();
            }
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

    public ArrayList<VenueLocationBean> QueryLocation() {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        ResultSet rs = null;
        ArrayList<VenueLocationBean> userbeans = new ArrayList<VenueLocationBean>();

        try {

            String preQueryStatement = "SELECT * FROM VENUELOCATION";
            cnnct = getConnection();

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                VenueLocationBean userbean;
                userbean = new VenueLocationBean(
                        rs.getInt("VenueLocationID"),
                        rs.getString("VenueLocationName"),
                        rs.getDouble("VenueLocation_X"),
                        rs.getDouble("VenueLocation_Y"),
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

    public boolean EditLocation(int LocationID, String LocationName, double Cord_x, double Cord_y, int Enabled) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatement = "UPDATE VENUELOCATION SET  VENUELOCATIONNAME = ?, VENUELOCATION_X = ?, VENUELOCATION_Y = ?, ENABLE = ?  WHERE VENUELOCATIONID=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, LocationName);
            pStmnt.setDouble(2, Cord_x);
            pStmnt.setDouble(3, Cord_y);
            pStmnt.setInt(4, Enabled);
            pStmnt.setInt(5, LocationID);
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
