package top.wangruns.trackstacking.algorithm;

public class Similarity {

	public static float calculateSimilarity(float[] fs, float[] fs2) {
		// TODO Auto-generated method stub
		float similarity=0f;
		int len=fs.length;
		for(int i=0;i<len;i++) {
			similarity+=Math.pow(fs[i]-fs2[i], 2);
		}
		similarity/=len;
		
		return similarity;
	}

}
