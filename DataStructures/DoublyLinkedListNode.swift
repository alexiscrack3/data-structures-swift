
import Foundation

class DoublyLinkedListNode<T>: LinkedListNode<T> {
    var next: DoublyLinkedListNode<T>?
    weak var previous: DoublyLinkedListNode<T>?
}
