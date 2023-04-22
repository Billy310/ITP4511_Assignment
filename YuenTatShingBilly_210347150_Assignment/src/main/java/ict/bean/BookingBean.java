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
    private int BookingStart,BookingEnd;
    private double PersonInCharge;
    private int Status;

    public BookingBean() {
    }

    public BookingBean(String BookingID, String UserID,int VenueID, String GuessListID,   Date BookingDate, Date CreatedDate, int BookingStart, int BookingEnd, double PersonInCharge, int Status) {
        this.BookingID = BookingID;
        this.UserID = UserID;
        this.GuessListID = GuessListID;
        this.VenueID = VenueID;
        this.BookingDate = BookingDate;
        this.CreatedDate = CreatedDate;
        this.BookingStart = BookingStart;
        this.BookingEnd = BookingEnd;
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

    public int getBookingStart() {
        return BookingStart;
    }

    public void setBookingStart(int BookingStart) {
        this.BookingStart = BookingStart;
    }

    public int getBookingEnd() {
        return BookingEnd;
    }

    public void setBookingEnd(int BookingEnd) {
        this.BookingEnd = BookingEnd;
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
