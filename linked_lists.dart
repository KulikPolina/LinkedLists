import 'dart:collection';

class Node<T> {
  T value;
  Node<T>? next;
  Node(this.value);
}

mixin MethodsForLinkedLists<T> {
  Node<T>? head;
  Node<T>? tail;
  int _length = 0;

  void addFirst(T value) {
    final newNode = Node(value);
    newNode.next = head;
    head = newNode;
    if (tail == null) {
      tail = newNode;
    }
    _length++;
  }

  void addLast(T value) {
    final newNode = Node(value);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
    _length++;
  }

  T? removeFirst() {
    if (head == null) {
      return null;
    } else {
      final value = head!.value;
      head = head!.next;
      if (head == null) {
        tail = null;
      }
      _length--;
      return value;
    }
  }

  int get length => _length;

  bool contains(T value) {
    Node<T>? current = head;
    while (current != null) {
      if (current.value == value) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  void printList() {
    Node<T>? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

class IteratorForLinkedLists<T> implements Iterator<T> {
  Node<T>? _currentNode;
  Node<T>? _start;
  T? _currentValue;

  IteratorForLinkedLists(this._start) {
    _currentNode = _start;
  }

  @override
  T get current => _currentValue as T;

  @override
  bool moveNext() {
    if (_currentNode == null) return false;

    _currentValue = _currentNode!.value;
    _currentNode = _currentNode!.next;
    return true;
  }
}

class LinkedList<T> with MethodsForLinkedLists<T>, IterableMixin<T> {
  @override
  Iterator<T> get iterator => IteratorForLinkedLists<T>(head);
}

class LinkedListWithOnlyNums<T extends num>
    with MethodsForLinkedLists<T>, IterableMixin<T> {
  @override
  Iterator<T> get iterator => IteratorForLinkedLists<T>(head);
}
