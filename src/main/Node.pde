class Node<T>{
    public T value; 
    Node next; Node prev; 
    
    public Node(T value){
        this.value = value; 
    }

    public  Node(){
        this.value = null; 
    }

    public void setNext(Node newRef){
        this.next = newRef; 
    }

    public Node getNext(){
        return this.next; 
    }

    public void setPrev(Node newPrev){
        this.prev = newPrev; 
    }

    public Node getPrev(){
        return this.prev; 
    }


}