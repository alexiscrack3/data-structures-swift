
import Foundation

struct Stack<T> where T: Equatable {
    typealias Node = SinglyLinkedListNode<T>
    
    private var top: Node?
    private(set) var count: Int = 0

    init(values: T...) {
        for value in values {
            push(value: value)
        }
    }
    
    mutating func clear() {
        top = nil
        count = 0
    }
    
    func contains(value: T) -> Bool {
        var current = top
        while current != nil {
            if current?.value == value {
                return true
            }
            current = current?.next
        }
        return false
    }
    
    func isEmpty() -> Bool {
        return top == nil
    }
    
    func peek() -> T? {
        return top?.value
    }
    
    mutating func pop() -> T? {
        let node = top
        top = top?.next
        count -= 1
        return node?.value
    }
    
    mutating func push(value: T) {
        let node = Node(value)
        if top == nil {
            top = node
        } else {
            node.next = top
            top = node
        }
        count += 1
    }
}
