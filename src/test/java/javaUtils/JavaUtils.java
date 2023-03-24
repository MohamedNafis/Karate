package javaUtils;

import java.time.Instant;

public class JavaUtils {
	
	public static String getMyName() {
		return "Mohammed Nafis";
	}
	
	public static String getDate() {
		return Instant.now().toString();
	}

}