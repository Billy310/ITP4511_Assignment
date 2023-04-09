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
public class UserTypeBean implements Serializable {

    private int UserTypeID;
    private String UserTypeName;

    public UserTypeBean() {
    }

    public UserTypeBean(int UserTypeID, String UserTypeName) {
        this.UserTypeID = UserTypeID;
        this.UserTypeName = UserTypeName;
    }

    public int getUserTypeID() {
        return UserTypeID;
    }

    public void setUserTypeID(int UserTypeID) {
        this.UserTypeID = UserTypeID;
    }

    public String getUserTypeName() {
        return UserTypeName;
    }

    public void setUserTypeName(String UserTypeName) {
        this.UserTypeName = UserTypeName;
    }

}
