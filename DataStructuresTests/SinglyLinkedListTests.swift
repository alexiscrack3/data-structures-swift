
import XCTest
@testable import DataStructures

class SinglyLinkedListTests: XCTestCase {
    
    func testSinglyLinkedListShouldInsertValuesOnInit() {
        let testObject = SinglyLinkedList<Int>(values: 10, 20, 30, 40, 50)
        
        XCTAssertEqual(testObject.count, 5)
    }

    func testAppendValueShouldInsertNodeAtTheBeginningOfSinglyLinkedList() {
        let value = 10
        var testObject = SinglyLinkedList<Int>()
        
        testObject.append(value: value)
        
        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertEqual(testObject.count, 1)
    }
    
    func testAppendValueShouldInsertNodeAtTheEndOfSinglyLinkedList() {
        let value = 30
        var testObject = SinglyLinkedList<Int>()
        
        testObject.append(value: 10)
        testObject.append(value: 20)
        testObject.append(value: value)
        
        XCTAssertEqual(testObject.last?.value, value)
        XCTAssertEqual(testObject.count, 3)
    }
    
    func testClearShouldRemoveAllNodesFromSinglyLinkedList() {
        var testObject = SinglyLinkedList<Int>(values: 10, 20, 30)
        
        testObject.clear()
        
        XCTAssertNil(testObject.first)
        XCTAssertNil(testObject.last)
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testContainsShouldReturnTrueWhenValueIsInTheSinglyLinkedList() {
        let value = 20
        let testObject = SinglyLinkedList<Int>(values: 10, value, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertTrue(actual)
    }
    
    func testContainsShouldReturnFalseWhenValueIsNotInTheSinglyLinkedList() {
        let value = 40
        let testObject = SinglyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertFalse(actual)
    }
    
    func testFindValueShouldReturnNilWhenSinglyLinkedListIsEmpty() {
        let testObject = SinglyLinkedList<Int>()
        
        let actual = testObject.find(value: 10)
        
        XCTAssertNil(actual)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsAtTheBeginningOfSinglyLinkedList() {
        let value = 10
        let testObject = SinglyLinkedList<Int>(values: value, 20, 30)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsInTheMiddleOfSinglyLinkedList() {
        let value = 20
        let testObject = SinglyLinkedList<Int>(values: 10, value, 30)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsAtTheEndOfSinglyLinkedList() {
        let value = 30
        let testObject = SinglyLinkedList<Int>(values: 10, 20, value)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindLastValueShouldReturnNilWhenSinglyLinkedListIsEmpty() {
        let testObject = SinglyLinkedList<Int>()
        
        let actual = testObject.findLast(value: 10)
        
        XCTAssertNil(actual)
    }
    
    func testFindLastValueShouldReturnNodeOfLastOccurrenceWhenSinglyLinkedListIsNotEmpty() {
        let value = 20
        let testObject = SinglyLinkedList<Int>(values: 10, value, value)
        
        let actual = testObject.findLast(value: value)
        
        XCTAssertEqual(testObject.last, actual)
        XCTAssertEqual(actual?.value, value)
    }
    
    func testIndexOfValueShouldReturnZeroBasedIndexOfTheFirstOccurrenceWhenValueIsFound() {
        let value = 30
        let testObject = SinglyLinkedList<Int>(values: 10, 20, value)
        
        let actual = testObject.index(of: value)
        
        XCTAssertEqual(actual, 2)
    }
    
    func testIndexOfValueShouldReturnMinusOneWhenValueIsNotFound() {
        let testObject = SinglyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.index(of: 40)
        
        XCTAssertEqual(actual, -1)
    }
    
    func testLastIndexOfValueShouldReturnZeroBasedIndexOfTheLastOccurrenceWhenValueIsFound() {
        let value = 20
        let testObject = SinglyLinkedList<Int>(values: 10, value, value)
        
        let actual = testObject.lastIndex(of: value)
        
        XCTAssertEqual(actual, 2)
    }
    
    func testLastIndexOfValueShouldReturnMinusOneWhenValueIsNotFound() {
        let testObject = SinglyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.lastIndex(of: 40)
        
        XCTAssertEqual(actual, -1)
    }
    
    func testPrependValueShouldInsertNodeAtTheBeginningOfSinglyLinkedList() {
        let value = 10
        let lastValue = 20
        var testObject = SinglyLinkedList<Int>(values: lastValue)

        testObject.prepend(value: value)

        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertNotNil(testObject.first?.next)
        XCTAssertEqual(testObject.last?.value, lastValue)
        XCTAssertEqual(testObject.count, 2)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheBeginningOfSinglyLinkedList() {
        let value = 10
        var testObject = SinglyLinkedList<Int>(values: value, 20, 30)
        
        testObject.remove(value: value)
        
        XCTAssertEqual(testObject.count, 2)
    }
    
    func testRemoveValueShouldRemoveNodeInTheMiddleOfSinglyLinkedList() {
        let value = 20
        let lastValue = 30
        var testObject = SinglyLinkedList<Int>(values: 10, value, lastValue)
        
        testObject.remove(value: value)
        
        XCTAssertEqual(testObject.count, 2)
        XCTAssertEqual(testObject.last?.value, lastValue)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheEndOfSinglyLinkedList() {
        let value = 20
        let lastValue = 30
        var testObject = SinglyLinkedList<Int>(values: 10, value, lastValue)
        
        testObject.remove(value: lastValue)
        
        XCTAssertEqual(testObject.count, 2)
        XCTAssertEqual(testObject.last?.value, value)
    }
}
