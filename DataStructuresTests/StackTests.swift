
import XCTest
@testable import DataStructures

class StackTests: XCTestCase {
    
    func testStackShouldInsertValuesOnInit() {
        let testObject = Stack<Int>(values: 10, 20, 30, 40, 50)
        
        XCTAssertEqual(testObject.count, 5)
    }
    
    func testClearShouldRemoveAllNodesFromStack() {
        var testObject = Stack<Int>(values: 10, 20, 30)
        
        testObject.clear()
        
        XCTAssertNil(testObject.peek())
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testContainsShouldReturnTrueWhenValueIsInTheStack() {
        let value = 20
        let testObject = Stack<Int>(values: 10, value, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertTrue(actual)
    }
    
    func testContainsShouldReturnFalseWhenValueIsNotInTheStack() {
        let value = 40
        let testObject = Stack<Int>(values: 10, 20, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertFalse(actual)
    }
    
    func testIsEmptyShouldReturnTrueWhenStackIsEmpty() {
        let testObject = Stack<Int>()
        
        let actual = testObject.isEmpty()
        
        XCTAssertTrue(actual)
    }
    
    func testIsEmptyShouldReturnFalseWhenStackIsNotEmpty() {
        let testObject = Stack<Int>(values: 10)
        
        let actual = testObject.isEmpty()
        
        XCTAssertFalse(actual)
    }
    
    func testPeekShouldReturnValueWhenStackIsNotEmpty() {
        let value = 10
        let testObject = Stack<Int>(values: value)
        
        let actual = testObject.peek()
        
        XCTAssertEqual(actual, value)
    }
    
    func testPeekShouldReturnNilWhenStackIsEmpty() {
        let testObject = Stack<Int>()
        
        let actual = testObject.peek()
        
        XCTAssertNil(actual)
    }
    
    func testPopValueShouldRemoveNodeAtTheTopOfStackThatHasOneNode() {
        let value = 10
        var testObject = Stack<Int>(values: value)
        
        let actual = testObject.pop()
        
        XCTAssertEqual(actual, value)
        XCTAssertNil(testObject.peek())
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testPushValueShouldInsertNodeAtTheTopOfStack() {
        let value = 10
        var testObject = Stack<Int>()
        
        testObject.push(value: value)
        
        XCTAssertEqual(testObject.peek(), value)
        XCTAssertEqual(testObject.count, 1)
    }
}
