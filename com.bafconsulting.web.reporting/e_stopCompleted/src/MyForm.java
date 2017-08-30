package e_stop;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.*;
import java.util.Date;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import jdbc_connect.conn;
import oracle.jdbc.OracleTypes;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * 
 * This is the main e_stop java bean, it validates and processes the form, and submits
 * the data to a database.
 * 
 * @author Bryn Flewelling, BAFCONSULTING.
 * @version  
 * 
 */

public class MyForm implements Serializable {

	public static String ColumnsNames = "user_id, workarea, storeroom_part_number, quantity, created_date, created_by";
	public static String jdbc_connection = "BAF_demo_BF";

	conn conn_BAFCONSULTING = null;

	/* The properties */
	private String eStop = "";
	private String check = "";
	private String realName = "";
	private Integer checkYes;
	private Integer checkNo;
	private String dateString = " ";

	/**
	 * Gets the eStop value.
	 * @return eStop, return eStop
	 */
	public String geteStop() {
		return eStop;
	}

	/**
	 * Sets the eStop value.
	 */
	public void seteStop(String eStop) {
		this.eStop = eStop.trim();
	}

	/**
	 * Sets the check value.
	 */
	public void setCheck(String n) {
		check = n;
	}

	/**
	 * Gets the check value.
	 * @return check, return check
	 */
	public String getCheck() {
		return check;
	}

	/**
	 * Gets the realName value.
	 * @return realName, return realName
	 */
	public String getRealName() {
		return realName;
	}

	/**
	 * Sets the realName value.
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}

	/**
	 * Creates the error messages.
	 */
	public static final Integer ERR_SWIPE_CARD = new Integer(1);
	public static final Integer ERR_E_STOP_NOT_FOUND = new Integer(2);
	public static final Integer ERR_CHECK = new Integer(3);
	public static final Integer ERR_REAL_NAME = new Integer(4);

	// Holds error messages for the properties
	Map errorCodes = new HashMap();

	// Maps error codes to textual messages.
	// This map must be supplied by the object that instantiated this bean.
	Map msgMap;

	/**
	 * Sets the error messages.
	 */
	public void setErrorMessages(Map msgMap) {
		this.msgMap = msgMap;
	}
	/**
	 * Gets the error messages.
	 * @return msg, return msg 
	 */
	public String getErrorMessage(String propName) {
		Integer code = (Integer) (errorCodes.get(propName));
		if (code == null) {
			return "";
		} else if (msgMap != null) {
			String msg = (String) msgMap.get(code);
			if (msg != null) {
				return msg;
			}
		}
		return "Error";
	}

	/**
	 * Validates the form and returns 0 if the form has no errors.
	 * @return boolean, 0 or 1
	 */
	public boolean isValid() {
		//date();
		//validateDate();
		/* Form validation and processing */
		// Clear all errors before starting
		errorCodes.clear();
		// Validate
		if (eStop.length() == 0) {
			errorCodes.put("eStop", ERR_SWIPE_CARD);
		} else if (eStop.length() != 0) {
			 eStop = eStop.toUpperCase();
			 eStop = eStop.replaceAll("'", "").trim();
			if (validateEStop() == true) {
				//System.out.println("=======================");
				//System.out.println("A valid e-stop was scanned." + eStop);
			} else {
				errorCodes.put("eStop", ERR_E_STOP_NOT_FOUND);
			}
		}

		if (check == "") {
			errorCodes.put("check", ERR_CHECK);
		} else if (check.contains("true")) {
			check = "0";
			// String to integer conversion*important*
			checkYes = Integer.parseInt(check);
		} else if (check.contains("false")) {
			check = "-1";
			checkNo = Integer.parseInt(check);
		}// else{
		// errorCodes.put("check", ERR_CHECK);
		// }
		if (realName != "") {
			//System.out.println("The users real name is set: " + realName);
		} else {
			//System.out.println("The users real name is not set: " + realName);
		}
		// If no errors, form is valid
		return errorCodes.size() == 0;
	}

	/**
	 * Processes the form and returns false if the form is not valid. Calls the
	 * insertMainElement method to submit data to database.
	 * 
	 * @return true, returns true if the form has validated correctly, if not
	 *         return false.
	 */
	public boolean process() {
		// Process form...
		if (!isValid()) {
			//test();
			return false;
		}
		if (errorCodes.size() == 0) {
			insertMainElement();
		}
		// Clear the form
		eStop = "";
		// check = "";
		errorCodes.clear();
		return true;
	}

	/**
	 * SimpleDateFormat.
	 * 
	 * @return dateString, returnes dateString with the current date and time.
	 */
	public String date(){
		Locale id = new Locale("in", "ID");
		String pattern = "MMM/dd/yyyy";
		Date today = new Date();

		// Gets formatted date specify by the given pattern for
		SimpleDateFormat sdf = new SimpleDateFormat(pattern, id);
		// String before = sdf.format(today);
		// System.out.println("Before format change: " + before);

		// Create a DateFormatSymbols object for Indonesian locale.
		DateFormatSymbols dfs = new DateFormatSymbols(id);
		// Gets String array of default format of weekdays.
		String[] days = dfs.getWeekdays();
		String newDays[] = new String[days.length];
		for (int i = 0; i < days.length; i++) {
			// For each day, apply toUpperCase() method to
			// capitalized it.
			newDays[i] = days[i].toUpperCase();
		}
		// Set String array of weekdays.
		dfs.setWeekdays(newDays);
		// Gets String array of default format of short months.
		String[] shortMonths = dfs.getShortMonths();
		String months[] = new String[shortMonths.length];
		for (int j = 0; j < shortMonths.length; j++) {
			// For each short month, apply toUpperCase() to capitalized.
			months[j] = shortMonths[j].toUpperCase();
		}

		// Set String array of short months.
		dfs.setShortMonths(months);

		// Create a SimpleDateFormat object by given pattern and 
		// symbol and then format the date object as String.
		sdf = new SimpleDateFormat(pattern, dfs);
		dateString = sdf.format(today);
		//test = dateString;

		//  System.out.println("After change format : " + dateString);
		return dateString;
	}

	/**
	 * Makes a database connection and calls a store procedure with the
	 * variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 *         false if it has failed.
	 */
	public ArrayList validateDate() {
		date();
		boolean test = false;
		boolean bln_result = true;
		ArrayList date = new ArrayList();
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();

		if (bln_result == false) {
			//System.out.println("Connection_1 to BAF BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_2 to BAF BAFCONSULTING succeded.");
		}
		try {
			String query = "begin ? := BAFCONSULTING.pkg_ts_estop.ts_estop_log_due(?); end;";
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param
			stmt.setString(2, dateString);

			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);

			//print the results
			while (rs.next()) {
				if(dateString.equals(eStop)){
					test = true;
					date.add(rs.getString("E_STOP"));
					//System.out.println("Worked");
					//System.out.println(rs.getString(1));
					break;
				}	else{
					test = false;
					//System.out.println("Did not work");
				}
			}
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return date;
	}

	/**
	 * Makes a database connection and calls a store procedure with the
	 * variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 *         false if it has failed.
	 */
	public ArrayList populateText() {
		date();
		ArrayList date = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAF BAFCONSULTING schema failed. "+ new java.util.Date());
			//System.out.println("Adding ArrayList elements...");
		} else {
			//System.out.println("Connection_4 to BAF BAFCONSULTING succeded.");
		}
		try {
			//System.out.println("========================");
			//System.out.println("currDate: " + dateString);
			//System.out.println("========================");

			//String estop_date_str = "date();";
			String query = "begin ? := BAFCONSULTING.pkg_ts_estop.ts_estop_log_due(?); end;";
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, dateString);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);

			//print the results
			while (rs.next()) {
				date.add(rs.getString("E_STOP"));
				//System.out.println(rs.getString(1));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return date;
	}

	/**
	 * Makes a database connection and calls a store procedure with the
	 * variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 *         false if it has failed.
	 */
	public boolean insertMainElement() {
		boolean bln_result = true;
		// dumpEnv();
		conn_BAFCONSULTING = new conn();

		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);

		// String to integer conversion*important*
		// Integer qty = Integer.parseInt(quantity);

		if (bln_result == false) {
			//System.out.println("Connection_5 to BAF BAFCONSULTING schema failed. "+ new java.util.Date());
			return false;
		} else {
			//System.out.println("Connection_6 to BAF BAFCONSULTING succeded.");
			//loadValues();
		}
		try {
			// this will call the store procedure
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			//loadValues();

			//checkYes/checkNo from bool to int
			Integer var = null;
			if (checkYes != null) {
				var = checkYes;
			}
			if (checkNo != null) {
				var = checkNo;
			}

			curr_conn.prepareCall(
					"{call BAFCONSULTING.pkg_ts_estop.p_ts_estop_scanner('" + realName + "', '"
					+ eStop + "', '" + var + "')}").execute();

			curr_conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return bln_result;
	}

	/**
	 * Makes a database connection and calls a store procedure with the
	 * variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 *         false if it has failed.
	 */
	public boolean validateEStop() {

		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		Connection curr_conn = conn_BAFCONSULTING.current_connection;

		if (bln_result == false) {
			//System.out.println("Connection_9 to BAF BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_10 to BAF BAFCONSULTING succeded.");
		}
		try {
			String sql = "select BAFCONSULTING.pkg_ts_estop.f_ts_estop('" +eStop+ "') from dual";
			ResultSet rs = null;

			rs = curr_conn.createStatement().executeQuery(sql);

			//curr_conn.prepareCall(
			//		"{call BAFCONSULTING.pkg_ts_estop.f_ts_estop('" + eStop + "')}").execute();

			//curr_conn.close();	

			//String query = "begin ? := BAFCONSULTING.pkg_ts_estop.f_ts_estop(?); end;";
			//CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			//stmt.registerOutParameter(1, OracleTypes.INTEGER);
			//set the in param
			//stmt.setString(2, eStop);

			//execute and retrieve the result set
			//stmt.execute();
			//ResultSet rs = (ResultSet)stmt.getObject(1);

			//print the results
			while (rs.next()) {
				if (rs.getInt(1) == 0) {
					bln_result = false;
				} else {
					bln_result = true;
				}
			}
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return bln_result;
	}

	/**
	 * Checks the enviroment variables, time and date of the application
	 * running.
	 */
	public void dumpEnv() {
		try {
			System.out.println(" ENV = " + System.getenv());
			Map envVars = System.getenv();
			// Get Map in Set interface to get key and value
			Set set = envVars.entrySet();
			// Move next key and value of Map by iterator
			Iterator it = set.iterator();
			System.out.println("Date & Time" + new java.util.Date());
			while (it.hasNext()) {
				Map.Entry m = (Map.Entry) it.next();
				// getKey is used to get key of Map
				Object property = (String) m.getKey();
				// getValue is used to get value of key in Map
				String value = (String) m.getValue();
				System.out.println("Property :" + property.toString()
						+ "  Value :" + value + "\n");
			}
		} catch (Exception e) {
			System.out.println("error processing" + e.getMessage());
		}
	}

	/**
	 * loads variable values.
	 */
	public void loadValues() {
		System.out.println("=======================");		
		System.out.println("e-stop value: " + eStop);
		System.out.println("swipeCard: " + realName);
		System.out.println("check: " + check);
		System.out.println("=======================");
		System.out.println("checkYes: " + checkYes);
		System.out.println("checkNo: " + checkNo);
		System.out.println("=======================");		
	}
}