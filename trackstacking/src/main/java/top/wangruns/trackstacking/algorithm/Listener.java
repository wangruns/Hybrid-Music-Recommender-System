package top.wangruns.trackstacking.algorithm;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import top.wangruns.trackstacking.utils.Static;

public class Listener {
	private Timer timer;
	private TimerTask timerTask;
	
	public Listener() {}
	
	public Listener(TimerTask timerTask) {
		this.timerTask=timerTask;
	}
	
	/**
	 * 执行监听任务
	 * e.g. listen(6,0,0,1000,true);//从明天早上6点开始1s执行一次
	 * @param startHour
	 * 任务开始的时间：时(24 hour)
	 * @param startMinute
	 * 任务开始的时间：分(60 minute)
	 * @param startSecond
	 * 任务开始的时间：秒(60 second)
	 * @param period
	 * 任务的间隔周期
	 * @param isStartTomorrow
	 * 是否从明天开始执行第一次。若为false，设定的时间在当前的系统时间前面的话，会立即执行第一次
	 */
	public void listen(int startHour,int startMinute,int startSecond,long period,boolean isStartTomorrow) {
		timer=new Timer();
		Calendar calendar = Calendar.getInstance();  
		calendar.set(Calendar.HOUR_OF_DAY, startHour);
		calendar.set(Calendar.MINUTE, startMinute);
		calendar.set(Calendar.SECOND, startSecond); 
		if(isStartTomorrow) {
			//从明天早上开始每天执行第一次任务
			calendar.add(Calendar.DAY_OF_MONTH, 1);
		}
		Date date = calendar.getTime();  
        timer.schedule(timerTask, date, period);
	}

}
