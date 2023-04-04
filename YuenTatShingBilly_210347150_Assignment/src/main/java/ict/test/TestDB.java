/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.test;

import ict.bean.UserBean;
import ict.bean.VenueBean;
import ict.bean.VenueLocationBean;
import ict.db.BookingDB;
import ict.db.GuessDB;
import ict.db.GuessListDB;
import ict.db.UserDB;
import ict.db.VenueDB;
import ict.db.VenueLocationDB;
import ict.db.VenueTypeDB;
import ict.personal.RandomString;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author user
 */
public class TestDB {

    public static void main(String[] args) throws ParseException {
//        CreateDB();
        VenueLocationDB VLB = new VenueLocationDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
        VLB.createTable();
//        VLB.QueryLocation();
    }

    public static void givenUsingPlainJava_whenGeneratingRandomStringUnbounded_thenCorrect() {
        byte[] array = new byte[7]; // length is bounded by 7
        new Random().nextBytes(array);
        String generatedString = new String(array, Charset.forName("UTF-8"));

        System.out.println(generatedString);
    }

    public static void CreateDB() throws ParseException {

//        UserDB UserDB_ = new UserDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
//        UserDB_.createTable();
//        System.out.print(UserDB_.QueryUserByName("billy0310").getUserID());
        BookingDB BookingDB_ = new BookingDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
        BookingDB_.createTable();
        String UserID = "CQd1p7tdxG6GWNjb9d1xLi53P";
        String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
        RandomString tickets = new RandomString(25, new SecureRandom(), easy);
        String BookingID = tickets.nextString();
        BookingDB_.AddRecord(BookingID, UserID, 1, null, "2023-05-01", "13:45:00", 3);
//        VenueDB VenueDB_ = new VenueDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
//        VenueDB_.createVenueTable();
//        VenueTypeDB VTB = new VenueTypeDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
//        VTB.createVenueTypeTable();
//        VenueLocationDB VLB = new VenueLocationDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
//        VLB.createVenueLocationTable();
//        GuessListDB GuessListDB_ = new GuessListDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
//        GuessListDB_.createTable();
//         GuessDB GuessDB_ = new GuessDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
//        GuessDB_.createTable();

//        VLB.Init();
    }

    public static void Testing() {
        String dbUrl = "jdbc:mysql://localhost:3306/itp4511_assignment";
        String dbUser = "root";
        String dbPassword = "root";
        VenueDB venueDB = new VenueDB(dbUrl, dbUser, dbPassword);
        VenueLocationDB LocationDB = new VenueLocationDB(dbUrl, dbUser, dbPassword);
        GuessListDB GuessListDB_ = new GuessListDB(dbUrl, dbUser, dbPassword);
        String UserID = "2xQ5XXW390PxG5ujkrJCYHhc1";

    }

}
