/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.test;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
        java.util.Date utilDate = new java.util.Date();
        System.out.println("java.util.Date time    : " + utilDate);
        java.sql.Timestamp sqlTS = new java.sql.Timestamp(utilDate.getTime());
        System.out.println("java.sql.Timestamp time: " + sqlTS);
        
        DateFormat df = new SimpleDateFormat("dd/MM/YYYY hh:mm:ss:SSS");
        System.out.println("Date formatted         : " + df.format(utilDate));
    }


}
