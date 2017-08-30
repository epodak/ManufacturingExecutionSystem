<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.Serializable" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<%@ page import="jdbc_connect.conn" %>
<%
package productionReport;

/**
 * 
 * Class MyForm - This is the main e_stop java bean it validates 
 * and processes the main form, and submits data to a database.
 * 
 * @author Bryn Flewelling, BAFCONSULTING Manufacturing.
 * @version 2011.3.02 
 * 
 */
public class ScrapReport implements Serializable{
	public static String jdbc_connection = "BAFCONSULTING_demo_BF";

	conn conn_BAFCONSULTING = null;

	/* The properties */
	private String lineId = "";
	private String costCenter = "";	
	private String platform = "";
	private String partNumber = "";
	private String revision = "";
	private String partDescription = "";
	private String cost = "";
	private String commonCode = "";
	private String uniqueCode = "";
	private String quantity = "";
	private String comments = "";
	private String batchDate = "";
	private String backFlush = "";
	private String chargebackCode = "";
	private String scrapCode = "";
	private String workArea = "";
	private String platformCode = "";	
	private String username = "";

	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getLineId() {
		return lineId;
	}

	/**
	 * Sets the station value.
	 */
	public void setLineId(String lineId) {
		this.lineId = lineId.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getCostCenter() {
		return costCenter;
	}

	/**
	 * Sets the station value.
	 */
	public void setCostCenter(String costCenter) {
		this.costCenter = costCenter.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getPlatform() {
		return platform;
	}

	/**
	 * Sets the station value.
	 */
	public void setPlatform(String platform) {
		this.platform = platform.trim();
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
	public String getRevision() {
		return revision;
	}

	/**
	 * Sets the station value.
	 */
	public void setRevision(String revision) {
		this.revision = revision.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getPartDescription() {
		return partDescription;
	}

	/**
	 * Sets the station value.
	 */
	public void setPartDescription(String partDescription) {
		this.partDescription = partDescription.trim();
	}
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getCost() {
		return cost;
	}

	/**
	 * Sets the station value.
	 */
	public void setCost(String cost) {
		this.cost = cost.trim();
	}

	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getCommonCode() {
		return commonCode;
	}

	/**
	 * Sets the station value.
	 */
	public void setCommonCode(String commonCode) {
		this.commonCode = commonCode.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getUniqueCode() {
		return uniqueCode;
	}

	/**
	 * Sets the station value.
	 */
	public void setUniqueCode(String uniqueCode) {
		this.uniqueCode = uniqueCode.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getQuantity() {
		return quantity;
	}

	/**
	 * Sets the station value.
	 */
	public void setQuantity(String quantity) {
		this.quantity = quantity.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getComments() {
		return comments;
	}

	/**
	 * Sets the station value.
	 */
	public void setComments(String comments) {
		this.comments = comments.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getBatchDate() {
		return batchDate;
	}

	/**
	 * Sets the station value.
	 */
	public void setBatchDate(String batchDate) {
		this.batchDate = batchDate.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getBackFlush() {
		return backFlush;
	}

	/**
	 * Sets the station value.
	 */
	public void setBackFlush(String backFlush) {
		this.backFlush = backFlush.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getChargebackCode() {
		return chargebackCode;
	}

	/**
	 * Sets the station value.
	 */
	public void setChargebackCode(String chargebackCode) {
		this.chargebackCode = chargebackCode.trim();
	}
	
	/**
	 * Gets the station value.
	 * @return station, return station
	 */
	public String getScrapCode() {
		return scrapCode;
	}

	/**
	 * Sets the station value.
	 */
	public void setScrapCode(String scrapCode) {
		this.scrapCode = scrapCode.trim();
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
	public String getPlatformCode() {
		return platformCode;
	}

	/**
	 * Sets the station value.
	 */
	public void setPlatformCode(String platformCode) {
		this.platformCode = platformCode.trim();
	}
	/**
	 * Creates static error messages.
	 */
	public static final Integer ERR_LINEID = new Integer(1);
	public static final Integer ERR_COSTCENTER = new Integer(2);
	public static final Integer ERR_PLATFORM = new Integer(3);
	public static final Integer ERR_PARTNUMBER = new Integer(4);
	public static final Integer ERR_REVISION = new Integer(5);	
	public static final Integer ERR_DESCRIPTION = new Integer(6);
	public static final Integer ERR_COST = new Integer(7);
	public static final Integer ERR_COMMONCODE = new Integer(8);
	public static final Integer ERR_UNIQUECODE = new Integer(9);
	public static final Integer ERR_QUANTITY = new Integer(10);
	public static final Integer ERR_COMMENTS = new Integer(11);
	public static final Integer ERR_BATCHDATE = new Integer(12);
	public static final Integer ERR_BACKFLUSH = new Integer(13);
	public static final Integer ERR_CHANGEBACKCODE = new Integer(14);
	public static final Integer ERR_SCRAPCODE = new Integer(15);
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
		if(lineId != ""){
			//System.out.println("station: " + station);
		}else{
			//System.out.println("stationFAIL: " + station);
			error.put("lineId", ERR_LINEID);
		}
		/*if(costCenter != ""){
			//System.out.println("Work area: " + workArea);
		}else{
			//System.out.println("Work AreaFAIL: " + workArea);
			error.put("costCenter", ERR_COSTCENTER);
		}
		if(platform != ""){
			//System.out.println("partNumber: " + partNumber);
		}else{
			//System.out.println("partNumberFAIL: " + partNumber);
			error.put("platform", ERR_PLATFORM);
		}*/
		if(partNumber != ""){
			//System.out.println("Pln: " +pln);
		}else{
			//System.out.println("PlnFAIL: " + pln);
			error.put("partNumber", ERR_PARTNUMBER);
		}
		/*if(revision != ""){
			//System.out.println("Act: " +act);
		}else{
			//System.out.println("ActFAil: " + act);
			error.put("revision", ERR_REVISION);
		}
		if(partDescription != ""){
			//System.out.println("Var: " +var);
		}else{
			//System.out.println("VarFail: " + var);
			error.put("partDescription", ERR_DESCRIPTION);
		}
		if(cost != ""){
			//System.out.println("Downtime: " +downtime);
		}else{
			//System.out.println("DowntimeFail: " + downtime);
			error.put("cost", ERR_COST);
		}*/
		if(commonCode != ""){
			//System.out.println("Overtime: " +overtime);
		}else{
			//System.out.println("OvertimeFail: " + overtime);
			error.put("commonCode", ERR_COMMONCODE);
		}
		/*if(uniqueCode != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("uniqueCode", ERR_UNIQUECODE);
		}*/
		if(quantity != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("quantity", ERR_QUANTITY);
		}
		/*if(comments != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("comments", ERR_COMMENTS);
		}
		if(batchDate != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("batchDate", ERR_BATCHDATE);
		}
		if(backFlush != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("backFlush", ERR_BACKFLUSH);
		}
		if(chargebackCode != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("chargebackCode", ERR_CHANGEBACKCODE);
		}
		if(scrapCode != ""){
			//System.out.println("Summary: " +summary);
		}else{
			//System.out.println("SummaryFail: " + summary);
			error.put("scrapCode", ERR_SCRAPCODE);
		}*/
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
			InsertMainElement();
		}
		
		//Clear the form
		lineId = "";
		costCenter = "";	
		platform = "";
		partNumber = "";
		revision = "";
		partDescription = "";
		cost = "";
		commonCode = "";
		uniqueCode = "";
		quantity = "";
		comments = "";
		batchDate = "";
		backFlush = "";
		chargebackCode = "";
		scrapCode = "";
		
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
	public ArrayList populateStation() {
		ArrayList station = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
			//System.out.println("Adding ArrayList elements...");
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			//SELECT A.PROD_WORKAREA, A.STATION , A.PART_NUMBER , A.REVISION , A.ERP_DESCRIPTION FROM BAFCONSULTING.PRODUCTION_REPORTS A
			//String sql = "";

			//String sql = "select DISTINCT PROD_WORKAREA, PROD_WORKAREA_DESCRIPTION from BAFCONSULTING.prod_workarea ORDER BY PROD_WORKAREA ASC";
			//ResultSet rs = null;
			//rs = curr_conn.createStatement().executeQuery(sql);

			String query = "begin ? := scrap_station(?,?); end;";
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, username);
			stmt.setString(3, platform);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);
			
			//print the results
			while (rs.next()) {
				station.add(rs.getString(1));
				//System.out.println(rs.getString(1));
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
	public ArrayList populateStationDescription() {

		ArrayList stationDescription = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
			//System.out.println("Adding ArrayList elements...");
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			//SELECT A.PROD_WORKAREA, A.STATION , A.PART_NUMBER , A.REVISION , A.ERP_DESCRIPTION FROM BAFCONSULTING.PRODUCTION_REPORTS A
			//String sql = "";
			
			//String sql = "select DISTINCT PROD_WORKAREA, PROD_WORKAREA_DESCRIPTION from BAFCONSULTING.prod_workarea ORDER BY PROD_WORKAREA ASC";
			//ResultSet rs = null;
			//rs = curr_conn.createStatement().executeQuery(sql);
			
			String query = "begin ? := f_scrap_station_description(?,?); end;";
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, username);
			stmt.setString(3, platform);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);

			//print the results
			while (rs.next()) {
				stationDescription.add(rs.getString(1));
				//System.out.println(rs.getString(1));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return stationDescription;
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
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
			//System.out.println("Adding ArrayList elements...");
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {

			Connection curr_conn = conn_BAFCONSULTING.current_connection;

			//String sql = "SELECT fspwl.PART_NUMBER, fspwl.REVISION, fgi.DESCRIPTION FROM BAFCONSULTING.SP_PHANTOM_WORKAREA_LIST fspwl, BAFCONSULTING.GLOV_ITEM_LOCAL fgi WHERE fgi.REVISION = fspwl.REVISION AND fspwl.WORKAREA= 'PPP' AND fgi.ITEM = fspwl.PART_NUMBER and fspwl.active=-1ORDER BY fspwl.PART_NUMBER";
			//ResultSet rs = null;
			//rs = curr_conn.createStatement().executeQuery(sql);
			
			String query = "begin ? := f_scrap_part_number(?); end;";
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, platform);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);
			
			//print the results
			while (rs.next()) {
				partNumber.add(rs.getString(1));
				//System.out.println(rs.getString(1));
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
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList populatePartDescription() {
		//date();
		ArrayList partDescription = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
			//System.out.println("Adding ArrayList elements...");
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
			Connection curr_conn = conn_BAFCONSULTING.current_connection;

			//String sql = "SELECT fspwl.PART_NUMBER, fspwl.REVISION, fgi.DESCRIPTION FROM BAFCONSULTING.SP_PHANTOM_WORKAREA_LIST fspwl, BAFCONSULTING.GLOV_ITEM_LOCAL fgi WHERE fgi.REVISION = fspwl.REVISION AND fspwl.WORKAREA= 'PPP' AND fgi.ITEM = fspwl.PART_NUMBER and fspwl.active=-1ORDER BY fspwl.PART_NUMBER";
			//ResultSet rs = null;
			//rs = curr_conn.createStatement().executeQuery(sql);
			
			String query = "begin ? := scrap_part_description(?); end;";
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, platform);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);
			
			//print the results
			while (rs.next()) {
				partDescription.add(rs.getString(3));
				//System.out.println(rs.getString(1));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return partDescription;
	}
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList populateCommonCode() {
		ArrayList commonCode = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
			//System.out.println("Adding ArrayList elements...");
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			//String sql = "";
			String sql = "SELECT A.ERP_DESCRIPTION FROM BAFCONSULTING.PRODUCTION_REPORTS A";
			ResultSet rs = null;
			rs = curr_conn.createStatement().executeQuery(sql);
			
			//print the results
			while (rs.next()) {
				commonCode.add(rs.getString(1));
				//System.out.println(rs.getString(1));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return commonCode;
	}
	
	/**
	 * Inserts all data into database. Makes a database connection and calls a store 
	 * procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public boolean InsertMainElement() {
		boolean bln_result = true;
		// dumpEnv();
		conn_BAFCONSULTING = new conn();

		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);

		// String to integer conversion*important*
		// Integer qty = Integer.parseInt(quantity);

		if (bln_result == false) {
			//System.out.println("Connection_5 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
			return false;
		} else {
			//System.out.println("Connection_6 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
			// this will call the store procedure
			Connection curr_conn = conn_BAFCONSULTING.current_connection;

			curr_conn.prepareCall(
					"{call BAFCONSULTING.p_reports_scrap_log('" + lineId + "', '" + partNumber + "', '" + commonCode + "', '" + quantity + "', '" + workArea + "', '" + platformCode + "')}").execute();

			curr_conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return bln_result;
	}	
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList ScrapReasonCode() {
		ArrayList scrapReasonCode = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
			//String estop_date_str = "date();";
			String query = "begin ? := scrap_reason_code(?,?); end;";
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, platformCode);
			stmt.setString(3, platform);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);

			//print the results
			while (rs.next()) {
				scrapReasonCode.add(rs.getString(1));
				//System.out.println(rs.getString("REASON_CODE"));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return scrapReasonCode;
	}
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList populateRevision() {
		String cnn = "";
		String bcr_type = "";
		String bcr_alt = "";
		ArrayList revision = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
			//String estop_date_str = "date();";
			String query = "begin ? := scrap_item_revision(?,?,?); end;";
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, cnn);
			stmt.setString(3, bcr_type);
			stmt.setString(4, bcr_alt);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);

			//print the results
			while (rs.next()) {
				revision.add(rs.getString(2));
				//System.out.println(rs.getString("REASON_CODE"));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return revision;
	}
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList ScrapReasonDescription() {
		ArrayList scrapReasonDescription = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
			Connection curr_conn = conn_BAFCONSULTING.current_connection;
			//
			
			//String sql = "SELECT DISTINCT fsrc.REASON_CODE, fsrc.DESCRIPTION FROM BAFCONSULTING.SP_REASON_CODE fsrc, BAFCONSULTING.SP_REASON_PLATFORM fsrp WHERE fsrc.REASON_CODE = fsrp.REASON_CODE AND fsrc.REASON_CODE <> 'SRT' ORDER BY fsrc.REASON_CODE";
			//ResultSet rs = null;
			//rs = curr_conn.createStatement().executeQuery(sql);
			
			String query = "begin ? := scrap_reason_description(?,?); end;";
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, platformCode);
			stmt.setString(3, platform);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);
			
			//print the results
			while (rs.next()) {
				scrapReasonDescription.add(rs.getString(2));
				//System.out.println(rs.getString("REASON_CODE"));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return scrapReasonDescription;
	}
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList ChargebackCode() {
		ArrayList chargeback = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
				Connection curr_conn = conn_BAFCONSULTING.current_connection;
				
				
			String query = "begin ? := scrap_chargeback_code(?); end;";
			CallableStatement stmt = curr_conn.prepareCall(query);

			//register the type of the out param - an Oracle specific type
			stmt.registerOutParameter(1, OracleTypes.CURSOR);
			//set the in param 'MM/DD/YYYY'
			stmt.setString(2, chargebackCode);
			//execute and retrieve the result set
			stmt.execute();
			ResultSet rs = (ResultSet)stmt.getObject(1);	
				 
			//print the results
			while (rs.next()) {
				chargeback.add(rs.getString(1));
				//System.out.println(rs.getString("REASON_CODE"));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return chargeback;
	}

	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList ChargebackDescription() {
		ArrayList chargebackDescription = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
				Connection curr_conn = conn_BAFCONSULTING.current_connection;
				//String sql = "SELECT CHARGED_TO FROM BAFCONSULTING.SP_CHARGEBACK_CODES";
				//ResultSet rs = null;
				//rs = curr_conn.createStatement().executeQuery(sql);
				String query = "begin ? := scrap_chargeback_description(?); end;";
				CallableStatement stmt = curr_conn.prepareCall(query);

				//register the type of the out param - an Oracle specific type
				stmt.registerOutParameter(1, OracleTypes.CURSOR);
				//set the in param 'MM/DD/YYYY'
				stmt.setString(2, chargebackCode);
				//execute and retrieve the result set
				stmt.execute();
				ResultSet rs = (ResultSet)stmt.getObject(1);	
				 
			//print the results
			while (rs.next()) {
				chargebackDescription.add(rs.getString(2));
				//System.out.println(rs.getString("REASON_CODE"));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return chargebackDescription;
	}
	
	/**
	 * Populates listbox with e-stop values. Makes a database connection and calls a 
	 * store procedure with the variables.
	 * 
	 * @return bln_result, returnes true is database connection has succeded and
	 * false if it has failed.
	 * 
	 */
	public ArrayList ScrapCode() {
		ArrayList scrapCode = new ArrayList();
		boolean bln_result = true;
		conn_BAFCONSULTING = new conn();
		bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
		//ArrayList date = new ArrayList();
		if (bln_result == false) {
			//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
		} else {
			//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
		}
		try {
				Connection curr_conn = conn_BAFCONSULTING.current_connection;
				//String sql = "";
				String sql = "SELECT A.SCRAP_CODE , A.BACKFLUSH FROM BAFCONSULTING.SP_SCRAP_CODE A";
				ResultSet rs = null;
				rs = curr_conn.createStatement().executeQuery(sql);
				
			//print the results
			while (rs.next()) {
				scrapCode.add(rs.getString(1));
				//System.out.println(rs.getString("REASON_CODE"));
			}	
			rs.close();
			curr_conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		conn_BAFCONSULTING.current_connection = null;
		conn_BAFCONSULTING = null;
		return scrapCode;
	}
	
		/**
		 * Populates listbox with e-stop values. Makes a database connection and calls a 
		 * store procedure with the variables.
		 * 
		 * @return bln_result, returnes true is database connection has succeded and
		 * false if it has failed.
		 * 
		 */
		public ArrayList PlatformCode() {
			//String platformcode = "";
			ArrayList platformCode1 = new ArrayList();
			boolean bln_result = true;
			conn_BAFCONSULTING = new conn();
			bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
			//ArrayList date = new ArrayList();
			if (bln_result == false) {
				//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
			} else {
				//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
			}
			try {
					String query = "begin ? := scrap_platform_code(?,?); end;";
					Connection curr_conn = conn_BAFCONSULTING.current_connection;
					CallableStatement stmt = curr_conn.prepareCall(query);

					//register the type of the out param - an Oracle specific type
					stmt.registerOutParameter(1, OracleTypes.CURSOR);
					//set the in param 'MM/DD/YYYY'
					stmt.setString(2, platform);
					stmt.setString(3, username);
					//execute and retrieve the result set
					stmt.execute();
					ResultSet rs = (ResultSet)stmt.getObject(1);	
					
		
					
				//print the results
				while (rs.next()) {
					platformCode1.add(rs.getString(1));
					//System.out.println(rs.getString(1));
				}	
				rs.close();
				curr_conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			conn_BAFCONSULTING.current_connection = null;
			conn_BAFCONSULTING = null;
			return platformCode1;
		}
		
		/**
		 * Populates listbox with e-stop values. Makes a database connection and calls a 
		 * store procedure with the variables.
		 * 
		 * @return bln_result, returnes true is database connection has succeded and
		 * false if it has failed.
		 * 
		 */
		public ArrayList PlatformDescription() {
			ArrayList platformDescription = new ArrayList();
			boolean bln_result = true;
			conn_BAFCONSULTING = new conn();
			bln_result = conn_BAFCONSULTING.getConnection(jdbc_connection);
			//ArrayList date = new ArrayList();
			if (bln_result == false) {
				//System.out.println("Connection_3 to BAFCONSULTING BAFCONSULTING schema failed. "+ new java.util.Date());
			} else {
				//System.out.println("Connection_4 to BAFCONSULTING BAFCONSULTING succeded.");
			}
			try {
					Connection curr_conn = conn_BAFCONSULTING.current_connection;
	
					
					String query = "begin ? := f_scrap_platform_code(?,?); end;";
					CallableStatement stmt = curr_conn.prepareCall(query);

					//register the type of the out param - an Oracle specific type
					stmt.registerOutParameter(1, OracleTypes.CURSOR);
					//set the in param 'MM/DD/YYYY'
					stmt.setString(2, platformCode);
					stmt.setString(3, platform);
					//execute and retrieve the result set
					stmt.execute();
					ResultSet rs = (ResultSet)stmt.getObject(1);	
					
					
				//print the results
				while (rs.next()) {
					platformDescription.add(rs.getString(2));
					//System.out.println(rs.getString("REASON_CODE"));
				}	
				rs.close();
				curr_conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			conn_BAFCONSULTING.current_connection = null;
			conn_BAFCONSULTING = null;
			return platformDescription;
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
		//if(lineId !="" && costCenter !="" && platform !="" && partNumber !="" && revision !="" && partDescription !="" && cost !="" && commonCode !="" && uniqueCode !="" && quantity !="" && comments !="" && batchDate !="" && backFlush !="" && chargebackCode !="" && scrapCode !=""){
		if(lineId !="" && partNumber !="" && commonCode !="" && quantity !=""){	
			System.out.println("===========================");	
			System.out.println("platform: " + platform);
			System.out.println("platformCode: " + platformCode);
			System.out.println("===========================");	
			System.out.println("lineId: " + lineId);
			//System.out.println("costCenter: " + costCenter);
			//System.out.println("platform: " + platform);
			System.out.println("partNumber: " + partNumber);
			//System.out.println("revision: " + revision);
			//System.out.println("partDescription: " + partDescription);
			//System.out.println("cost: " + cost);
			System.out.println("commonCode: " + commonCode);
			//System.out.println("uniqueCode: " + uniqueCode);
			System.out.println("quantity: " + quantity);
			//System.out.println("comments: " + comments);
			//System.out.println("batchDate: " + batchDate);
			//System.out.println("backFlush: " + backFlush);
			//System.out.println("chargebackCode: " + chargebackCode);
			//System.out.println("scrapCode: " + scrapCode);
			System.out.println("===========================");	
		}else{		
			System.out.println("==Null values are present==");	
			System.out.println("workArea: " + workArea);
			System.out.println("platform: " + platformCode);
			System.out.println("===========================");	
			System.out.println("lineId: " + lineId);
			//System.out.println("costCenter: " + costCenter);
			//System.out.println("platform: " + platform);
			System.out.println("partNumber: " + partNumber);
			//System.out.println("revision: " + revision);
			//System.out.println("partDescription: " + partDescription);
			//System.out.println("cost: " + cost);
			System.out.println("commonCode: " + commonCode);
			//System.out.println("uniqueCode: " + uniqueCode);
			System.out.println("quantity: " + quantity);
			//System.out.println("comments: " + comments);
			//System.out.println("batchDate: " + batchDate);
			//System.out.println("backFlush: " + backFlush);
			//System.out.println("chargebackCode: " + chargebackCode);
			//System.out.println("scrapCode: " + scrapCode);
			System.out.println("===========================");	
		}
	}
}%>