/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.test;

import java.sql.Date;
import java.time.LocalDate;
import java.time.Month;
import java.time.temporal.ChronoField;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author user
 */
public class xyu {

    public static Calendar c = Calendar.getInstance();
    public static int numOfDaysInMonth;

    public static void main(String[] args) {
        ArrayList<java.sql.Date> dateof =getfirstandend(2023, 2);
        System.out.println(dateof.get(0)); System.out.println(dateof.get(1));
    }

    public static ArrayList<java.sql.Date> getfirstandend(int Year, int Month) {
        ArrayList<java.sql.Date> dateofeachmonth = new ArrayList<java.sql.Date>();
        c.set(Year, Month, 1);
        numOfDaysInMonth = c.getActualMaximum(Calendar.DAY_OF_MONTH);
//        c.add(Calendar.DAY_OF_MONTH, numOfDaysInMonth - 1);
        dateofeachmonth.add(new java.sql.Date(c.getTime().getTime()));
        c.add(Calendar.DAY_OF_MONTH, numOfDaysInMonth - 1);
        dateofeachmonth.add( new java.sql.Date(c.getTime().getTime()));
        return dateofeachmonth;
    }


}
