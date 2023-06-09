/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.bean;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author user
 */
public class BookingBean implements Serializable {

    private String BookingID, UserID, Remark, Comment;
    private int VenueID;
    private Date BookingDate, CreatedDate;
    private Timestamp CreatedTime;
    private int BookingStart, BookingEnd;
    private int Status, Priority, CheckStatus;
    private double BookingFee, BookingInCharge;

    public BookingBean() {
    }

    public BookingBean(String BookingID, String UserID, int VenueID, Date BookingDate, Date CreatedDate, Timestamp CreatedTime, int BookingStart, int BookingEnd, int Status,
            int Priority, double BookingFee, double BookingInCharge,
            String Remark,
            String Comment, int CheckStatus ) {
        this.BookingID = BookingID;
        this.UserID = UserID;
        this.VenueID = VenueID;
        this.BookingDate = BookingDate;
        this.CreatedDate = CreatedDate;
        this.CreatedTime = CreatedTime;
        this.BookingStart = BookingStart;
        this.BookingEnd = BookingEnd;
        this.Status = Status;
        this.Priority = Priority;
        this.Remark = Remark;
        this.Comment = Comment;
        this.BookingFee = BookingFee;
        this.BookingInCharge = BookingInCharge;
        this.CheckStatus = CheckStatus;
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

    public Timestamp getCreatedTime() {
        return CreatedTime;
    }

    public void setCreatedTime(Timestamp CreatedTime) {
        this.CreatedTime = CreatedTime;
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

    public int getStatus() {
        return Status;
    }

    public void setStatus(int Status) {
        this.Status = Status;
    }

    public int getPriority() {
        return Priority;
    }

    public void setPriority(int Priority) {
        this.Priority = Priority;
    }

    public String getRemark() {
        return Remark;
    }

    public void setRemark(String Remark) {
        this.Remark = Remark;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String Comment) {
        this.Comment = Comment;
    }

    public double getBookingFee() {
        return BookingFee;
    }

    public void setBookingFee(double BookingFee) {
        this.BookingFee = BookingFee;
    }

    public double getBookingInCharge() {
        return BookingInCharge;
    }

    public void setBookingInCharge(double BookingInCharge) {
        this.BookingInCharge = BookingInCharge;
    }

    public int getCheckStatus() {
        return CheckStatus;
    }

    public void setCheckStatus(int CheckStatus) {
        this.CheckStatus = CheckStatus;
    }
    

}
