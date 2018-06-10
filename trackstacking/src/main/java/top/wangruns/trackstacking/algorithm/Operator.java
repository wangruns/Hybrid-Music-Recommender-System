package top.wangruns.trackstacking.algorithm;

/**
 * 这里主要进行一些类似操作符的重写，模拟向量运算
 * @author hadwin
 *
 */
public class Operator {

	/**
	 * 将右边的数组值分别赋值给左边数组，向量的赋值符	=
	 * @param leftV
	 * @param rightV
	 */
	public static void assign(float[] leftV, float[] rightV) {
		int len=leftV.length;
		for(int i=0;i<len;i++) {
			leftV[i]=rightV[i];
		}
	}

	/**
	 * 将右边的数组和左边的实数对应相乘，向量的点乘符	.*
	 * @param realNumber
	 * @param array
	 * @return
	 */
	public static float[] dotTimes(float realNumber, float[] array) {
		int len=array.length;
		float[] res=new float[len];
		for(int i=0;i<len;i++) {
			res[i]=array[i]*realNumber;
		}
		return res;
	}
	
	/**
	 * 将右边的数组和左边的数组对应相乘，向量的点乘符	.*
	 * @param array1
	 * @param array2
	 * @return
	 */
	public static float[] dotTimes(float[] array1, float[] array2) {
		int len=array1.length;
		float[] res=new float[len];
		for(int i=0;i<len;i++) {
			res[i]=array1[i]*array2[i];
		}
		return res;
		
	}

	/**
	 * 将左边的数组和右边的数组对应相减，向量的减符	-
	 * @param array1
	 * @param array2
	 * @return
	 */
	public static float[] dotMinus(float[] array1, float[] array2) {
		int len=array1.length;
		float[] res=new float[len];
		for(int i=0;i<len;i++) {
			res[i]=array1[i] - array2[i];
		}
		return res;
		
	}

	/**
	 * 将右边数组和左边数组对应相乘并累加起来，向量的乘法符	*
	 * @param e1
	 * @param e2
	 * @return
	 */
	public static float times(float[] e1, float[] e2) {
		float res=0;
		int len=e1.length;
		for(int i=0;i<len;i++) {
			res+=e1[i]*e2[2];
		}
		return res;
	}

	/**
	 * 将数组右边的对应先加到数组左边中去
	 * @param sumCurI2BTimesNodeInB
	 * @param dotTimes
	 */
	public static void add(float[] e1, float[] e2) {
		int len=e1.length;
		for(int i=0;i<len;i++) {
			e1[i]+=e2[i];
		}
	}

	/**
	 * 将左边的数组对应除以右边的实数
	 * @param e
	 * @param realNumber
	 * @return
	 */
	public static float[] divide(float[] e, float realNumber) {
		int len=e.length;
		float[] res=new float[len];
		for(int i=0;i<len;i++) {
			res[i]=e[i]/realNumber;
		}
		return res;
	}

}
