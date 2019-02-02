

import XCTest
@testable import ReduxVisualEditor

class PropsListTests: XCTestCase {

    func testAddProps_PropsDidntExist_ShouldReturnStateWithPropsAdded() {
        let propsToAdd = PropsList.Props(rawValue: "Test")
        let state = PropsList.initial
        let sut = reduce(state, with: AddProps(props: propsToAdd))
        XCTAssert(sut.props.contains(propsToAdd))
    }
    
    func testAddProps_PropsExist_ShouldReturnStateWithOnlyOneProps() {
        let propsToAdd = PropsList.Props(rawValue: "Test")
        let state = PropsList(props: [propsToAdd])
        let sut = reduce(state, with: AddProps(props: propsToAdd))
        XCTAssertEqual(sut.props.filter{$0 == propsToAdd}.count, 1)
    }

    func testRenameProps_PropsExist_ShouldReturnStateWithPropsRenamed() {
        let propsToRename = PropsList.Props(rawValue: "Rename Me")
        let newName = "Renamed"
        let state = PropsList(props: [propsToRename])
        let sut = reduce(state, with: RenameProps(props: propsToRename, newName: newName))
        XCTAssertTrue(sut.props.contains(PropsList.Props(rawValue: newName)))
        XCTAssertFalse(sut.props.contains(propsToRename))
    }

    func testDeleteProps_PropsExist_ShouldReturnStateWithoutDeletedProps() {
        let toDelete = PropsList.Props(rawValue: "Delete Me")
        let state = PropsList(props: [
            PropsList.Props(rawValue: "Test"),
            toDelete,
            ]
        )
        let sut = reduce(state, with: DeleteProps(props: toDelete))
        XCTAssertFalse(sut.props.contains(toDelete))
    }

}
