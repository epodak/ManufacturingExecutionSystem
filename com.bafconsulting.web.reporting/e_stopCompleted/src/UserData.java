package e_stop;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import java.util.Date;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;

import oracle.jdbc.OracleTypes;

import jdbc_connect.conn;

public class UserData implements Serializable {

	public static String ColumnsNames = "user_id, workarea, storeroom_part_number, quantity, created_date, created_by";
	public static String jdbc_connection = "BAF_demo_BF";

	protected String realUserName = null;
	protected String strResult = "";
	conn conn_BAF = null;
	boolean bln_result = false;
	private String userName = "";
	private String password = "";
	
	/**
	 * Gets the userName value.
	 * @return userName, return userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * Sets the userName value.
	 */
	public void setUserName(String userName) {
		this.userName = userName.trim();
	}

	/**
	 * Gets the password value.
	 * @return password, return password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Sets the password value.
	 */
	public void setPassword(String password) {
		this.password = password.trim();
	}

	/**
	 * Gets the strResult value.
	 * @return strResult, return strResult
	 */
	public String getStrResult() {
		return strResult;
	}

	/**
	 * Sets the strResult value.
	 */
	public void setStrResult(String strResult) {
		this.strResult = strResult.trim();
	}

	/**
	 * Creates the error messages.
	 */
	public static final Integer ERR_USER_NAME = new Integer(1);
	public static final Integer ERR_USER_NAME_NOT_FOUND = new Integer(2);
	public static final Integer ERR_PASSWORD = new Integer(3);
	public static final Integer ERR_PASSWORD_NOT_FOUND = new Integer(4);
	public static final Integer ERR_PASSWORD_LENGTH = new Integer(5);
	public static final Integer ERR_USER_REALNAME_NOT_FOUND = new Integer(6);

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
	 * Gets the errorMessage value.
	 * @return errorMessage, return errorMessage
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
	 */
	public boolean isValid() {
		/* Form validation and processing */
		// Clear all errors
		errorCodes.clear();
		// Validate
		if (userName.length() == 0) {
			errorCodes.put("userName", ERR_USER_NAME);
		} else if (userName.length() != 0) {
			userName = userName.replaceAll("'", "").trim();
			if (validateUser() == true) {
				//System.out.println("=======================");
				//System.out.println("A valid user name was entered. " + userName);
			} else {
				errorCodes.put("userName", ERR_USER_NAME_NOT_FOUND);
			}
		}
		if (password.length() == 0) {
			errorCodes.put("password", ERR_PASSWORD);
		} else if (password.length() != 0) {
			realUserName = validatePassword();
			//System.out.println("Real User Name: " + realUserName);
			// password = password.replaceAll("\\p{Punct}|\\s","");
			// if (strResult.equals(password)){
			if (checkInfo() == true) {
				//System.out.println("A valid password was entered. " + password);
				//System.out.println("=======================");
			}else {
				errorCodes.put("password", ERR_PASSWORD_NOT_FOUND);
			}
		}if(strResult.equals(password)){
			//System.out.println("=======================");
		}else{
			errorCodes.put("password", ERR_PASSWORD_NOT_FOUND);
		}
		// If no errors, form is valid
		return errorCodes.size() == 0;
	}

	/**
	 * Processes the form and returns false if the form is not valid.
	 */
	public boolean process() {
		// Process form...
		if (!isValid()) {
			return false;
		}
		// if (errorCodes.size() == 0){
		// insertMainElement();
		// }
		// Clear the form
		//userName = "";
		password = "";
		errorCodes.clear();
		return true;
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
	 * Makes a database connection and calls a store procedure with the
	 * variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 *         false if it has failed.
	 */
	public boolean validateUser() {

		boolean bln_result = true;
		conn_BAF = new conn();
		bln_result = conn_BAF.getConnection(jdbc_connection);

		if (bln_result == false) {
			//System.out.println("Connection_9 to BAF BAF schema failed. " + new java.util.Date());
			//System.out.println("Adding ArrayList elements...");
		} else {
			//System.out.println("Connection_10 to BAF BAF succeded.");
			try {
				ResultSet rs = null;
				String sql = "select BAF.F_STRM_SWIPE_CARD_NO('"
					+ userName.toString() + "') from dual";

				Connection curr_conn = conn_BAF.current_connection;

				rs = curr_conn.createStatement().executeQuery(sql);
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
		}
		conn_BAF.current_connection = null;
		conn_BAF = null;
		return bln_result;
	}

	/**
	 * Makes a database connection and calls a store procedure with the
	 * variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 *         false if it has failed.
	 */
	public String validatePassword() {
		// check if the password is valid
		conn conn_BAF = new conn();
		bln_result = conn_BAF.getConnection(jdbc_connection);

		if (bln_result == false) {
		//	System.out.println("Connection to BAF BAF schema failed.");
		} else {
			//System.out.println("Connection to BAF BAF succeded.");
			try {
				ResultSet rs = null;
				String sql = "SELECT BAF.F_CHECK_SWIPE_CARD_PASSWORD('"
					+ userName.toString() + "', '" + password.toString()
					+ "') from dual";
				Connection curr_conn = conn_BAF.current_connection;
				rs = curr_conn.createStatement().executeQuery(sql);
				if (rs.next()) {
					strResult = rs.getString(1);
					// strResult= rs.getString("USER_NAME") ;
					// System.out.println("TEST: " + strResult);
				}
				rs.close();
				curr_conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return strResult;
	}

	// check the user name and password are valid, false if are not valid.
	public boolean checkInfo() {
		// String userRealName = userName;
		conn conn_BAF = new conn();
		bln_result = conn_BAF.getConnection(jdbc_connection);

		if (bln_result == false) {
			//System.out.println("Connection to BAF BAF schema failed.");
		} else {
			//System.out.println("Connection to BAF BAF succeded.");
			try {
				String query = "begin ? := BAF.F_CHECK_USERNAME_PASSWORD(?,?); end;";
				Connection curr_conn = conn_BAF.current_connection;
				CallableStatement stmt = curr_conn.prepareCall(query);

				//register the type of the out param - an Oracle specific type
				stmt.registerOutParameter(1, OracleTypes.NUMBER);
				//set the in param
				stmt.setString(2, strResult);
				stmt.setString(3, password);
				//execute and retrieve the result set
				stmt.execute();
				ResultSet rs = (ResultSet)stmt.getBigDecimal(1);
				
			//	ResultSet rs = null;
			//	String sql = "select BAF.F_CHECK_USERNAME_PASSWORD('"
				//	+ strResult.toString() + "', '" + password.toString()
			//		+ "') from dual";
			//	Connection curr_conn = conn_BAF.current_connection;
			//	rs = curr_conn.createStatement().executeQuery(sql);
				
				//ArrayList test = new ArrayList();
				while (rs.next()) {
					if (rs.getInt(1)== 0) {
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
		}
		return bln_result;
	}

	/*public String date() {
		Date now = new Date(); // initialise to current UTC Date/Time
		//SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
		// EEEE, MM/dd/yyyy hh:mm:ss aa
		sdf.setTimeZone(TimeZone.getDefault()); // local time
		String dateString = sdf.format(now);
		System.out.println("Date: " + dateString);
		return dateString;
	}*/

	public void destroy() {
		conn = null;
	}

	// private String ErrorMessage;
	public static Connection conn = null;

	//Statement stmt;
	ResultSet rs;
}