/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

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
}
