package top.wangruns.trackstacking.model;

import top.wangruns.trackstacking.utils.MD5Util;

public class User {
	private int userId;
	private String email;
	private String password;
	private String validateCode;

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = MD5Util.string2MD5(password);
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
