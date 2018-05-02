package top.wangruns.trackstacking.dao;

import java.util.List;

import top.wangruns.trackstacking.model.TrendingSong;

public interface RankingPageDao {

	/**
	 * 获取最近一周排行榜列表
	 * @return
	 * 如果没有，则返回null
	 */
	List<TrendingSong> selectRecentWeekRanking();

	/**
	 * 获取最近一个月排行榜列表
	 * @return
	 * 如果没有，则返回null
	 */
	List<TrendingSong> selectRecentMonthRanking();

}
