/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.bean;

import java.io.Serializable;

public class VenueBean implements Serializable {

    private int VenueID, VenueTypeID, VenueLocationID, Enable;
    private String VenueName, VenueDescription;
    private double PersonInCharge;

    public VenueBean() {
    }

    public VenueBean(int VenueID, int VenueTypeID, int VenueLocationID, String VenueName, String VenueDescription, int Enable, double PersonInCharge) {
        this.VenueID = VenueID;
        this.VenueTypeID = VenueTypeID;
        this.VenueLocationID = VenueLocationID;
        this.Enable = Enable;
        this.VenueName = VenueName;
        this.VenueDescription = VenueDescription;
        this.PersonInCharge = PersonInCharge;
    }

    public int getVenueID() {
        return VenueID;
    }

    public void setVenueID(int VenueID) {
        this.VenueID = VenueID;
    }

    public int getVenueTypeID() {
        return VenueTypeID;
    }

    public void setVenueTypeID(int VenueTypeID) {
        this.VenueTypeID = VenueTypeID;
    }

    public int getVenueLocationID() {
        return VenueLocationID;
    }

    public void setVenueLocationID(int VenueLocationID) {
        this.VenueLocationID = VenueLocationID;
    }

    public int getEnable() {
        return Enable;
    }

    public void setEnable(int Enable) {
        this.Enable = Enable;
    }

    public String getVenueName() {
        return VenueName;
    }

    public void setVenueName(String VenueName) {
        this.VenueName = VenueName;
    }

    public String getVenueDescription() {
        return VenueDescription;
    }

    public void setVenueDescription(String VenueDescription) {
        this.VenueDescription = VenueDescription;
    }

    public double getPersonInCharge() {
        return PersonInCharge;
    }

    public void setPersonInCharge(double PersonInCharge) {
        this.PersonInCharge = PersonInCharge;
    }
    

}
