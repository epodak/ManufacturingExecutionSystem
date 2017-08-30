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
public class ScrapTest implements Serializable{
	public static String jdbc_connection = "BAF_demo_BF";

	conn conn_BAFCONSULTING = null;

	/* The properties */
	private String lineId;
	private String costCenter;	
	private String platform;
	private String partNumber;
	private String revision;
	private String partDescription;
	private String cost;
	private String commonCode;
	private String uniqueCode;
	private String quantity;
	private String comments;
	private String batchDate;
	private String backFlush;
	private String chargebackCode = "05-16";
	private String scrapCode;
	private String workArea = "PPP";
	private String platformCode = "05";	
	private String username = "mikepavl";

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
}