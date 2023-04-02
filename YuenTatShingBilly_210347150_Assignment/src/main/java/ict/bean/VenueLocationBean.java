/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.bean;

import java.io.Serializable;

public class VenueLocationBean implements Serializable {

    private int VenueLocationID, Enable;
    private String VenueLocationName;

    public VenueLocationBean() {
    }

    public VenueLocationBean(int VenueLocationID, String VenueLocationName ,int Enable) {
        this.VenueLocationID = VenueLocationID;
        this.Enable = Enable;
        this.VenueLocationName = VenueLocationName;
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

}
