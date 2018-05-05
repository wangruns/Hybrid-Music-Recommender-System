package top.wangruns.trackstacking.algorithm;

public class MininumHeap {
	private int curHeapSize;
	private TreeNode[] array;
	private boolean isFirstTime=true;

	public MininumHeap() {
	}

	public MininumHeap(int heapSize) {
		array = new TreeNode[heapSize];
	}

	/**
	 * 向堆添加元素并保持堆的大小不变.
	 * 即当前元素小于最小堆的堆顶的时候，不加入;
	 * 反之，移除堆元素，加入当前元素，并调整堆.
	 * @param treeNode
	 * 需要加入的元素
	 */
	public void addElement(TreeNode treeNode) {
		//如果堆还没有被填满的话，则直接加入
		if(curHeapSize<array.length) {
			array[curHeapSize++]=treeNode;
		}else {
			//刚满的时候，进行建堆
			if(isFirstTime) {
				for(int i=curHeapSize/2-1;i>=0;i--)	shiftdown(array,i,curHeapSize);
				isFirstTime=false;
			}
			//堆已经满了，则需要比较一下
			if(treeNode.val<=array[0].val) {
				//当前元素，比堆顶元素还小，直接抛弃
				return;
			}else {
				//移除替换堆顶元素，调整堆
				array[0]=treeNode;
				shiftdown(array,0,curHeapSize);
			}
		}
		

	}

	private void shiftdown(TreeNode[] array, int position, int len) {
		while(position<=len/2-1){
			int l=2*position+1,r=2*position+2;
			if(r<len&&array[l].val>array[r].val)	l=r;
			if(array[l].val>=array[position].val)	 return;
			swap(array,l,position);
			position=l;//move down
		}
	}

	private void swap(TreeNode[] array, int i, int j) {
		// TODO Auto-generated method stub
		TreeNode temp=array[i];
		array[i]=array[j];
		array[j]=temp;
	}

	/**
	 * 获取堆元素数组
	 * @return
	 */
	public TreeNode[] getArray() {
		return array;
	}

	/**
	 * 获取当前堆的真实大小
	 * @return
	 */
	public int getCurHeapSize() {
		return curHeapSize;
	}
	
}
