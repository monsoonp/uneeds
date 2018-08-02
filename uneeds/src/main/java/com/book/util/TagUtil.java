package com.book.util;

public class TagUtil {

	public static int getDiscount(int price, int discount) {
		// 할인율 구하기
		int i = (price - discount) * 100 / price;
		return i;
	}

}
