/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.test;

import ict.bean.*;
import ict.personal.*;
import ict.db.*;
import java.sql.*;
import java.util.*;
import java.text.*;
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
        BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
        BookingBean bb = bookingDB.DenyBooking("6Nw5Hf1rdGrpcu9FAH0Y3QexJ", "");
        System.out.print(bookingDB.QueryVenueBookingWithCheckStatus(1,getfirstandend(2023,4)).size());

//        bookingDB.EditCustomerComment("4322cjAji7r3V34", "aszw");
//        bookingDB.QueryVenueBookingToCSV();
//        bookingDB.createTable(); 

//        bookingDB.DeleteNoNeed("M1dKe0Yv41G1XMv8GQXHURXeb");
//            UserBean userbean = db.QueryUserByName("Admin");
//        System.out.print(bookingDB.QueryVenueBookingByUserIDForToday("iivQf91PxrMdiGMPw0r4FP0iW").size());
//        ArrayList<BookingBean> bbs = bookingDB.QueryVenueBookingByPlaceANDDate(1, getfirstandend(2023, 4));
//        System.out.print(bbs.size());
////                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
//iivQf91PxrMdiGMPw0r4FP0iW
//                bookingDB.AddRecord(dbPassword, dbUser, 0, dbPassword, 0, 0, 0, 0);
////        VenueTypeDB vlb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
////        vlb.AddRecord(vlb.QueryAllVenueType().size()+1, "123");
//        VenueDB vb = new VenueDB(dbUrl, dbUser, dbPassword);
//        vb.createTable();
////        vb.AddVenue(6+1, "Hong Kong Institute of Vocational Education (Tuen Mun)", 1, 1, "",80.8);
//        vb.EditVenue(7, "", 1, 1, "", 1, 9090);
//        Hong Kong Institute of Vocational Education (Tuen Mun)
//        BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
//        bookingDB.createTable();
//        bookingDB.AddRecord(dbPassword, dbUser, 1, "2022-3-3", 1, 2, 3, 1,200,200.0,"","");
//        System.out.print(bookingDB.QueryVenueBookingByUserID(dbUser).size());
    }

    public static Calendar c = Calendar.getInstance();
    public static int numOfDaysInMonth;

    public static ArrayList<java.sql.Date> getfirstandend(int Year, int Month) {
        ArrayList<java.sql.Date> dateofeachmonth = new ArrayList();
        c.set(Year, Month, 1);
        numOfDaysInMonth = c.getActualMaximum(Calendar.DAY_OF_MONTH);
        dateofeachmonth.add(new java.sql.Date(c.getTime().getTime()));
        c.add(Calendar.DAY_OF_MONTH, numOfDaysInMonth - 1);
        dateofeachmonth.add(new java.sql.Date(c.getTime().getTime()));
        return dateofeachmonth;
    }

}
