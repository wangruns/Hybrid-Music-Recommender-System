package top.wangruns.trackstacking.algorithm;

public class Similarity {

	public static float calculateSimilarity(Float[] floats, Float[] floats2) {
		// TODO Auto-generated method stub
		float similarity=0f;
		int len=floats.length;
		for(int i=0;i<len;i++) {
			similarity+=Math.pow(floats[i]-floats2[i], 2);
		}
		similarity/=len;
		
		return similarity;
	}

}
