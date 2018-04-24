package top.wangruns.trackstacking.utils;

import com.alibaba.fastjson.JSONObject;

public class ReturnMsg {
	
	/**
	 * 
	 * @param status
	 * 状态码
	 * @param detail
	 * 详情
	 * @return
	 * JSON 格式的字符串
	 */
	public static String msg(int status,String detail) {
		JSONObject jSONObject=new JSONObject();
		jSONObject.put("status", status);
		jSONObject.put("msg", detail);
		
		String res=jSONObject.toJSONString();
		System.out.println(res);
		return res;
//		return jSONObject.toJSONString();
	}

}
