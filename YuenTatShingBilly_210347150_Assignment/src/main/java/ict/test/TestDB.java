/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.test;

import ict.bean.BookingBean;
import ict.bean.UserBean;
import ict.bean.VenueBean;
import ict.bean.VenueLocationBean;
import ict.db.BookingDB;
import ict.db.GuessDB;
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
import ict.db.UserTypeDB;

/**
 *
 * @author user
 */
public class TestDB {

    public static void main(String[] args) throws ParseException {
//        String dbUrl = "jdbc:mysql://localhost:3306/itp4511_assignment";
//        String dbUser = "root";
//        String dbPassword = "root";
//        VenueDB vd = new VenueDB(dbUrl, dbUser, dbPassword);
//        ArrayList<VenueBean> bb = vd.QueryVenueByLocationID(1);
//        System.out.print(CalTotalByLocationID(1));
        String dbUrl = "jdbc:mysql://localhost:3306/itp4511_assignment";
        String dbUser = "root";
        String dbPassword = "root";
        VenueDB vb = new VenueDB(dbUrl, dbUser, dbPassword);
        vb.EditVenue(6, "Hong Kong Institute of Vocational Education (Tuen Mun)", 1, 1, "",0);
//        Hong Kong Institute of Vocational Education (Tuen Mun)
//        BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
//        bookingDB.createTable();
//        bookingDB.AddRecord(dbPassword, dbUser, 1, "2022-3-3", 1, 2, 3, 1);

    }

    public static void givenUsingPlainJava_whenGeneratingRandomStringUnbounded_thenCorrect() {
        byte[] array = new byte[7]; // length is bounded by 7
        new Random().nextBytes(array);
        String generatedString = new String(array, Charset.forName("UTF-8"));

        System.out.println(generatedString);
    }

    public static int CalTotalByLocationID(int LocationID) {
        String dbUrl = "jdbc:mysql://localhost:3306/itp4511_assignment";
        String dbUser = "root";
        String dbPassword = "root";
        VenueDB venueDB = new VenueDB(dbUrl, dbUser, dbPassword);
        BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
        ArrayList<VenueBean> vlb = venueDB.QueryVenueByLocationID(LocationID);
        System.out.print(vlb.size());
        int Total = 0;
        for (int x = 0; x < vlb.size(); x++) {
            ArrayList<BookingBean> bb = bookingDB.QueryVenueBookingByPlace(vlb.get(x).getVenueID());

            Total = bb.size();

        }

        return Total;
    }

}
