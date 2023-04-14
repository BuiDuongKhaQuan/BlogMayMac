package qbh.forum.com.vn.tools;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    public static String getDateNow(){
        SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm:ss a dd/MM/yyyy");
        Date currentDate = new Date();
        String formattedDate = dateFormat.format(currentDate);
        return formattedDate;
    }
    public static String customDateTimeFormat (Date date){
        String pattern = "hh:mm:ss a dd/MM/yyyy";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        String formattedDate = formatter.format(date);
        System.out.println("Formatted Date: " + formattedDate);
        return formattedDate;
    }

    public static void main(String[] args) throws ParseException {
        String pattern = "hh:mm:ss a dd/MM/yyyy";
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        Date date1 = formatter.parse("02:02:00 PM 07/03/2023");
        Date date2 = formatter.parse("03:02:00 AM 08/03/2023");
        System.out.println(date2.before(date1));

    }
}
