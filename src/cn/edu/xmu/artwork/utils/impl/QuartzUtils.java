package cn.edu.xmu.artwork.utils.impl;

import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.xmu.artwork.service.IAuctionService;
import cn.edu.xmu.artwork.utils.IQuartzUtils;

/**
 * 利用quartz实现任务的定时调度类
 * @author asus1
 *
 */
public class QuartzUtils implements IQuartzUtils {

	@Autowired
	private IAuctionService auctionService;
	
	/**
	 * 定时调度任务方法
	 * @author asus1
	 */
	@Override
	public void work() {
		
		System.out.println("任务调度测试");
		
		try {
			auctionService.createDailyAuctionOrder();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
