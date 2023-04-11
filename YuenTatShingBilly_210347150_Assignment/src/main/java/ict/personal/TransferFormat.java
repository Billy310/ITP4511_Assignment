/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ict.personal;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author user
 */
public class TransferFormat {

    public String TransferDate(Date UnformatDate) {

        // Create a SimpleDateFormat object to format the date
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MM/yyyy");

        // Format the date into a string in DD/MM/YYYY format
        String formattedDate = outputDateFormat.format(UnformatDate);

        // Output the formatted date
        return formattedDate;
    }
}
