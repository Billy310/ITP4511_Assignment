/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.bean;

import java.io.Serializable;

public class BookingBean implements Serializable {

    private String BookingID, UserID;
    private int VenueID, BookingRequestID, Enable;
    private double PersonInCharge, BookingFee;

     public BookingBean(){}
     
    public BookingBean(String BookingID, String UserID, int VenueID, int BookingRequestID, int Enable, double PersonInCharge, double BookingFee) {
        this.BookingID = BookingID;
        this.UserID = UserID;
        this.VenueID = VenueID;
        this.BookingRequestID = BookingRequestID;
        this.Enable = Enable;
        this.PersonInCharge = PersonInCharge;
        this.BookingFee = BookingFee;
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

    public int getVenueID() {
        return VenueID;
    }

    public void setVenueID(int VenueID) {
        this.VenueID = VenueID;
    }

    public int getBookingRequestID() {
        return BookingRequestID;
    }

    public void setBookingRequestID(int BookingRequestID) {
        this.BookingRequestID = BookingRequestID;
    }

    public int getEnable() {
        return Enable;
    }

    public void setEnable(int Enable) {
        this.Enable = Enable;
    }

    public double getPersonInCharge() {
        return PersonInCharge;
    }

    public void setPersonInCharge(double PersonInCharge) {
        this.PersonInCharge = PersonInCharge;
    }

    public double getBookingFee() {
        return BookingFee;
    }

    public void setBookingFee(double BookingFee) {
        this.BookingFee = BookingFee;
    }
    
    

    
}
