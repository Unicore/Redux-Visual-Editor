

import XCTest
@testable import ReduxVisualEditor

class ActionsListTests: XCTestCase {
    
    func testAddActions_ActionsDidntExist_ShouldReturnStateWithActionsAdded() {
        let state = ActionsList.initial
        let actionToAdd = ActionsList.Action(rawValue: "Test")
        let sut = reduce(state, with: AddAction(action: actionToAdd))
        XCTAssert(sut.actions.contains(actionToAdd))
    }

    func testAddActions_ActionsExist_ShouldReturnStateWithOnlyOneAction() {
        let actionToAdd = ActionsList.Action(rawValue: "Test")
        let state = ActionsList(actions: [actionToAdd])
        let sut = reduce(state, with: AddAction(action: actionToAdd))
        XCTAssertEqual(sut.actions.filter{ $0 == actionToAdd }.count, 1)
    }

    func testDeleteActions_ActionsExist_ShouldReturnActionWithoutDeletedActions() {
        let actionToDelete = ActionsList.Action(rawValue: "toDelete")
        let state = ActionsList(actions: [
            ActionsList.Action(rawValue: "Test"),
            actionToDelete,
            ]
        )
        let sut = reduce(state, with: DeleteAction(action: actionToDelete))
        XCTAssert(!sut.actions.contains(actionToDelete))
    }
    
}
