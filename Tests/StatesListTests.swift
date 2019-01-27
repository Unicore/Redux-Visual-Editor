

import XCTest
@testable import ReduxVisualEditor

class StatesListTests: XCTestCase {
    
    func testAddState_StateDidntExist_ShouldReturnStateWithStateAdded() {
        let state = StatesList.initial
        let sut = reduce(state, with: AddState(name: "Test"))
        XCTAssert(sut.states.contains(StatesList.State(rawValue: "Test")))
    }
    
    func testAddState_StateExist_ShouldReturnStateWithOnlyOneState() {
        let stateToAdd = StatesList.State(rawValue: "Test")
        let state = StatesList(states: [stateToAdd])
        let sut = reduce(state, with: AddState(name: stateToAdd.rawValue))
        XCTAssertEqual(sut.states.filter{$0 == stateToAdd}.count, 1)
    }
    
    func testDeleteStates_StatesExist_ShouldReturnStateWithoutDeletedStates() {
        let toDelete = StatesList.State(rawValue: "toDelete")
        let state = StatesList(states: [
            StatesList.State(rawValue: "Test"),
            toDelete,
            ]
        )
        let sut = reduce(state, with: DeleteState(name: toDelete.rawValue))
        XCTAssert(!sut.states.contains(toDelete))
    }
    
}
