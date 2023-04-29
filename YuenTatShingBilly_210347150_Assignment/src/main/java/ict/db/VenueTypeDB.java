/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import ict.bean.UserBean;
import ict.bean.VenueTypeBean;
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
public class VenueTypeDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public VenueTypeDB(String url, String username, String password) {

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
                    = "CREATE TABLE IF NOT EXISTS VenueType("
                    + "VenueTypeID int(1) NOT NULL,"
                    + "VenueTypeName varchar(45) NOT NULL,"
                    + "Enable INT(1) NOT NULL,"
                    + "PRIMARY KEY (VenueTypeID)"
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

    public VenueTypeBean QueryByID(int VenueTypeID) {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        VenueTypeBean VTB = null;
        try {

            String preQueryStatement = "SELECT * FROM VENUETYPE WHERE VENUETYPEID = ?";
            cnnct = getConnection();
            ResultSet rs = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, VenueTypeID);
            rs = pStmnt.executeQuery();

            if (rs.next()) {

                VTB = new VenueTypeBean(
                        rs.getInt("VenueTypeID"),
                        rs.getString("VenueTypeName"),
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

        return VTB;
    }

    public boolean AddRecord(int VenueTypeID, String TypeName) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        int rowCount = 0;

        try {

            cnnct = getConnection();
            String preQueryStatment = "INSERT INTO VENUETYPE VALUES(?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatment);
            pStmnt.setInt(1, VenueTypeID);
            pStmnt.setString(2, TypeName);
            pStmnt.setInt(3, 1);

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

    public boolean Init() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        int rowCount = 0;
        String[] VenueTypeName = {"", "", ""};
        try {
            int y = 1;
            for (int x = 0; x < VenueTypeName.length; x++) {

                cnnct = getConnection();
                String preQueryStatment = "INSERT INTO VENUETYPE VALUES(?,?,?)";
                pStmnt = cnnct.prepareStatement(preQueryStatment);
                pStmnt.setInt(1, y);
                pStmnt.setString(2, VenueTypeName[x]);
                pStmnt.setInt(3, 1);
                y++;
                rowCount = pStmnt.executeUpdate();
            }
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

    public ArrayList<VenueTypeBean> QueryAllVenueType() {

        PreparedStatement pStmnt = null;
        Connection cnnct = null;
        VenueTypeBean VTB = null;
        ArrayList<VenueTypeBean> venueTypeBeans = new ArrayList<VenueTypeBean>();
        try {

            String preQueryStatement = "SELECT * FROM VENUETYPE";
            cnnct = getConnection();
            ResultSet rs = null;
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            rs = pStmnt.executeQuery();

            while (rs.next()) {
                VenueTypeBean venuetypebean;
                VTB = new VenueTypeBean(
                        rs.getInt("VenueTypeID"),
                        rs.getString("VenueTypeName"),
                        rs.getInt("Enable")
                );
                venueTypeBeans.add(VTB);

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

        return venueTypeBeans;
    }

    public boolean EditLocation(int TypeID, String TypeName, int Enabled) {

        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {

            cnnct = getConnection();
            String preQueryStatement = "UPDATE VENUETYPE SET  VENUETYPENAME = ?, ENABLE = ?  WHERE VENUETYPEID=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, TypeName);
            pStmnt.setInt(2, Enabled);
            pStmnt.setInt(3, TypeID);
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
