package rentcar.dto;

import java.util.Date;

public class RentcarDTO {
	
	private int carCd;				
	private String carNm;		
	private String classification;		
	private int rentPrice;		
	private String brandNm;		
	private String imgNm;		
	private String info;
	private Date enrollDt;
	
	public int getCarCd() {
		return carCd;
	}
	public void setCarCd(int carCd) {
		this.carCd = carCd;
	}
	public String getCarNm() {
		return carNm;
	}
	public void setCarNm(String carNm) {
		this.carNm = carNm;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public int getRentPrice() {
		return rentPrice;
	}
	public void setRentPrice(int rentPrice) {
		this.rentPrice = rentPrice;
	}
	public String getBrandNm() {
		return brandNm;
	}
	public void setBrandNm(String brandNm) {
		this.brandNm = brandNm;
	}
	public String getImgNm() {
		return imgNm;
	}
	public void setImgNm(String imgNm) {
		this.imgNm = imgNm;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}

}
