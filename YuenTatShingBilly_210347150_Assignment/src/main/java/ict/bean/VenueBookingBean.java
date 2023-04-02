/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.bean;

import java.io.Serializable;

/**
 *
 * @author user
 */
public class VenueBookingBean implements Serializable {

    private String VenueBookingID, BookingRequestID, UserID;
    private int VenueID, Enable;

    public VenueBookingBean(String VenueBookingID, String BookingRequestID, String UserID, int VenueID, int Enable) {
        this.VenueBookingID = VenueBookingID;
        this.BookingRequestID = BookingRequestID;
        this.UserID = UserID;
        this.VenueID = VenueID;
        this.Enable = Enable;
    }

    public VenueBookingBean() {
    }

    public String getVenueBookingID() {
        return VenueBookingID;
    }

    public void setVenueBookingID(String VenueBookingID) {
        this.VenueBookingID = VenueBookingID;
    }

    public String getBookingRequestID() {
        return BookingRequestID;
    }

    public void setBookingRequestID(String BookingRequestID) {
        this.BookingRequestID = BookingRequestID;
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

    public int getEnable() {
        return Enable;
    }

    public void setEnable(int Enable) {
        this.Enable = Enable;
    }

}
