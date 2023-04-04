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
public class GuessBean implements Serializable {

    private String GuessListID, FirstName, LastName, Email, PhoneNumber;

    public GuessBean(String GuessListID, String FirstName, String LastName, String Email, String PhoneNumber) {
        this.GuessListID = GuessListID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.PhoneNumber = PhoneNumber;
    }

    public GuessBean() {
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }

    public String getGuessListID() {
        return GuessListID;
    }

    public void setGuessListID(String GuessListID) {
        this.GuessListID = GuessListID;
    }

}
