package rentcar.dto;

import java.sql.Date;

public class ReservationDTO {
	
	private long reserveCd;	
	private Date reserveDt;
	private String startDt;
	private int period;	
	private int carCd;
	private String memberId;
	
	public long getReserveCd() {
		return reserveCd;
	}
	public void setReserveCd(long reserveCd) {
		this.reserveCd = reserveCd;
	}
	public Date getReserveDt() {
		return reserveDt;
	}
	public void setReserveDt(Date reserveDt) {
		this.reserveDt = reserveDt;
	}
	public String getStartDt() {
		return startDt;
	}
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public int getCarCd() {
		return carCd;
	}
	public void setCarCd(int carCd) {
		this.carCd = carCd;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
}
