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
public class VenueTypeBean implements Serializable {

    private int VenueTypeID, Enable;
    private String VenueTypeName;

    public VenueTypeBean() {
    }

    public VenueTypeBean(int VenueTypeID, String VenueTypeName, int Enable) {
        this.VenueTypeID = VenueTypeID;
        this.Enable = Enable;
        this.VenueTypeName = VenueTypeName;
    }

    public int getVenueTypeID() {
        return VenueTypeID;
    }

    public void setVenueTypeID(int VenueTypeID) {
        this.VenueTypeID = VenueTypeID;
    }

    public int getEnable() {
        return Enable;
    }

    public void setEnable(int Enable) {
        this.Enable = Enable;
    }

    public String getVenueTypeName() {
        return VenueTypeName;
    }

    public void setVenueTypeName(String VenueTypeName) {
        this.VenueTypeName = VenueTypeName;
    }

}
