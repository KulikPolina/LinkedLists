import 'linked_lists.dart';

class LinkedQueue<T> {
  LinkedList<T> _list = LinkedList<T>();
  final int? _maxSize;
  int _currentSize = 0;
  

  LinkedQueue({int? maxSize}) : _maxSize = maxSize;

  void enqueue(T value) {
    if (_maxSize != null && _currentSize >= _maxSize!) {
      throw StateError("Queue Overflow: Cannot add to a full queue.");
    }
    _list.addLast(value);
    _currentSize++;
  }

  T dequeue() {
    if (isEmpty) {
      throw StateError("Cannot dequeue from an empty queue");
    }
    _currentSize--;
    return _list.removeFirst()!;
  }

  T? get peek => _list.head?.value;

  bool get isEmpty => _list.head == null;

  int get length => _list.length;

  bool get isFull => _maxSize != null && length >= _maxSize!;

  void printQueue() {
    _list.printList();
  }
}
