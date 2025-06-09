void main(){
  final myList= LinkedList<String>();

  myList.addFirst("hey");
  myList.addLast("hello");
  myList.addFirst("hi");
  myList.printList();

  final myListWithNums = LinkedListWithOnlyNums<int>();

  myListWithNums.addFirst(1);
  myListWithNums.addLast(2);
  myListWithNums.addFirst(3);
  myListWithNums.printList();

}

class Node<T> {
  T value;
  Node<T>? next;
  Node(this.value);
}

mixin MethodsForLinkedLists<T> {
  Node<T>? head;
  void addFirst(T value){
    final newNode = Node(value);
    newNode.next = head;
    head = newNode;
  }

  void addLast(T value){
    final newNode = Node(value);
    if(head == null){
      head = newNode;
    }
    else{
      Node<T>? current = head;
      while(current!.next != null){
        current = current.next;
      }
      current.next = newNode;
    }
  }

  T? removeFirst(){
    if(head == null){
      return null;
    }
    else{
      final value = head!.value;
      head = head!.next;
      return value;
    }
  }

  int get length {
    int count = 0;
    Node<T>? current = head;
    while(current!.next != null){
      count ++;
      current = current.next;
    }
    return count;
  }

  bool contains (T value){
    Node<T>? current = head;
    while (current != null){
      if(current.value == value){
        return true;
      }
      current = current.next;
    }
    return false;
  }

  void printList(){
    Node<T>? current = head;
    while(current != null){
      print(current.value);
      current = current.next;
    }
  }
}

class LinkedList<T> with MethodsForLinkedLists{}

class LinkedListWithOnlyNums<T extends num> with MethodsForLinkedLists{}