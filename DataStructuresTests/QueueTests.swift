
import XCTest
@testable import DataStructures

class QueueTests: XCTestCase {
    
    func testQueueShouldInsertValuesOnInit() {
        let testObject = Queue<Int>(values: 10, 20, 30, 40, 50)
        
        XCTAssertEqual(testObject.count, 5)
    }
    
    func testClearShouldRemoveAllNodesFromQueue() {
        var testObject = Queue<Int>(values: 10, 20, 30)
        
        testObject.clear()
        
        XCTAssertNil(testObject.peek())
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testContainsShouldReturnTrueWhenValueIsInTheQueue() {
        let value = 20
        let testObject = Queue<Int>(values: 10, value, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertTrue(actual)
    }
    
    func testContainsShouldReturnFalseWhenValueIsNotInTheQueue() {
        let value = 40
        let testObject = Queue<Int>(values: 10, 20, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertFalse(actual)
    }
    
    func testDequeueValueShouldRemoveNodeAtTheTopOfQueue() {
        let value = 10
        var testObject = Queue<Int>(values: value)
        
        let actual = testObject.dequeue()
        
        XCTAssertEqual(actual, value)
        XCTAssertNil(testObject.peek())
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testEnqueueValueShouldInsertNodeAtTheTopOfQueue() {
        let value = 10
        var testObject = Queue<Int>()
        
        testObject.enqueue(value: value)
        
        XCTAssertEqual(testObject.peek(), value)
        XCTAssertEqual(testObject.count, 1)
    }
    
    func testIsEmptyShouldReturnTrueWhenQueueIsEmpty() {
        let testObject = Queue<Int>()
        
        let actual = testObject.isEmpty()
        
        XCTAssertTrue(actual)
    }
    
    func testIsEmptyShouldReturnFalseWhenQueueIsNotEmpty() {
        let testObject = Queue<Int>(values: 10)
        
        let actual = testObject.isEmpty()
        
        XCTAssertFalse(actual)
    }
    
    func testPeekShouldReturnValueWhenQueueIsNotEmpty() {
        let value = 10
        let testObject = Queue<Int>(values: value)
        
        let actual = testObject.peek()
        
        XCTAssertEqual(actual, value)
    }
    
    func testPeekShouldReturnNilWhenQueueIsEmpty() {
        let testObject = Queue<Int>()
        
        let actual = testObject.peek()
        
        XCTAssertNil(actual)
    }
}
