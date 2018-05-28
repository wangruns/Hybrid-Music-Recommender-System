package top.wangruns.trackstacking.algorithm;

public class Similarity {

	public static float calculateSimilarity(float[] curRating, float[] otherRating) {
		// TODO Auto-generated method stub
		float similarity=0f;
		int len=curRating.length;
		int cnt=0;
		for(int i=0;i<len;i++) {
			//根据被当前用户“评分”了的项目来计算相似度，由于浮点数不能==比较，这里用0.01f表示0.0f
			if(curRating[i]>0.01f) {
				similarity+=Math.pow(curRating[i]-otherRating[i], 2);
				cnt++;
			}
		}
		similarity/=(cnt>0?cnt:1);
		
		return similarity;
	}

}
