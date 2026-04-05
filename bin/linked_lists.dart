import '../linked_queue.dart';

void main(){
  final newQueue = LinkedQueue<int>();
  newQueue.enqueue(1);
  newQueue.enqueue(2);
  newQueue.enqueue(3);

  print(newQueue.dequeue());
  print(newQueue.dequeue());
}
