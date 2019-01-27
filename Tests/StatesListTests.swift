

import XCTest
@testable import ReduxVisualEditor

class StatesListTests: XCTestCase {
    
    func testAddState_StateDidntExist_ShouldReturnStateWithStateAdded() {
        let state = StatesList.initial
        let stateToAdd = StatesList.State(rawValue: "Test")
        let sut = reduce(state, with: AddState(state: stateToAdd))
        XCTAssert(sut.states.contains(stateToAdd))
    }
    
    func testAddState_StateExist_ShouldReturnStateWithOnlyOneState() {
        let stateToAdd = StatesList.State(rawValue: "Test")
        let state = StatesList(states: [stateToAdd])
        let sut = reduce(state, with: AddState(state: stateToAdd))
        XCTAssertEqual(sut.states.filter{$0 == stateToAdd}.count, 1)
    }
    
    func testDeleteStates_StatesExist_ShouldReturnStateWithoutDeletedStates() {
        let stateToDelete = StatesList.State(rawValue: "toDelete")
        let state = StatesList(states: [
            StatesList.State(rawValue: "Test"),
            stateToDelete,
            ]
        )
        let sut = reduce(state, with: DeleteState(state: stateToDelete))
        XCTAssert(!sut.states.contains(stateToDelete))
    }
    
}
