package top.wangruns.trackstacking.utils;

import java.util.Random;

public class OneDayOneWord {
	
	/**
	 * 从单词数组中随机产生一个单词
	 * @param wordArray
	 * 单词数组
	 * @return
	 * 若数组单词为null，则返回" "
	 */
	public static String getOneDayOneWord(String []wordArray) {
		if(wordArray==null) {
			return " ";
		}
		Random random=new Random();
		String oneDayOneWord=wordArray[random.nextInt(wordArray.length)];
		return oneDayOneWord;
	}

}
