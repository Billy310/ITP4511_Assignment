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
public class GuessListBean implements Serializable {

    private String GuessListID;

    public GuessListBean() {
    }

    public GuessListBean(String GuessListID) {
        this.GuessListID = GuessListID;
    }

    public String getGuessListID() {
        return GuessListID;
    }

    public void setGuessListID(String GuessListID) {
        this.GuessListID = GuessListID;
    }

}
