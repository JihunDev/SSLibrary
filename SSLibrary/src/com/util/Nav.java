package com.util;

public class Nav {
	public static String home= "<a href='main.do'>HOME</a>";
	public static String register= home+" > <a href='register.do'>REGISTER</a>";
	public static String book=home+" > <a href='bookmain.do'>자료실</a>";
	public static String bookdetail =book+" > 책 정보";
	public static String bookregister = book+" > 책 등록";
	
	// 수정부분
		public static String seat=home+" > <a href='seatmain.do'>열람</a>";
}
