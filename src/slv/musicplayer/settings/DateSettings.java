package slv.musicplayer.settings;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class DateSettings 
{
	
	 public static String toSqlDate(String date)
	 {
		 String dmy[]=date.split("/");
		 return dmy[2]+"-"+dmy[1]+"-"+dmy[0];
	 }
	 
	 public static String toSqlDate1(String date)
	 {
		String dmy[]=date.split("-");
		return dmy[2]+"-"+dmy[1]+"-"+dmy[0];
	 }
	 
	 public static String fromSqlDateTimeToDate(String date)
	 {
		 String dmy[]=date.split(" ");
		 return toSqlDate1(dmy[0]);
	 }
	 
	 public static String toUserDate(String date)
	 {
		 String dmy[]=date.split("-");
		 return dmy[2]+"/"+dmy[1]+"/"+dmy[0];
	 }
	 public static String toUserDate1(String date)
	 {
		 String dmy[]=date.split("-");
		 return dmy[2]+"-"+dmy[1]+"-"+dmy[0];
	 }
	
	 public static String currentSqlDate()
	 {
		 DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		 Date date = new Date();
		 df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
         String IST = df.format(date);
         return IST;
	 }
	 
	 public static String currentSqlDateTime()
	 {
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		 Date date = new Date();
		 dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
         String IST = dateFormat.format(date);
		 return IST;
	 }
	 
	 public static String currentSqlDateTime24HrsFormat()
	 {
		 DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date date = new Date();
		 dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
         String IST = dateFormat.format(date);
		 return IST;
	 }
	 
	 public static String currentUserDate()
	 {
		 DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		 Date date = new Date();
		 dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
         String IST = dateFormat.format(date);
		 return IST;
	 }
	 public static String timeStampToDateTime(String timestamp)
	 {
	 	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
	    try {
			return sdf2.format(sdf1.parse(timestamp));
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    return "";
	 }
	 public static String timeStampToDateTime1(String timestamp)
	 {
		 SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm aa");
		 SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy HH:mm aa");
		 try {
			 return sdf2.format(sdf1.parse(timestamp));
		 } catch (ParseException e) {
			 e.printStackTrace();
		 }
		 return "";
	 }
	 public static String getIstTimeZone()
	 {
		 Date today = new Date();
	     //displaying this date on IST timezone
         DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
         df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
         String IST = df.format(today);
         return IST;
	 }
	 
	 public static Date getIstTimeZone1()
	 {
		 Date today = new Date();
		 String IST="";
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	     //displaying this date on IST timezone
         DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
         df.setTimeZone(TimeZone.getTimeZone("Asia/Kolkata"));
         IST= df.format(today);
        Date ISTdate = null;
		try {
			ISTdate = formatter.parse(IST);
			return ISTdate;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ISTdate;
	 }
	 /*
      * Description : Convert 12 hours formated timestamp to 24 hours format
      * @parameaters : String
      * @return : String
      */
     public static String convertTo24HoursFormat(String input)
     {
    	 //Format of the date defined in the input String
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm aa");
        //Desired format: 24 hour format: Change the pattern as per the need
        DateFormat outputformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
        String output = null;
        try{
           //Converting the input String to Date
      	 date= df.parse(input);
           //Changing the format of date and storing it in String
      	 output = outputformat.format(date);
      	 System.out.println(output);
           //Displaying the date
      	  }catch(ParseException pe){
           pe.printStackTrace();
         }
        return output;
     }
     /*
      * Description : Convert 24 hours formated timestamp to 12 hours format
      * @parameaters : String
      * @return : String
      */
     public static String convertTo12HoursFormat(String input)
     {
         //Date/time pattern of input date
         DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         //Date/time pattern of desired output date
         DateFormat outputformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss aa");
         Date date = null;
         String output = null;
         try{
            //Conversion of input String to date
      	  date= df.parse(input);
            //old date format to new date format
      	  output = outputformat.format(date);
  		}catch(ParseException pe){
      	    pe.printStackTrace();
      	 }
         return output;
     }
     public static String getCurrentTimestamp(){
	        Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("IST"));
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            System.out.println(dateFormat.format(cal.getTime()));
            return dateFormat.format(cal.getTime());
     }
     public static boolean compareDates(String s_date1,String s_date2){
    	 boolean b = false;
    	 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	 try{
		     	Date date1 = sdf.parse(s_date1);
		     	Date date2 = sdf.parse(s_date2);
		
		     	if(date1.compareTo(date2)>0){
		     		b=true;
	     		}else if(date1.compareTo(date2)<0){
		     		b=false;
	     		}else if(date1.compareTo(date2)==0){
		     		b=true;
	     		}else{
		     		b=false;
	     		}
    	 }catch(ParseException pe){
    		 pe.printStackTrace();
    	 }
     	return b;
     }

}
