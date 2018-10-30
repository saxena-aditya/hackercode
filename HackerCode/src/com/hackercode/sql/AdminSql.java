package com.hackercode.sql;

public interface AdminSql {
	//public static final String GET_ADMIN = "SELECT CASE WHEN EXISTS ("+
	//	    "SELECT password from users where username=?) THEN 'True' ELSE 'False' END";
	
	public static final String FIND_USER_EXIST = "SELECT CASE WHEN EXISTS ("+
			"SELECT * FROM users WHERE username=?) THEN 'True' ELSE 'False' END";
	
	public static final String GET_USER_TYPE = "SELECT CASE WHEN EXISTS ("+
			"SELECT usertype FROM users WHERE username=?) THEN 'True' ELSE 'False' END";
	
	//public static final String GET_USER_ID = "SELECT CASE WHEN EXISTS ("+
	//		"SELECT * FROM users WHERE username=? and password=?) THEN 'True' ELSE 'False' END";
	
	public static final String GET_USER = "SELECT * FROM users WHERE userName=? and password=?";
	
	public static final String GET_USER_BY_ID = "SELECT * FROM users WHERE u_id=?";
	
	//public static final String UPADTE_LAST_LOGIN = "SELECT CASE WHEN EXISTS ("+
	//		"SELECT * FROM users WHERE username=? and password=?) THEN 'True' ELSE 'False' END";

	public static final String REGISTER_NEW_USER ="INSERT INTO users (username, password, usertype) values(?,?,?)";
	
}
