class Node {
  Node parent;
  public Node[] childs;
  String val; 
  Node(String s) {
    this.childs = new Node[2];
    this.parent = null;
    this.val = s;
  }

  void hi(String s) {
    this.childs[0] = new Node(s);
  }

  void hd(String s) {
    this.childs[1] = new Node(s);
  }

  void printTree() {
    if (this.childs[0] != null)
      this.childs[0].printTree();

    print(this.val); 

    if (this.childs[1] != null)
      this.childs[1].printTree();
  }

  void calc(Node root) {
    Node p = root; 
    while (p.childs[0].childs[0] != null) {
      p = p.childs[0];
    }

    if (p.val == "+") {
      p.val = String.valueOf(Integer.parseInt(p.childs[0].val) + Integer.parseInt(p.childs[1].val));
    } else if (p.val == "*") {
      p.val = String.valueOf(Integer.parseInt(p.childs[0].val) * Integer.parseInt(p.childs[1].val));
    } else if (p.val == "/") {
      p.val = String.valueOf(Integer.parseInt(p.childs[0].val) / Integer.parseInt(p.childs[1].val));
    } else if (p.val == "-") {
      p.val = String.valueOf(Integer.parseInt(p.childs[0].val) - Integer.parseInt(p.childs[1].val));
    }

    p.childs[0] = null;
    p.childs[1] = null;

 

    this.printTree(); 
    println("");

    if (root.childs[0] != null)
      this.calc(root);
  }
}
class Tree {
  Node root;
  Node lastFree; 
  boolean isFull; 
  int n; 
  Tree() {
    this.isFull = true;
    this.n = 0; 
    this.root = null;
    this.lastFree = null;
  }

  void insert(String s) {
    println("Metiendo " + s ); 
    if (this.root == null ) {
      this.root = new Node(s);
      this.n ++;
    } else if (s == "+"||s == "-"||s == "/"||s == "*") {
      if ((this.n - 1 ) % 2 == 0) {
        Node myNode = new Node(s);

        myNode.childs[0] = this.root;
        this.n ++; 
        this.root = myNode;
      }
    } else {
      if (this.n % 2 == 0) {
        Node newNode = new Node(s); 
        this.root.childs[1] = newNode;
        this.lastFree = this.root; 
        this.n++;
      }
    }
  }

  void printAll() {
    root.printTree();
    println("");
  }

  void calculate() {
    println("Imprimiendo"); 
    this.root.calc(this.root);
    println(""); 
  }
}
