

import XCTest
@testable import ReduxVisualEditor

class PropsListTests: XCTestCase {

    func testAddProps_PropsDidntExist_ShouldReturnStateWithPropsAdded() {
        let state = PropsList.initial
        let sut = reduce(state, with: AddProps(name: "Test"))
        XCTAssert(sut.props.contains(PropsList.Props(rawValue: "Test")))
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
