package top.wangruns.trackstacking.algorithm;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class W2WNetwork {

	/**
	 * 获取单词节点在w2wNetwork矩阵中横轴的下标
	 * @param node
	 * 单词节点
	 * @param wordSet
	 * 单词节点集合
	 * @return
	 */
	public static int getW2WIndex(String node, Set<String> wordSet) {
		Iterator<String> iterator = wordSet.iterator();
		int index = 0;
		while (iterator.hasNext()) {
			if (iterator.next().equals(node)) {
				break;
			}
			index++;
		}
		return index;
	}

	/**
	 * 获取w2wNetwork矩阵中横轴对应下标的单词节点
	 * @param index
	 * @return
	 * 单词节点（单词）
	 */
	public static String getW2WNode(int index, Set<String> wordSet) {
		Iterator<String> iterator = wordSet.iterator();
		int i = 0;
		String node=null;
		while (iterator.hasNext()) {
			if(i==index) {
				node=iterator.next();
				break;
			}
			i++;
		}
		return node;
	}

	/**
	 * 构建word 2 word Network
	 * @param wordSet
	 * 单词集合
	 * @param wordSb
	 * 单词字符串
	 * @return
	 * word,[weights]数组下标对应wordSet迭代器访问的顺序
	 */
	public static Map<String, int[]> constructW2WN(final Set<String> wordSet, StringBuilder wordSb) {
		Map<String,int []> w2wNetwork=new HashMap<String, int[]>();
		String wordStr=wordSb.toString();
		//System.out.println("wordStr: "+wordStr);
		Iterator<String> curIterator=wordSet.iterator();
		int setSize=wordSet.size();
		while(curIterator.hasNext()) {
			//当前单词节点
			String curWord=curIterator.next();
			int curWordLen=curWord.length();
			//邻接单词节点权重数组,0表示节点没有连接
			int weightArray[]=new int[setSize];
			int arrayIndex=0;
			//对于每一个单词，构建其邻接数组
			Iterator<String> innerIterator=wordSet.iterator();
			while(innerIterator.hasNext()) {
				String word=innerIterator.next();
				//排除当前单词自己
				if(!word.equals(curWord)) {
					//寻找curWord和word在一定上下文内合作的次数
					int cnt=0;
					int indexOfCurWord=0;
					while(true) {
					    indexOfCurWord=wordStr.indexOf(curWord,indexOfCurWord);
					    //找不到了
					    if(indexOfCurWord==-1) {
					    	break;
					    }
						int wordLen=word.length();
						//当前单词curWord和前一个合作
						if((indexOfCurWord-wordLen>=0) && wordStr.substring(indexOfCurWord-wordLen, indexOfCurWord).equals(word)) {
							cnt++;
						}
						//当前单词curWord和后一个合作
						if((indexOfCurWord+curWordLen+wordLen<=wordStr.length() ) && wordStr.substring(indexOfCurWord+curWordLen, indexOfCurWord+curWordLen+wordLen).equals(word)) {
							cnt++;
						}
						indexOfCurWord+=curWordLen;
					}
					weightArray[arrayIndex]=cnt;
				}
				arrayIndex++;
				
			}//End While
			w2wNetwork.put(curWord, weightArray);
			
		}
		
		return w2wNetwork;
	}


}
