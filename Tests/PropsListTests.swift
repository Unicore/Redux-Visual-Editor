

import XCTest
@testable import ReduxVisualEditor

class PropsListTests: XCTestCase {

    func testAddProps_PropsDidntExist_ShouldReturnStateWithPropsAdded() {
        let state = PropsList.initial
        let sut = reduce(state, with: AddProps(name: "Test"))
        XCTAssert(sut.props.contains(PropsList.Props(rawValue: "Test")))
    }
    
    func testAddProps_PropsExist_ShouldReturnStateWithOnlyOneProps() {
        let propsToAdd = PropsList.Props(rawValue: "Test")
        let state = PropsList(props: [propsToAdd])
        let sut = reduce(state, with: AddProps(name: propsToAdd.rawValue))
        XCTAssertEqual(sut.props.filter{$0 == propsToAdd}.count, 1)
    }

    func testDeleteProps_PropsExist_ShouldReturnStateWithoutDeletedProps() {
        let toDelete = "To Delete"
        let state = PropsList(props: [
            PropsList.Props(rawValue: "Test"),
            PropsList.Props(rawValue: toDelete),
            ]
        )
        let sut = reduce(state, with: DeleteProps(name: toDelete))
        XCTAssert(!sut.props.contains(PropsList.Props(rawValue: toDelete)))
    }

}
