package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class UserData {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(length = 10)
	private int userId;
	@Column(length = 100)
	private String userName;
	@Column(length = 100)
	private String userEmail;
	@Column(length = 16)
	private String userPassword;
	@Column(length = 12)
	private String userPhone;
	@Column(length = 1500)
	private String userPic;
	@Column(length = 1500)
	private String userAddress;
	@Column(length = 1500)
	private String userType;
	
	public UserData(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress ,String userType) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType=userType;
	}
	public UserData(String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress ,String userType) {
		super();
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType=userType;
	}
	
	public UserData() {
		
	}
	
	public String getUserTyope() {
		return userType;
	}
	public void setUserTyope(String userType) {
		this.userType = userType;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserPic() {
		return userPic;
	}
	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress
				+ "]";
	}
	
	

}
