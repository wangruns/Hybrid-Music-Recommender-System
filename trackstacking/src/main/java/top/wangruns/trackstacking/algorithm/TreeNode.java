package top.wangruns.trackstacking.algorithm;

public class TreeNode {
	public float val;
	int id;
	TreeNode left;
	TreeNode right;
	
	TreeNode(){}
	
	public TreeNode(int id,float similarity){
		this.id=id;
		this.val=similarity;
	}

}
