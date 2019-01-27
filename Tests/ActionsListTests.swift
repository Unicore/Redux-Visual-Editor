

import XCTest
@testable import ReduxVisualEditor

class ActionsListTests: XCTestCase {
    
    func testAddActions_ActionsDidntExist_ShouldReturnActionWithActionsAdded() {
        let state = ActionsList.initial
        let sut = reduce(state, with: AddAction(name: "Test"))
        XCTAssert(sut.actions.contains(ActionsList.Action(rawValue: "Test")))
    }
    
    func testDeleteActions_ActionsExist_ShouldReturnActionWithoutDeletedActions() {
        let toDelete = ActionsList.Action(rawValue: "toDelete")
        let state = ActionsList(actions: [
            ActionsList.Action(rawValue: "Test"),
            toDelete,
            ]
        )
        let sut = reduce(state, with: DeleteAction(name: toDelete.rawValue))
        XCTAssert(!sut.actions.contains(toDelete))
    }
    
}
