package com.athttt.utils;

public class VigenereCipher {	//Mã hóa bằng thuật toán vigenere
	public static String encrypt(String text, final String key) {
		String res = "";
		for (int i = 0; i < text.length(); i++) {
			res += (((int) text.charAt(i) + (int) key.charAt(i % key.length())) + "-");
		}
		return res.substring(0, res.length() - 1);
	}

	public static String decrypt(String text, final String key) {
		String res = "";
		String[] eachNum = text.split("-");
		for (int i = 0; i < eachNum.length; i++) {
			res += (char) (Integer.valueOf(eachNum[i]) - (int) key.charAt(i % key.length()));
		}
		return res;
	}
}