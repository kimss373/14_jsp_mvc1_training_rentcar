package rentcar.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import rentcar.dto.MemberDTO;
import rentcar.dto.RentcarDTO;
import rentcar.dto.ReservationDTO;

public class RentcarDAO {
	
	private RentcarDAO() {}
	private static RentcarDAO instance = new RentcarDAO();
	public static RentcarDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public void getConnection() {
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/RENTCAR?serverTimezone=UTC&useSSL=false", "root", "1234");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void getClose() {
		if (rs != null)    {try {rs.close();}    catch (SQLException e) {}}
		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {}}
		if (conn != null)  {try {conn.close();}  catch (SQLException e) {}}
	}
	
	
	public boolean register(MemberDTO memberDTO) {

		boolean isRegister = false;
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND PASSWD = ?");
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, memberDTO.getPasswd());
			rs = pstmt.executeQuery();

			if (!rs.next()) {
				
				pstmt = conn.prepareStatement("INSERT INTO MEMBER(MEMBER_ID , PASSWD , EMAIL , CONTACT , AGE , INFO) VALUES(? , ? , ? , ? , ? , ?)");
				pstmt.setString(1, memberDTO.getMemberId());
				pstmt.setString(2, memberDTO.getPasswd());
				pstmt.setString(3, memberDTO.getEmail());
				pstmt.setString(4, memberDTO.getContact());
				pstmt.setInt(5, memberDTO.getAge());
				pstmt.setString(6, memberDTO.getInfo());
				pstmt.executeUpdate();
				isRegister = true;
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isRegister;
		
	}
	
	
	public boolean login(MemberDTO memberDTO) {
		
		boolean isLogin = false;
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM MEMBER WHERE MEMBER_ID = ? AND PASSWD = ?");
			pstmt.setString(1, memberDTO.getMemberId());
			pstmt.setString(2, memberDTO.getPasswd());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				isLogin = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return isLogin;
		
	}
	
	
	public RentcarDTO getRentcarDetail(int carCd) {
		
		RentcarDTO rentcarDTO = new RentcarDTO();
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM RENTCAR WHERE CAR_CD = ?");
			pstmt.setInt(1, carCd);		
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rentcarDTO.setCarCd(rs.getInt("CAR_CD"));
				rentcarDTO.setCarNm(rs.getString("CAR_NM"));
				rentcarDTO.setClassification(rs.getString("ClASSIFICATION"));
				rentcarDTO.setRentPrice(rs.getInt("RENT_PRICE"));
				rentcarDTO.setBrandNm(rs.getString("BRAND_NM"));
				rentcarDTO.setImgNm(rs.getString("IMG_NM"));
				rentcarDTO.setInfo(rs.getString("INFO"));
				rentcarDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return rentcarDTO;
		
	}
	
	
	public void insertReservation(ReservationDTO reservationDTO) {
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("INSERT INTO RESERVATION(START_DT,PERIOD,CAR_CD,MEMBER_ID) VALUES(?,?,?,?)");
			pstmt.setString(1, reservationDTO.getStartDt());
			pstmt.setInt(2, reservationDTO.getPeriod());
			pstmt.setInt(3, reservationDTO.getCarCd());
			pstmt.setString(4, reservationDTO.getMemberId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
	}
	
	
	public ArrayList<HashMap<String,Object>> getReservationList() {
		
		ArrayList<HashMap<String,Object>> reservationList = new ArrayList<HashMap<String,Object>>();
		
		try {
			
			getConnection();
			
			
			String sql = "SELECT * FROM RESERVATION R ";
				   sql += "INNER JOIN MEMBER M ";
				   sql += "ON R.MEMBER_ID = M.MEMBER_ID ";
				   sql += "INNER JOIN RENTCAR C ";
				   sql += "ON R.CAR_CD = C.CAR_CD ";
				   sql += "ORDER BY R.RESERVE_DT DESC";
						   
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				HashMap<String,Object> temp = new HashMap<String, Object>();
				
				temp.put("carCd", rs.getInt("CAR_CD"));
				temp.put("imgNm", rs.getString("IMG_NM"));
				temp.put("carNm", rs.getString("CAR_NM"));
				temp.put("brandNm", rs.getString("BRAND_NM"));
				temp.put("classification", rs.getString("CLASSIFICATION"));
				temp.put("memberId", rs.getString("MEMBER_ID"));
				temp.put("email", rs.getString("EMAIL"));
				temp.put("contact", rs.getString("CONTACT"));
				temp.put("rentPrice", rs.getInt("RENT_PRICE"));
				temp.put("reserveCd", rs.getLong("RESERVE_CD"));
				temp.put("reserveDt", rs.getDate("RESERVE_DT"));
				temp.put("startDt", rs.getString("START_DT"));
				temp.put("period", rs.getInt("PERIOD"));
				reservationList.add(temp);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return reservationList;
		
	}
	
	
	public ArrayList<HashMap<String,Object>> getMyReservationList(String memberId) {
		
		ArrayList<HashMap<String,Object>> myReservationList = new ArrayList<HashMap<String,Object>>();
		
		try {
			
			getConnection();
			
			
			String sql = "SELECT * FROM RESERVATION R ";
				   sql += "INNER JOIN MEMBER M ";
				   sql += "ON R.MEMBER_ID = M.MEMBER_ID ";
				   sql += "INNER JOIN RENTCAR C ";
				   sql += "ON R.CAR_CD = C.CAR_CD ";
				   sql += "AND M.MEMBER_ID = ?";
				   sql += "ORDER BY R.RESERVE_DT DESC";
				   
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				HashMap<String,Object> temp = new HashMap<String, Object>();
				
				temp.put("carCd", rs.getInt("CAR_CD"));
				temp.put("imgNm", rs.getString("IMG_NM"));
				temp.put("carNm", rs.getString("CAR_NM"));
				temp.put("brandNm", rs.getString("BRAND_NM"));
				temp.put("classification", rs.getString("CLASSIFICATION"));
				temp.put("memberId", rs.getString("MEMBER_ID"));
				temp.put("email", rs.getString("EMAIL"));
				temp.put("contact", rs.getString("CONTACT"));
				temp.put("rentPrice", rs.getInt("RENT_PRICE"));
				temp.put("reserveCd", rs.getLong("RESERVE_CD"));
				temp.put("reserveDt", rs.getDate("RESERVE_DT"));
				temp.put("startDt", rs.getString("START_DT"));
				temp.put("period", rs.getInt("PERIOD"));
				myReservationList.add(temp);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return myReservationList;
		
	}
	
	
	public ArrayList<RentcarDTO> getRentCarList() {
		
		ArrayList<RentcarDTO> rentcarList = new ArrayList<>();
		
		try {
			
			getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM RENTCAR");
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				RentcarDTO rentcarDTO = new RentcarDTO();
				rentcarDTO.setCarCd(rs.getInt("CAR_CD"));
				rentcarDTO.setCarNm(rs.getString("CAR_NM"));
				rentcarDTO.setClassification(rs.getString("ClASSIFICATION"));
				rentcarDTO.setRentPrice(rs.getInt("RENT_PRICE"));
				rentcarDTO.setBrandNm(rs.getString("BRAND_NM"));
				rentcarDTO.setImgNm(rs.getString("IMG_NM"));
				rentcarDTO.setInfo(rs.getString("INFO"));
				rentcarDTO.setEnrollDt(rs.getDate("ENROLL_DT"));
				
				rentcarList.add(rentcarDTO);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getClose();
		}
		
		return rentcarList;
		
	}
	

}
