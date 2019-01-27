

import XCTest
@testable import ReduxVisualEditor

class StatesListTests: XCTestCase {
    
    func testAddStates_StatesDidntExist_ShouldReturnStateWithStatesAdded() {
        let state = StatesList.initial
        let sut = reduce(state, with: AddState(name: "Test"))
        XCTAssert(sut.states.contains(StatesList.State(rawValue: "Test")))
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
