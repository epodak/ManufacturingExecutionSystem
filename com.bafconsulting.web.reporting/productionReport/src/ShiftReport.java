package productionReport;

import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import oracle.jdbc.OracleTypes;

import jdbc_connect.conn;

/**
 * 
 * Class MyForm - This is the main e_stop java bean it validates 
 * and processes the main form, and submits data to a database.
 * 
 * @author Bryn Flewelling, BAFCONSULTING Manufacturing.
 * @version 2011.3.02 
 * 
 */
public class ShiftReport implements Serializable{
	//public static String jdbc_connection = "BAF_BF";
	public static String jdbc_connection = "BAF_demo_BF";

	conn conn_BAFCONSULTING = null;

	/* The properties */
	private String mon = "";
	private String tue = "";	
	private String wed = "";
	private String thu = "";
	private String fri = "";
	private String sat = "";
	private String sun = "";
	private String workArea = "";
	private String station = "";
	private String partNumber = "";
	private String pln = "";
	private String act = "";
	private String var = "";
	private String downtime = "";
	private String overtime = "";
	private String summary = "";
	private String safety = "";
	private String quality = "";

	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getMon() {
		return mon;
	}

	/**
	 * Sets the station value.
	 */
	public void setMon(String mon) {
		this.mon = mon.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getTue() {
		return tue;
	}

	/**
	 * Sets the station value.
	 */
	public void setTue(String tue) {
		this.tue = tue.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getWed() {
		return wed;
	}

	/**
	 * Sets the station value.
	 */
	public void setWed(String wed) {
		this.wed = wed.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getThu() {
		return thu;
	}

	/**
	 * Sets the station value.
	 */
	public void setThu(String thu) {
		this.thu = thu.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getFri() {
		return fri;
	}

	/**
	 * Sets the station value.
	 */
	public void setFri(String fri) {
		this.fri = fri.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getSat() {
		return sat;
	}

	/**
	 * Sets the station value.
	 */
	public void setSat(String sat) {
		this.sat = sat.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getSun() {
		return sun;
	}

	/**
	 * Sets the station value.
	 */
	public void setSun(String sun) {
		this.sun = sun.trim();
	}

	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getWorkArea() {
		return workArea;
	}

	/**
	 * Sets the station value.
	 */
	public void setWorkArea(String workArea) {
		this.workArea = workArea.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getStation() {
		return station;
	}

	/**
	 * Sets the station value.
	 */
	public void setStation(String station) {
		this.station = station.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getPartNumber() {
		return partNumber;
	}

	/**
	 * Sets the station value.
	 */
	public void setPartNumber(String partNumber) {
		this.partNumber = partNumber.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getPln() {
		return pln;
	}

	/**
	 * Sets the station value.
	 */
	public void setPln(String pln) {
		this.pln = pln.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getAct() {
		return act;
	}

	/**
	 * Sets the station value.
	 */
	public void setAct(String act) {
		this.act = act.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getVar() {
		return var;
	}

	/**
	 * Sets the station value.
	 */
	public void setVar(String var) {
		this.var = var.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getDowntime() {
		return downtime;
	}

	/**
	 * Sets the station value.
	 */
	public void setDowntime(String downtime) {
		this.downtime = downtime.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getOvertime() {
		return overtime;
	}

	/**
	 * Sets the station value.
	 */
	public void setOverTime(String overtime) {
		this.overtime = overtime.trim();
	}
	
	/**
	 * Sets the station value.
	 */
	public void setSummary(String summary) {
		this.summary = summary.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getSummary() {
		return summary;
	}
	
	/**
	 * Sets the station value.
	 */
	public void setSafety(String safety) {
		this.safety = safety.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getSafety() {
		return safety;
	}
	
	/**
	 * Sets the station value.
	 */
	public void setQuality(String quality) {
		this.quality = quality.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getQuality() {
		return quality;
	}
	
	/**
	 * Creates static error messages.
	 */
	public static final Integer ERR_STATION = new Integer(1);
	public static final Integer ERR_WORKAREA = new Integer(2);
	public static final Integer ERR_PARTNUMBER = new Integer(3);
	public static final Integer ERR_PLN = new Integer(4);
	public static final Integer ERR_ACT = new Integer(5);	
	public static final Integer ERR_VAR = new Integer(6);
	public static final Integer ERR_DOWNTIME = new Integer(7);
	public static final Integer ERR_OVERTIME = new Integer(8);
	public static final Integer ERR_SUMMARY = new Integer(9);
	public static final Integer ERR_SAFETY = new Integer(10);
	public static final Integer ERR_QUALITY = new Integer(11);
	// Holds error messages for the properties
	Map error = new HashMap();

	// Maps error partNumbers to textual messages.
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
		Integer partNumber = (Integer) (error.get(propName));
		if (partNumber == null) {
			return "";
		} else if (msgMap != null) {
			String msg = (String) msgMap.get(partNumber);
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
		
		// Clear all errors
		error.clear();
		// Validate
		if(station != ""){
			//System.out.println("station: " + station);
		}else{
			//System.out.println("stationFAIL: " + station);
			error.put("generic", ERR_STATION);
		}
		if(workArea != ""){
			//System.out.println("Work area: " + workArea);
		}else{
			//System.out.println("Work AreaFAIL: " + workArea);
			error.put("generic", ERR_WORKAREA);
		}
		if(partNumber != ""){
			//System.out.println("partNumber: " + partNumber);
		}else{
			//System.out.println("partNumberFAIL: " + partNumber);
			error.put("generic", ERR_PARTNUMBER);
		}
		if(pln != ""){
			//System.out.println("Pln: " +pln);
		}else{
			//System.out.println("PlnFAIL: " + pln);
			error.put("generic", ERR_PLN);
		}
		if(act != ""){
			//System.out.println("Act: " +act);
		}else{
			//System.out.println("ActFAil: " + act);
			error.put("generic", ERR_ACT);
		}
		if(var != ""){
			//System.out.println("Var: " +var);
		}else{
			//System.out.println("VarFail: " + var);
			error.put("generic", ERR_VAR);
		}
		if(downtime != ""){
			//System.out.println("Downtime: " +downtime);
		}else{
			//System.out.println("DowntimeFail: " + downtime);
			error.put("generic", ERR_DOWNTIME);
		}
		if(overtime != ""){
			//System.out.println("Overtime: " +overtime);
		}else{
			//System.out.println("OvertimeFail: " + overtime);
			error.put("generic", ERR_OVERTIME);
		}
		if(summary != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("generic", ERR_SUMMARY);
		}
		if(safety != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("generic", ERR_SAFETY);
		}
		if(quality != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("generic", ERR_QUALITY);
		}
		loadValues();
		// If no errors, form is valid
		return error.size() == 0;
	}
	
	/**
	 * Processes the form and returns false if the form is not valid. Calls the
	 * insertMainElement method to submit data to database.
	 * 
	 * @return true, returns true if form us valid, if not return false
	 * 
	 */
	public boolean process() {
		// Process form...
		if (!isValid()) {
			return false;
		}
		if (error.size() == 0) {
			//insertMainElement();
		}
		//Clear the form
		mon = "";
		tue = "";
		wed = "";
		thu = "";
		fri = "";
		sat = "";
		sun = "";
		station = "";
		workArea = "";
		partNumber = "";
		pln = "";
		act = "";
		var = "";
		downtime = "";
		overtime = "";
		summary = "";
		error.clear();
		return true;
	}
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList populateWorkArea() {
		//date();
		ArrayList workArea = new ArrayList();
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
			Connection curr_conn = conn_BAFCONSULTING.current_connection;

			String sql = "SELECT A.PROD_WORKAREA, A.STATION , A.PART_NUMBER , A.REVISION , A.ERP_DESCRIPTION FROM BAFCONSULTING.PRODUCTION_REPORTS A";
			ResultSet rs = null;
			rs = curr_conn.createStatement().executeQuery(sql);

			//print the results
			while (rs.next()) {
				workArea.add(rs.getString(1));
				//System.out.println(rs.getString(1));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return workArea;
	}
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList populateStation() {
		//date();
		ArrayList station = new ArrayList();
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
			Connection curr_conn = conn_BAFCONSULTING.current_connection;

			String sql = "SELECT A.PROD_WORKAREA, A.STATION , A.PART_NUMBER , A.REVISION , A.ERP_DESCRIPTION FROM BAFCONSULTING.PRODUCTION_REPORTS A";
			ResultSet rs = null;
			rs = curr_conn.createStatement().executeQuery(sql);

			//print the results
			while (rs.next()) {
				station.add(rs.getString(2));
				//System.out.println(rs.getString(2));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return station;
	}
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList populatePartNumber() {
		//date();
		ArrayList partNumber = new ArrayList();
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

			Connection curr_conn = conn_BAFCONSULTING.current_connection;

			String sql = "SELECT A.PROD_WORKAREA, A.STATION , A.PART_NUMBER , A.REVISION , A.ERP_DESCRIPTION FROM BAFCONSULTING.PRODUCTION_REPORTS A";
			ResultSet rs = null;
			rs = curr_conn.createStatement().executeQuery(sql);
			
			//print the results
			while (rs.next()) {
				partNumber.add(rs.getString(3));
				//System.out.println(rs.getString(3));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return partNumber;
	}
	/**
	 * Inserts all data into database. Makes a database connection and calls a store 
	 * procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
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
		}
		try {
			// this will call the store procedure
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			curr_conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return bln_result;
	}	
	
	/**
	 * 
	 * Checks the enviroment variables, time and date of the running application.
	 * 
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
		if(station !="" && workArea !="" && partNumber !="" && pln!="" && act!="" && var!="" && downtime!="" && overtime !="" && summary!=""){
			System.out.println("===========================");	
			System.out.println("station: " + station);
			System.out.println("Work Area: " + workArea);
			System.out.println("partNumber: " + partNumber);
			System.out.println("Pln: " + pln);
			System.out.println("ACT: " + act);
			System.out.println("VAR: " + var);
			System.out.println("Downtime: " + downtime);
			System.out.println("Overtime: " + overtime);
			System.out.println("Summary: " + summary);
			System.out.println("===========================");	
		}else{
			System.out.println("==Null values are present==");		
			System.out.println("station: " + station);
			System.out.println("Work Area: " + workArea);
			System.out.println("partNumber: " + partNumber);
			System.out.println("Pln: " + pln);
			System.out.println("ACT: " + act);
			System.out.println("VAR: " + var);
			System.out.println("Downtime: " + downtime);
			System.out.println("Overtime: " + overtime);
			System.out.println("Summary: " + summary);
			System.out.println("===========================");	
		}
	}
}