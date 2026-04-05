import 'package:test/test.dart';

import '../linked_queue.dart';

void main() {
  group('LinkedQueue Standard Operations', () {
    test('enqueue adds items in correct order (FIFO)', () {
      final queue = LinkedQueue<int>();
      queue.enqueue(10);
      queue.enqueue(20);
      queue.enqueue(30);

      expect(queue.dequeue(), equals(10));
      expect(queue.dequeue(), equals(20));
      expect(queue.dequeue(), equals(30));
    });

    test('isEmpty returns true only when queue has no items', () {
      final queue = LinkedQueue<String>();
      expect(queue.isEmpty, isTrue);

      queue.enqueue("Hello");
      expect(queue.isEmpty, isFalse);

      queue.dequeue();
      expect(queue.isEmpty, isTrue);
    });
  });

  group('LinkedQueue Edge Cases', () {
    test('dequeue on empty queue throws StateError (Underflow)', () {
      final queue = LinkedQueue<double>();
      expect(() => queue.dequeue(), throwsA(isA<StateError>()));
    });

    test('enqueue beyond maxCapacity throws StateError (Overflow)', () {
      final queue = LinkedQueue<int>(maxSize: 2);
      queue.enqueue(1);
      queue.enqueue(2);
      
      expect(() => queue.enqueue(3), throwsA(isA<StateError>()));
    });

    test('Single element deletion correctly resets head and tail', () {
      final queue = LinkedQueue<int>();
      queue.enqueue(100);
      queue.dequeue();

      queue.enqueue(200);
      expect(queue.dequeue(), equals(200));
      expect(queue.isEmpty, isTrue);
    });
  });
}
