
import XCTest
@testable import DataStructures

class DoublyLinkedListTests: XCTestCase {
    
    func testDoublyLinkedListShouldInsertValuesOnInit() {
        let testObject = DoublyLinkedList<Int>(values: 10, 20, 30, 40, 50)
        
        XCTAssertEqual(testObject.count, 5)
    }
    
    func testAppendValueShouldInsertNodeAtTheBeginningOfDoublyLinkedList() {
        let value = 10
        var testObject = DoublyLinkedList<Int>()
        
        testObject.append(value: value)
        
        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertEqual(testObject.count, 1)
    }
    
    func testAppendValueShouldInsertNodeAtTheEndOfDoublyLinkedList() {
        let value = 30
        var testObject = DoublyLinkedList<Int>()
        
        testObject.append(value: 10)
        testObject.append(value: 20)
        testObject.append(value: value)
        
        XCTAssertEqual(testObject.last?.value, value)
        XCTAssertEqual(testObject.count, 3)
    }
    
    func testClearShouldRemoveAllNodesFromDoublyLinkedList() {
        var testObject = DoublyLinkedList<Int>(values: 10, 20, 30)
        
        testObject.clear()
        
        XCTAssertNil(testObject.first)
        XCTAssertNil(testObject.last)
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testContainsShouldReturnTrueWhenValueIsInTheDoublyLinkedList() {
        let value = 20
        let testObject = DoublyLinkedList<Int>(values: 10, value, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertTrue(actual)
    }
    
    func testContainsShouldReturnFalseWhenValueIsNotInTheDoublyLinkedList() {
        let value = 40
        let testObject = DoublyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertFalse(actual)
    }
    
    func testFindValueShouldReturnNilWhenDoublyLinkedListIsEmpty() {
        let testObject = DoublyLinkedList<Int>()
        
        let actual = testObject.find(value: 10)
        
        XCTAssertNil(actual)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsAtTheBeginningOfDoublyLinkedList() {
        let value = 10
        let testObject = DoublyLinkedList<Int>(values: value, 20, 30)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsInTheMiddleOfDoublyLinkedList() {
        let value = 20
        let testObject = DoublyLinkedList<Int>(values: 10, value, 30)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsAtTheEndOfDoublyLinkedList() {
        let value = 30
        let testObject = DoublyLinkedList<Int>(values: 10, 20, value)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindLastValueShouldReturnNilWhenDoublyLinkedListIsEmpty() {
        let testObject = DoublyLinkedList<Int>()
        
        let actual = testObject.findLast(value: 10)
        
        XCTAssertNil(actual)
    }
    
    func testFindLastValueShouldReturnNodeOfLastOccurrenceWhenDoublyLinkedListIsNotEmpty() {
        let value = 20
        let testObject = DoublyLinkedList<Int>(values: 10, value, value)
        
        let actual = testObject.findLast(value: value)
        
        XCTAssertEqual(testObject.last, actual)
        XCTAssertEqual(actual?.value, value)
    }
    
    func testIndexOfValueShouldReturnZeroBasedIndexOfTheFirstOccurrenceWhenValueIsFound() {
        let value = 30
        let testObject = DoublyLinkedList<Int>(values: 10, 20, value)
        
        let actual = testObject.index(of: value)
        
        XCTAssertEqual(actual, 2)
    }
    
    func testIndexOfValueShouldReturnMinusOneWhenValueIsNotFound() {
        let testObject = DoublyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.index(of: 40)
        
        XCTAssertEqual(actual, -1)
    }
    
    func testLastIndexOfValueShouldReturnZeroBasedIndexOfTheLastOccurrenceWhenValueIsFound() {
        let value = 20
        let testObject = DoublyLinkedList<Int>(values: 10, value, value)
        
        let actual = testObject.lastIndex(of: value)
        
        XCTAssertEqual(actual, 2)
    }
    
    func testLastIndexOfValueShouldReturnMinusOneWhenValueIsNotFound() {
        let testObject = DoublyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.lastIndex(of: 40)
        
        XCTAssertEqual(actual, -1)
    }
    
    func testPrependValueShouldInsertNodeAtTheBeginningOfDoublyLinkedList() {
        let value = 10
        let lastValue = 20
        var testObject = DoublyLinkedList<Int>(values: lastValue)
        
        testObject.prepend(value: value)
        
        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertEqual(testObject.first?.next, testObject.last)
        XCTAssertEqual(testObject.last?.previous, testObject.first)
        XCTAssertEqual(testObject.count, 2)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheBeginningOfDoublyLinkedListThatHasOneNode() {
        let value = 10
        var testObject = DoublyLinkedList<Int>(values: value)
        
        testObject.remove(value: value)
        
        XCTAssertNil(testObject.first)
        XCTAssertNil(testObject.last)
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheBeginningOfDoublyLinkedListThatHasTwoNodes() {
        let value = 10
        var testObject = DoublyLinkedList<Int>(values: value, 20)
        
        testObject.remove(value: value)
        
        XCTAssertNotNil(testObject.first)
        XCTAssertNil(testObject.first?.previous)
        XCTAssertNil(testObject.first?.next)
        XCTAssertNotNil(testObject.last)
        XCTAssertNil(testObject.last?.previous)
        XCTAssertNil(testObject.last?.next)
        XCTAssertEqual(testObject.count, 1)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheBeginningOfDoublyLinkedListThatHasThreeNodes() {
        let value = 10
        let secondValue = 20
        let lastValue = 30
        var testObject = DoublyLinkedList<Int>(values: value, secondValue, lastValue)
        
        testObject.remove(value: value)
        
        XCTAssertNotNil(testObject.first)
        XCTAssertEqual(testObject.first?.value, secondValue)
        XCTAssertNil(testObject.first?.previous)
        XCTAssertEqual(testObject.first?.next, testObject.last)
        XCTAssertNotNil(testObject.last)
        XCTAssertEqual(testObject.last?.previous?.value, secondValue)
        XCTAssertNil(testObject.last?.next)
        XCTAssertEqual(testObject.count, 2)
    }
    
    func testRemoveValueShouldRemoveNodeInTheMiddleOfDoublyLinkedList() {
        let secondValue = 20
        let lastValue = 30
        var testObject = DoublyLinkedList<Int>(values: 10, secondValue, lastValue)
        
        testObject.remove(value: secondValue)
        
        XCTAssertNil(testObject.first?.previous)
        XCTAssertEqual(testObject.first?.next, testObject.last)
        XCTAssertEqual(testObject.last?.previous, testObject.first)
        XCTAssertEqual(testObject.count, 2)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheEndOfDoublyLinkedList() {
        let secondValue = 20
        let lastValue = 30
        var testObject = DoublyLinkedList<Int>(values: 10, secondValue, lastValue)
        
        testObject.remove(value: lastValue)
        
        XCTAssertEqual(testObject.last?.previous, testObject.first)
        XCTAssertNil(testObject.last?.next)
        XCTAssertEqual(testObject.last?.value, secondValue)
        XCTAssertEqual(testObject.count, 2)
    }
}
