
import Foundation

class LinkedListNode<T> {
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
}

extension LinkedListNode: Equatable where T: Equatable {
    static func == (lhs: LinkedListNode<T>, rhs: LinkedListNode<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
