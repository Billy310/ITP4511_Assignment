/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author user
 */
public class BookingBean implements Serializable {

    private String BookingID, UserID, GuessListID;
    private int VenueID;
    private Date BookingDate, CreatedDate;
    private Time BookingTime;
    private double PersonInCharge;
    private int Status;

//                    = "CREATE TABLE IF NOT EXISTS Booking("
//                    + "BookingID varchar(25) NOT NULL,"
//                    + "UserID varchar(25) NOT NULL,"
//                    + "VenueID INT(1) NOT NULL,"
//                    + "GuessListID varchar(25) NULL,"
//                    + "BookingDate date NOT NULL,"
//                    + "BookingTime Time NOT NULL,"
//                    + "CreatedDate date NOT NULL,"
//                    + "PersonInCharge double(5,2) NOT NULL,"
//                    + "Status INT(1) NOT NULL,"
    public BookingBean() {
    }

    public BookingBean(String BookingID, String UserID, int VenueID, String GuessListID, Date BookingDate, Time BookingTime, Date CreatedDate, double PersonInCharge, int Status) {
        this.BookingID = BookingID;
        this.UserID = UserID;
        this.GuessListID = GuessListID;
        this.VenueID = VenueID;
        this.BookingDate = BookingDate;
        this.CreatedDate = CreatedDate;
        this.BookingTime = BookingTime;
        this.PersonInCharge = PersonInCharge;
        this.Status = Status;
    }

    public String getBookingID() {
        return BookingID;
    }

    public void setBookingID(String BookingID) {
        this.BookingID = BookingID;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getGuessListID() {
        return GuessListID;
    }

    public void setGuessListID(String GuessListID) {
        this.GuessListID = GuessListID;
    }

    public int getVenueID() {
        return VenueID;
    }

    public void setVenueID(int VenueID) {
        this.VenueID = VenueID;
    }

    public Date getBookingDate() {
        return BookingDate;
    }

    public void setBookingDate(Date BookingDate) {
        this.BookingDate = BookingDate;
    }

    public Date getCreatedDate() {
        return CreatedDate;
    }

    public void setCreatedDate(Date CreatedDate) {
        this.CreatedDate = CreatedDate;
    }

    public Time getBookingTime() {
        return BookingTime;
    }

    public void setBookingTime(Time BookingTime) {
        this.BookingTime = BookingTime;
    }

    public double getPersonInCharge() {
        return PersonInCharge;
    }

    public void setPersonInCharge(double PersonInCharge) {
        this.PersonInCharge = PersonInCharge;
    }

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    

}
