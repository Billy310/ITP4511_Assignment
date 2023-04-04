/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.bean;

import java.io.Serializable;

public class VenueLocationBean implements Serializable {

    private int VenueLocationID, Enable;
    private String VenueLocationName;
    private double VenueLocation_X, VenueLocation_Y;

    public VenueLocationBean() {
    }

    public VenueLocationBean(int VenueLocationID, String VenueLocationName, double VenueLocation_X, double VenueLocation_Y, int Enable) {
        this.VenueLocationID = VenueLocationID;
        this.Enable = Enable;
        this.VenueLocationName = VenueLocationName;
        this.VenueLocation_X = VenueLocation_X;
        this.VenueLocation_Y = VenueLocation_Y;
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

    public String getVenueLocationName() {
        return VenueLocationName;
    }

    public void setVenueLocationName(String VenueLocationName) {
        this.VenueLocationName = VenueLocationName;
    }

    public double getVenueLocation_X() {
        return VenueLocation_X;
    }

    public void setVenueLocation_X(double VenueLocation_X) {
        this.VenueLocation_X = VenueLocation_X;
    }

    public double getVenueLocation_Y() {
        return VenueLocation_Y;
    }

    public void setVenueLocation_Y(double VenueLocation_Y) {
        this.VenueLocation_Y = VenueLocation_Y;
    }

 

}
