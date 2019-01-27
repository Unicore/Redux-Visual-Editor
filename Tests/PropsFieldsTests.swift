

import XCTest
@testable import ReduxVisualEditor

class PropsFieldsTests: XCTestCase {

//
//    struct UpdateFieldInProps: Action {
//        let props: PropsList.Props
//        let field: PropsFields.Field
//        let newField: PropsFields.Field
//    }

    
    
    func testAddFieldToProps_FieldDidntExist_ShouldReturnStateWithFielsAddedToProps() {
        let propsToAddField = PropsList.Props(rawValue: "Test")
        let fieldToAdd = PropsFields.Field(name: "Test", type: "Test")
        
        let state = PropsFields(fields: [propsToAddField: []])
        let sut = reduce(state, with: AddFieldToProps(props: propsToAddField, field: fieldToAdd))
        
        XCTAssert(sut.fields[propsToAddField]!.contains(fieldToAdd))
    }

    func testDeleteFieldFromProps_FieldExist_ShouldReturnStateWithoutField() {
        let propsToDeleteField = PropsList.Props(rawValue: "Test")
        let fieldToDelete = PropsFields.Field(name: "Test", type: "Test")
        
        let state = PropsFields(fields: [propsToDeleteField: [fieldToDelete]])
        let sut = reduce(state, with: DeleteFieldFromProps(props: propsToDeleteField, field: fieldToDelete))
        
        XCTAssertFalse(sut.fields[propsToDeleteField]!.contains(fieldToDelete))
    }

    func testUpdateFieldInProps_FieldExist_ShouldReturnStateWithUpdatedField() {
        let propsToUpdtaeField = PropsList.Props(rawValue: "Test")
        let fieldToUpdate = PropsFields.Field(name: "Test", type: "Test")
        let updatedField = PropsFields.Field(name: "Updated", type: "Test")
        
        let state = PropsFields(fields: [propsToUpdtaeField: [fieldToUpdate]])
        let sut = reduce(state, with: UpdateFieldInProps(
            props: propsToUpdtaeField,
            field: fieldToUpdate,
            newField: updatedField
        ))
        
        XCTAssertFalse(sut.fields[propsToUpdtaeField]!.contains(fieldToUpdate))
        XCTAssertTrue(sut.fields[propsToUpdtaeField]!.contains(updatedField))
    }

}
