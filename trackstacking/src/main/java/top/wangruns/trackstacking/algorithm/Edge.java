package top.wangruns.trackstacking.algorithm;

public class Edge<S, D> {
	private S sourceNode;
	private D destinateNode;
	private int weight;

	public Edge() {}

	public Edge(S sourceNode,D destinateNode,int weight) {
		this.sourceNode=sourceNode;
		this.destinateNode=destinateNode;
		this.weight=weight;
	}
	
	public Edge(S sourceNode,D destinateNode) {
		this.sourceNode=sourceNode;
		this.destinateNode=destinateNode;
	}

	public S getSourceNode() {
		return sourceNode;
	}

	public void setSourceNode(S sourceNode) {
		this.sourceNode = sourceNode;
	}

	public D getDestinateNode() {
		return destinateNode;
	}

	public void setDestinateNode(D destinateNode) {
		this.destinateNode = destinateNode;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	

}
