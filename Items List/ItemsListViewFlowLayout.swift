// Redux Visual Editor
// Created 04/02/2019 by Max Gribov
//

import Cocoa

let kItemsListViewFlowLayoutBaseItemHeight: CGFloat = 60.0
let kItemsListViewFlowLayoutLeftInset: CGFloat = 10.0
let kItemsListViewFlowLayoutRightInset: CGFloat = 10.0

class ItemsListViewFlowLayout: NSCollectionViewFlowLayout {
    
    override init() {
        super.init()
        scrollDirection = .vertical
        minimumLineSpacing = 10.0
        minimumInteritemSpacing = 0
        sectionInset = NSEdgeInsets(top: 30, left: kItemsListViewFlowLayoutLeftInset, bottom: 55, right: kItemsListViewFlowLayoutRightInset)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
