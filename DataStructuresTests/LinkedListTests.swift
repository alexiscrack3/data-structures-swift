
import XCTest
@testable import DataStructures

class LinkedListTests: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testLinkedListShouldInsertValuesOnInit() {
        let testObject = LinkedList<Int>(values: 10, 20, 30, 40, 50)
        
        XCTAssertEqual(testObject.count, 5)
    }

    func testAppendValueShouldInsertNodeAtTheBeginningWhenLinkedListIsEmpty() {
        let value = 10
        var testObject = LinkedList<Int>()
        
        testObject.append(value: value)
        
        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertEqual(testObject.count, 1)
    }
    
    func testAppendValueShouldInsertNodeAtTheEndWhenLinkedListIsNotEmpty() {
        let value = 30
        var testObject = LinkedList<Int>()
        
        testObject.append(value: 10)
        testObject.append(value: 20)
        testObject.append(value: value)
        
        XCTAssertEqual(testObject.last?.value, value)
        XCTAssertEqual(testObject.count, 3)
    }
    
    func testClearShouldRemoveAllNodesFromLinkedList() {
        var testObject = LinkedList<Int>(values: 10, 20, 30)
        
        testObject.clear()
        
        XCTAssertNil(testObject.first)
        XCTAssertNil(testObject.last)
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testContainsShouldReturnTrueWhenValueIsInTheLinkedList() {
        let value = 20
        let testObject = LinkedList<Int>(values: 10, value, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertTrue(actual)
    }
    
    func testContainsShouldReturnFalseWhenValueIsNotInTheLinkedList() {
        let value = 40
        let testObject = LinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertFalse(actual)
    }
    
    func testFindValueShouldReturnNilWhenLinkedListIsEmpty() {
        let testObject = LinkedList<Int>()
        
        let actual = testObject.find(value: 10)
        
        XCTAssertNil(actual)
    }
    
    func testFindValueShouldReturnNodeWhenLinkedListIsNotEmpty() {
        let value = 10
        let testObject = LinkedList<Int>(values: value)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsAtTheBeginningOfLinkedList() {
        let value = 10
        let testObject = LinkedList<Int>(values: value, 20, 30)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsInTheMiddleOfLinkedList() {
        let value = 20
        let testObject = LinkedList<Int>(values: 10, value, 30)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsAtTheEndOfLinkedList() {
        let value = 30
        let testObject = LinkedList<Int>(values: 10, 20, value)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindLastValueShouldReturnNilWhenLinkedListIsEmpty() {
        let testObject = LinkedList<Int>()
        
        let actual = testObject.findLast(value: 10)
        
        XCTAssertNil(actual)
    }
    
    func testFindLastValueShouldReturnNodeOfLastOccurrenceWhenLinkedListIsNotEmpty() {
        let value = 20
        let testObject = LinkedList<Int>(values: 10, value, value)
        
        let actual = testObject.findLast(value: value)
        
        XCTAssertEqual(testObject.last, actual)
        XCTAssertEqual(actual?.value, value)
    }
    
    func testIndexOfValueShouldReturnZeroBasedIndexOfTheFirstOccurrenceWhenValueIsFound() {
        let value = 30
        let testObject = LinkedList<Int>(values: 10, 20, value)
        
        let actual = testObject.index(of: value)
        
        XCTAssertEqual(actual, 2)
    }
    
    func testIndexOfValueShouldReturnMinusOneWhenValueIsNotFound() {
        let testObject = LinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.index(of: 40)
        
        XCTAssertEqual(actual, -1)
    }
    
    func testLastIndexOfValueShouldReturnZeroBasedIndexOfTheLastOccurrenceWhenValueIsFound() {
        let value = 20
        let testObject = LinkedList<Int>(values: 10, value, value)
        
        let actual = testObject.lastIndex(of: value)
        
        XCTAssertEqual(actual, 2)
    }
    
    func testLastIndexOfValueShouldReturnMinusOneWhenValueIsNotFound() {
        let testObject = LinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.lastIndex(of: 40)
        
        XCTAssertEqual(actual, -1)
    }
    
    func testPrependValueShouldInsertNodeAtTheBeginningWhenLinkedListIsEmpty() {
        let value = 10
        var testObject = LinkedList<Int>()
        
        testObject.prepend(value: value)
        
        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertEqual(testObject.count, 1)
    }
    
    func testPrependValueShouldInsertNodeAtTheBeginningWhenLinkedListIsNotEmpty() {
        let value = 10
        var testObject = LinkedList<Int>(values: 20, 30)

        testObject.prepend(value: value)

        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertEqual(testObject.count, 3)
    }
    
    func testRemoveValueShouldRemoveNodeWhenLinkedListHasOneNode() {
        let value = 10
        var testObject = LinkedList<Int>(values: value)
        
        testObject.remove(value: value)
        
        XCTAssertEqual(testObject.count, 0)
        XCTAssertNil(testObject.first)
        XCTAssertNil(testObject.last)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheBeginningOfLinkedList() {
        let value = 10
        var testObject = LinkedList<Int>(values: value, 20, 30)
        
        testObject.remove(value: value)
        
        XCTAssertEqual(testObject.count, 2)
    }
    
    func testRemoveValueShouldRemoveNodeInTheMiddleOfLinkedList() {
        let value = 20
        let lastValue = 30
        var testObject = LinkedList<Int>(values: 10, value, lastValue)
        
        testObject.remove(value: value)
        
        XCTAssertEqual(testObject.count, 2)
        XCTAssertEqual(testObject.last?.value, lastValue)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheEndOfLinkedList() {
        let value = 20
        let lastValue = 30
        var testObject = LinkedList<Int>(values: 10, value, lastValue)
        
        testObject.remove(value: lastValue)
        
        XCTAssertEqual(testObject.count, 2)
        XCTAssertEqual(testObject.last?.value, value)
    }
}
