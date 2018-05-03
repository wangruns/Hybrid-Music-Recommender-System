package top.wangruns.trackstacking.utils;

public class Static {
	/**
	 * 用于记录，两张个性化推荐列表，isFromA为true表示，从表A中读取数据;
	 * 否则从表B中读取
	 */
	public static volatile boolean isFromA=true;
	
	/**
	 * 更新个性化推荐列表的时间间隔(这里每天更新一次)
	 */
	public static final long PERIOD_DAY = 24 * 60 * 60 * 1000; 
	
	/**
	 * 更新开始的时间：时
	 */
	public static final int START_HOUR = 6; 
	
	/**
	 * 更新开始的时间：分
	 */
	public static final int START_MINUTE = 0; 
	
	/**
	 * 更新开始的时间：秒
	 */
	public static final int START_SECOND = 0; 
	
	/**
	 * 更新是否从明天开始
	 */
	public static final boolean IS_START_TOMORROW = true;
	
	/**
	 * 是否第一次初始化
	 */
	public static boolean isFirtTimeInit=true;
	
}
