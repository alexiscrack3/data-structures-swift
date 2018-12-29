
import Foundation

struct SimplyLinkedList<T: Equatable> {
    typealias Node = SimplyLinkedListNode<T>
    
    private var head: Node?
    private var tail: Node?
    
    var count: Int = 0
    
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
            tail = node
            count += 1
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = node
            tail = current == tail ? node : tail
            count += 1
        }
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
        var previous: Node? = nil
        var current = head
        while current != nil {
            if current?.value == value {
                previous = current
            }
            current = current?.next
        }
        return previous
    }
    
    func index(of value: T) -> Int {
        var current = head
        var i = 0
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
        var previous = -1
        var current = head
        var i = 0
        while current != nil {
            if current?.value == value {
                previous = i
            }
            current = current?.next
            i += 1
        }
        return previous
    }
    
    mutating func prepend(value: T) {
        let node = Node(value)
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
            
            current?.next = current?.next?.next
        }
        count -= 1
    }
}

extension SimplyLinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(self)
    }
}

struct LinkedListIterator<T: Equatable>: IteratorProtocol {
    let linkedList: SimplyLinkedList<T>
    var current: SimplyLinkedListNode<T>?
    
    init(_ linkedList: SimplyLinkedList<T>) {
        self.linkedList = linkedList
        self.current = linkedList.first
    }
    
    mutating func next() -> SimplyLinkedListNode<T>? {
        guard let node = current else { return nil }
        current = node.next
        return node
    }
}
