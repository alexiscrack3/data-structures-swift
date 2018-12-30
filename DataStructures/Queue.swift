
import Foundation

struct Queue<T> where T: Equatable {
    typealias Node = SinglyLinkedListNode<T>
    
    private var front: Node?
    private var back: Node?
    private(set) var count: Int = 0
    
    init(values: T...) {
        for value in values {
            enqueue(value: value)
        }
    }
    
    mutating func clear() {
        front = nil
        back = nil
        count = 0
    }
    
    func contains(value: T) -> Bool {
        var current = front
        while current != nil {
            if current?.value == value {
                return true
            }
            current = current?.next
        }
        return false
    }
    
    mutating func dequeue() -> T? {
        let node = front
        if front == back {
            front = nil
            back = nil
        } else {
            front = front?.next
        }
        count -= 1
        return node?.value
    }
    
    mutating func enqueue(value: T) {
        let node = Node(value)
        if front == nil && back == nil {
            front = node
        } else {
            back?.next = node
        }
        back = node
        count += 1
    }
    
    func isEmpty() -> Bool {
        return front == nil && back == nil
    }
    
    func peek() -> T? {
        return front?.value
    }
}
