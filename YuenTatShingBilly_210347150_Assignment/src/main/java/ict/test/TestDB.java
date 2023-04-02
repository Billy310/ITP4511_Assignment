/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.test;

import ict.bean.UserBean;
import ict.bean.VenueBean;
import ict.bean.VenueBookingBean;
import ict.bean.VenueLocationBean;
import ict.db.BookingDB;
import ict.db.UserDB;
import ict.db.VenueBookingDB;
import ict.db.VenueDB;
import ict.db.VenueLocationDB;
import ict.db.VenueTypeDB;
import ict.personal.RandomString;
import java.nio.charset.Charset;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Random;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author user
 */
public class TestDB {

    public static void main(String[] args) {

//        String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
//        RandomString tickets = new RandomString(23, new SecureRandom(), easy);
//        System.out.println(tickets.nextString());
//        CreateDB();
//        UserBean userbean = db.QueryUserByName("Ronaldo".toLowerCase());
//        CreateDB();
Testing();
//        if (userbean != null) {
//            if (userbean.getPassword().equals("SIU")) {
//                RequestDispatcher rd;
//                String userid = userbean.getUserID();
//                System.out.println("Login Sccuess");
//                    request.setAttribute("userid", userid);
//                    rd = getServletContext().getRequestDispatcher("/login.jsp");
//                    rd.forward(request, response);
    }

    public static void givenUsingPlainJava_whenGeneratingRandomStringUnbounded_thenCorrect() {
        byte[] array = new byte[7]; // length is bounded by 7
        new Random().nextBytes(array);
        String generatedString = new String(array, Charset.forName("UTF-8"));

        System.out.println(generatedString);
    }

    public static void CreateDB() {

        UserDB UserDB_ = new UserDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
        UserDB_.createUserTable();
        System.out.print(UserDB_.QueryUserByName("billy0310").getUserID());
        BookingDB BookingDB_ = new BookingDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
        BookingDB_.createBookingTable();
        VenueDB VenueDB_ = new VenueDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
        VenueDB_.createVenueTable();
        VenueTypeDB VTB = new VenueTypeDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
        VTB.createVenueTypeTable();
        VenueLocationDB VLB = new VenueLocationDB("jdbc:mysql://localhost:3306/itp4511_assignment", "root", "root");
        VLB.createVenueLocationTable();
        VLB.Init();

    }

    public static void Testing() {
        String dbUrl = "jdbc:mysql://localhost:3306/itp4511_assignment";
        String dbUser = "root";
        String dbPassword = "root";
        VenueBookingDB db = new VenueBookingDB(dbUrl, dbUser, dbPassword);
        VenueDB venueDB = new VenueDB(dbUrl, dbUser, dbPassword);
        VenueLocationDB LocationDB = new VenueLocationDB(dbUrl, dbUser, dbPassword);
        String UserID = "2xQ5XXW390PxG5ujkrJCYHhc1";

        ArrayList<VenueBookingBean> venueBookings = db.QueryVenueBookingByUserID(UserID);

        for (int x = 0; x < venueBookings.size(); x++) {
            VenueBookingBean vb = venueBookings.get(x);
            System.out.println(vb.getUserID());
            VenueBean venuebean = venueDB.queueVenueByVenueID(vb.getVenueID());
            VenueLocationBean locationbean = LocationDB.QueryByLocationID(venuebean.getVenueLocationID());
        }

    }

}
