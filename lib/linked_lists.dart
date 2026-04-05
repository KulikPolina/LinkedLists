import 'dart:collection';

/// A single element within a linked list.
///
/// A [Node] contains the actual [value] being stored, as well as a 
/// [next] pointer that references the subsequent node in the chain.
class Node<T> {
  /// The data stored in this node.
  T value;

  /// A reference to the next node in the list. 
  /// 
  /// If this is the last node, [next] will be `null`.
  Node<T>? next;

  /// Creates a new node containing the given [value].
  Node(this.value);
}

/// A mixin containing the core logic and state for a singly linked list.
mixin MethodsForLinkedLists<T> {
  /// The first node in the list.
  Node<T>? head;

  /// The last node in the list.
  Node<T>? tail;
  
  int _length = 0;

  /// Inserts a new [value] at the very beginning of the list.
  ///
  /// This operation takes **O(1)** time.
  void addFirst(T value) {
    final newNode = Node(value);
    newNode.next = head;
    head = newNode;
    
    // If the list was empty, the new node is also the tail.
    if (tail == null) {
      tail = newNode;
    }
    _length++;
  }

  /// Appends a new [value] to the very end of the list.
  ///
  /// Because we track the [tail] pointer, this operation takes **O(1)** time.
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

  /// Removes and returns the value at the beginning of the list.
  ///
  /// Returns `null` if the list is currently empty. 
  /// This operation takes **O(1)** time.
  T? removeFirst() {
    if (head == null) {
      return null;
    } else {
      final value = head!.value;
      head = head!.next;
      
      // If we just removed the last item, clear the tail pointer as well.
      if (head == null) {
        tail = null;
      }
      _length--;
      return value;
    }
  }

  /// The total number of elements currently in the list.
  int get length => _length;

  /// Checks if the provided [value] exists within the list.
  ///
  /// This requires traversing the list from the beginning, meaning it 
  /// takes **O(n)** time in the worst case.
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

  /// Prints each element of the list to the console, one by one.
  void printList() {
    Node<T>? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

/// An iterator that allows traversing through a linked list using a `for-in` loop.
class IteratorForLinkedLists<T> implements Iterator<T> {
  Node<T>? _currentNode;
  Node<T>? _start;
  T? _currentValue;

  /// Creates an iterator starting at the given [_start] node.
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

/// A standard, generic singly linked list.
///
/// This class combines [MethodsForLinkedLists] for its core operations 
/// and [IterableMixin] to support standard Dart collection methods 
/// (like `.map`, `.where`, etc.).
class LinkedList<T> with MethodsForLinkedLists<T>, IterableMixin<T> {
  @override
  Iterator<T> get iterator => IteratorForLinkedLists<T>(head);
}

/// A specialized linked list that only accepts numeric types.
///
/// This list restricts its generic type [T] to extend `num` 
/// (meaning only `int` or `double` are allowed).
class LinkedListWithOnlyNums<T extends num>
    with MethodsForLinkedLists<T>, IterableMixin<T> {
  @override
  Iterator<T> get iterator => IteratorForLinkedLists<T>(head);
}
