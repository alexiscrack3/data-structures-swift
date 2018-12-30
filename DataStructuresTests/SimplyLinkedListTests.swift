
import XCTest
@testable import DataStructures

class SimplyLinkedListTests: XCTestCase {
    
    func testSimplyLinkedListShouldInsertValuesOnInit() {
        let testObject = SimplyLinkedList<Int>(values: 10, 20, 30, 40, 50)
        
        XCTAssertEqual(testObject.count, 5)
    }

    func testAppendValueShouldInsertNodeAtTheBeginningOfSimplyLinkedList() {
        let value = 10
        var testObject = SimplyLinkedList<Int>()
        
        testObject.append(value: value)
        
        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertEqual(testObject.count, 1)
    }
    
    func testAppendValueShouldInsertNodeAtTheEndOfSimplyLinkedList() {
        let value = 30
        var testObject = SimplyLinkedList<Int>()
        
        testObject.append(value: 10)
        testObject.append(value: 20)
        testObject.append(value: value)
        
        XCTAssertEqual(testObject.last?.value, value)
        XCTAssertEqual(testObject.count, 3)
    }
    
    func testClearShouldRemoveAllNodesFromSimplyLinkedList() {
        var testObject = SimplyLinkedList<Int>(values: 10, 20, 30)
        
        testObject.clear()
        
        XCTAssertNil(testObject.first)
        XCTAssertNil(testObject.last)
        XCTAssertEqual(testObject.count, 0)
    }
    
    func testContainsShouldReturnTrueWhenValueIsInTheSimplyLinkedList() {
        let value = 20
        let testObject = SimplyLinkedList<Int>(values: 10, value, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertTrue(actual)
    }
    
    func testContainsShouldReturnFalseWhenValueIsNotInTheSimplyLinkedList() {
        let value = 40
        let testObject = SimplyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.contains(value: value)
        
        XCTAssertFalse(actual)
    }
    
    func testFindValueShouldReturnNilWhenSimplyLinkedListIsEmpty() {
        let testObject = SimplyLinkedList<Int>()
        
        let actual = testObject.find(value: 10)
        
        XCTAssertNil(actual)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsAtTheBeginningOfSimplyLinkedList() {
        let value = 10
        let testObject = SimplyLinkedList<Int>(values: value, 20, 30)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsInTheMiddleOfSimplyLinkedList() {
        let value = 20
        let testObject = SimplyLinkedList<Int>(values: 10, value, 30)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindValueShouldReturnNodeWhenValueIsAtTheEndOfSimplyLinkedList() {
        let value = 30
        let testObject = SimplyLinkedList<Int>(values: 10, 20, value)
        
        let actual = testObject.find(value: value)
        
        XCTAssertEqual(actual?.value, value)
    }
    
    func testFindLastValueShouldReturnNilWhenSimplyLinkedListIsEmpty() {
        let testObject = SimplyLinkedList<Int>()
        
        let actual = testObject.findLast(value: 10)
        
        XCTAssertNil(actual)
    }
    
    func testFindLastValueShouldReturnNodeOfLastOccurrenceWhenSimplyLinkedListIsNotEmpty() {
        let value = 20
        let testObject = SimplyLinkedList<Int>(values: 10, value, value)
        
        let actual = testObject.findLast(value: value)
        
        XCTAssertEqual(testObject.last, actual)
        XCTAssertEqual(actual?.value, value)
    }
    
    func testIndexOfValueShouldReturnZeroBasedIndexOfTheFirstOccurrenceWhenValueIsFound() {
        let value = 30
        let testObject = SimplyLinkedList<Int>(values: 10, 20, value)
        
        let actual = testObject.index(of: value)
        
        XCTAssertEqual(actual, 2)
    }
    
    func testIndexOfValueShouldReturnMinusOneWhenValueIsNotFound() {
        let testObject = SimplyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.index(of: 40)
        
        XCTAssertEqual(actual, -1)
    }
    
    func testLastIndexOfValueShouldReturnZeroBasedIndexOfTheLastOccurrenceWhenValueIsFound() {
        let value = 20
        let testObject = SimplyLinkedList<Int>(values: 10, value, value)
        
        let actual = testObject.lastIndex(of: value)
        
        XCTAssertEqual(actual, 2)
    }
    
    func testLastIndexOfValueShouldReturnMinusOneWhenValueIsNotFound() {
        let testObject = SimplyLinkedList<Int>(values: 10, 20, 30)
        
        let actual = testObject.lastIndex(of: 40)
        
        XCTAssertEqual(actual, -1)
    }
    
    func testPrependValueShouldInsertNodeAtTheBeginningOfSimplyLinkedList() {
        let value = 10
        let lastValue = 20
        var testObject = SimplyLinkedList<Int>(values: lastValue)

        testObject.prepend(value: value)

        XCTAssertEqual(testObject.first?.value, value)
        XCTAssertNotNil(testObject.first?.next)
        XCTAssertEqual(testObject.last?.value, lastValue)
        XCTAssertEqual(testObject.count, 2)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheBeginningOfSimplyLinkedList() {
        let value = 10
        var testObject = SimplyLinkedList<Int>(values: value, 20, 30)
        
        testObject.remove(value: value)
        
        XCTAssertEqual(testObject.count, 2)
    }
    
    func testRemoveValueShouldRemoveNodeInTheMiddleOfSimplyLinkedList() {
        let value = 20
        let lastValue = 30
        var testObject = SimplyLinkedList<Int>(values: 10, value, lastValue)
        
        testObject.remove(value: value)
        
        XCTAssertEqual(testObject.count, 2)
        XCTAssertEqual(testObject.last?.value, lastValue)
    }
    
    func testRemoveValueShouldRemoveNodeAtTheEndOfSimplyLinkedList() {
        let value = 20
        let lastValue = 30
        var testObject = SimplyLinkedList<Int>(values: 10, value, lastValue)
        
        testObject.remove(value: lastValue)
        
        XCTAssertEqual(testObject.count, 2)
        XCTAssertEqual(testObject.last?.value, value)
    }
}
