package com.athttt.constant;



public class SystemConstant {
    public static final String WHERE_ONE_EQUALS_ONE = "\nWHERE 1 = 1";
    public static final String BUILDING_GROUP_BY = "\nGROUP BY b.id";
    public static final String LIKE_OPERATOR = " LIKE ";
    public static final String EQUAL_OPERATOR = " = ";
    public static final String AND_STATEMENT = "\nAND ";
    public static final String BUILDING_ALIAS = "b.";
    public static final String EMPTY_STRING = "";
    public static final Integer PAGE_SIZE = 12; 
    
    
	public static final int ACTIVE_STATUS = 1;
	public static final int INACTIVE_STATUS = 0;
	
	//public static final long ACCESS_TOKEN_VALIDITY_SECONDS = 3600000;//1h
	public static final long ACCESS_TOKEN_VALIDITY_SECONDS = 30000;
	public static final String SIGNING_KEY = "laptrinhjavaweb";
	public static final String TOKEN_PREFIX = "Bearer ";
	public static final String HEADER_STRING = "Authorization";
	public static final String AUTHORITIES_KEY = "scopes";
}
