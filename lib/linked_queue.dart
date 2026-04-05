import 'linked_lists.dart';

/// A dynamic, First-In-First-Out (FIFO) data structure.
///
/// The [LinkedQueue] uses a [LinkedList] internally to manage its elements.
/// It supports bounded capacities if a maximum size is provided.
class LinkedQueue<T> {
  final LinkedList<T> _list = LinkedList<T>();
  final int? _maxSize;
  int _currentSize = 0;

  /// Creates a new [LinkedQueue].
  ///
  /// If [maxSize] is provided, the queue becomes bounded and will
  /// throw a [StateError] if it exceeds this capacity. Otherwise, it 
  /// can grow infinitely.
  LinkedQueue({int? maxSize}) : _maxSize = maxSize;

  /// Adds a new [value] to the back of the queue.
  ///
  /// Throws a [StateError] if the queue has a maximum capacity and is 
  /// currently full.
  void enqueue(T value) {
    if (_maxSize != null && _currentSize >= _maxSize!) {
      throw StateError("Queue Overflow: Cannot add to a full queue.");
    }
    _list.addLast(value);
    _currentSize++;
  }

  /// Removes and returns the element at the front of the queue.
  ///
  /// Throws a [StateError] if called while the queue is empty.
  T dequeue() {
    if (isEmpty) {
      throw StateError("Cannot dequeue from an empty queue");
    }
    _currentSize--;
    return _list.removeFirst()!;
  }

  /// Returns the element at the front of the queue without removing it.
  ///
  /// Returns `null` if the queue is currently empty.
  T? get peek => _list.head?.value;

  /// Whether the queue currently contains no elements.
  bool get isEmpty => _list.head == null;

  /// The current number of elements in the queue.
  ///
  /// This operates in O(1) constant time because the size is tracked internally.
  int get length => _currentSize;

  /// Whether the queue has reached its maximum capacity.
  /// 
  /// Always returns `false` if no maximum capacity was set.
  bool get isFull => _maxSize != null && _currentSize >= _maxSize!;

  /// Prints all elements currently in the queue, from front to back.
  void printQueue() {
    _list.printList();
  }
}
