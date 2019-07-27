//
//  CustomCollectionNode.swift
//  AppetiserSearchItunes
//
//  Created by Abz Maxey on 27/07/2019.
//  Copyright © 2019 Abz Maxey. All rights reserved.
//

import AsyncDisplayKit



class CustomCollectionNode: ASCollectionNode {
    init(flowLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout, layoutFacilitator: nil)
        //Pre-fetching begins when you reach 4 screens from bottom.
        leadingScreensForBatching = 4.0
        backgroundColor = UIColor.white
        automaticallyRelayoutOnSafeAreaChanges = true
    }
}
