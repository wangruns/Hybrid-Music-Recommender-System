package top.wangruns.trackstacking.utils;

public class Static {
	/**
	 * 用于记录，两张个性化推荐列表，isFromA为true表示，从表A中读取数据;
	 * 否则从表B中读取.
	 * 每天早上6点，两张表交替更新
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
	 * KNN k值
	 * 目前系统用户很少
	 */
	public static final int K = 2;
	
	/**
	 * 给用户推荐歌曲的数量 n值
	 * 歌曲很少
	 */
	public static final int N = 10;
	
	/**
	 * 排行榜的，每日一词
	 */
	public static final String [] RANKING_WORD_ARRAY= {"百尺竿头","步步高升","精益求精",
			"登堂入室","登峰造极","泰山北斗","功成名就","大展鸿图","炉火纯青"};
	
	/**
	 * 我的音乐的，每日一词
	 */
	public static final String [] MY_MUSIC_WORD_ARRAY= {"四面楚歌","余音绕梁","靡靡之音",
			"扣人心弦","高山流水","四面楚歌","曲高和寡","余音袅袅","一唱三叹","四面楚歌","绕梁三日","游鱼出听"};
	
	/**
	 * 搜索结果，每次一词
	 */
	public static final String [] SEARCH_WORD_ARRAY= {"众里寻他","计获事足","望眼欲穿",
			"踏破铁鞋","如愿以偿","东寻西觅","摸索门径","寻踪觅迹"};
	
	
	
}
