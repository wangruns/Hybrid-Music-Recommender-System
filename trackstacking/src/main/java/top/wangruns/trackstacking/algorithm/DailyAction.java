package top.wangruns.trackstacking.algorithm;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import top.wangruns.trackstacking.utils.Static;

/**
 * It’s not easy when  you want to make something change, but if it’s easy that everyone can make it.
 */
public class DailyAction implements ApplicationListener<ContextRefreshedEvent>{

	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		System.out.println("###-----Spring 容器加载完毕_-_-----###");
		init();
	}

	private void init() {
		if(Static.isFirtTimeInit) {
			System.out.println("###-----开始Listener_-_-----###");
			Listener listener=new Listener(new UpdateTask());
			//开始执行监听
			listener.listen(Static.START_HOUR, Static.START_MINUTE, 
					Static.START_SECOND, Static.PERIOD_DAY, Static.IS_START_TOMORROW);
		}
		Static.isFirtTimeInit=false;
	}

}
