
import Foundation

class LinkedListNode<T: Equatable> {
    
    var value: T
    var next: LinkedListNode<T>?
    
    init(_ value: T) {
        self.value = value
    }
}

extension LinkedListNode: Equatable {
    static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
