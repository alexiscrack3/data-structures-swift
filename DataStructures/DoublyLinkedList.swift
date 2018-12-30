
import Foundation

struct DoublyLinkedList<T: Equatable> {
    typealias Node = DoublyLinkedListNode<T>
    
    private var head: Node?
    private var tail: Node?
    private(set) var count: Int = 0
    
    var first: Node? {
        return head
    }
    
    var last: Node? {
        return tail
    }
    
    init(values: T...) {
        for value in values {
            append(value: value)
        }
    }
    
    mutating func append(value: T) {
        let node = Node(value)
        if head == nil && tail == nil {
            head = node
        } else {
            node.previous = tail
            tail?.next = node
        }
        tail = node
        count += 1
    }
    
    mutating func clear() {
        head = nil
        tail = nil
        count = 0
    }
    
    func contains(value: T) -> Bool {
        return find(value: value) != nil
    }
    
    func find(value: T) -> Node? {
        var current = head
        while current != nil {
            if current?.value == value {
                return current
            }
            current = current?.next
        }
        return nil
    }
    
    func findLast(value: T) -> Node? {
        var current = tail
        while current != nil {
            if current?.value == value {
                return current
            }
            current = current?.previous
        }
        return nil
    }
    
    func index(of value: T) -> Int {
        var i = 0
        var current = head
        while current != nil {
            if current?.value == value {
                return i
            }
            current = current?.next
            i += 1
        }
        return -1
    }
    
    func lastIndex(of value: T) -> Int {
        var i = count - 1
        var current = tail
        while current != nil {
            if current?.value == value {
                return i
            }
            current = current?.previous
            i -= 1
        }
        return -1
    }
    
    mutating func prepend(value: T) {
        let node = Node(value)
        head?.previous = node
        node.next = head
        head = node
        count += 1
    }
    
    mutating func remove(value: T) {
        let index = self.index(of: value)
        if index != -1 {
            remove(at: index)
        }
    }
    
    private mutating func remove(at index: Int) {
        if index == 0 {
            tail = head?.next == nil ? nil : tail
            head = head?.next
        } else if index == count - 1 {
            var current = head
            for _ in 1..<count - 1 {
                current = current?.next
            }
            
            tail = current
            tail?.next = nil
        } else {
            var current = head
            for _ in 1..<index {
                current = current?.next
            }
            
            let next = current?.next?.next
            current?.next = current?.next?.next
            next?.previous = current
        }
        count -= 1
    }
}

extension DoublyLinkedList: Sequence {
    func makeIterator() -> DoublyLinkedListIterator<T> {
        return DoublyLinkedListIterator(self)
    }
}

struct DoublyLinkedListIterator<T: Equatable>: IteratorProtocol {
    let linkedList: DoublyLinkedList<T>
    var current: DoublyLinkedListNode<T>?
    
    init(_ linkedList: DoublyLinkedList<T>) {
        self.linkedList = linkedList
        self.current = linkedList.first
    }
    
    mutating func next() -> DoublyLinkedListNode<T>? {
        guard let node = current else { return nil }
        current = node.next
        return node
    }
}
