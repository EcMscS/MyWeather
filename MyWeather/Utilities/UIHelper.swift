//
//  UIHelper.swift
//  GitFollowers
//
//  Created by Jeffrey Lai on 1/22/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit

enum UIHelper {
    
    static func createThreeItemHorizontalScolling(in view: UIView) -> UICollectionViewFlowLayout {
        let labelHeight: CGFloat = 25
        let width = view.bounds.width
        let padding: CGFloat = 5
        let minimumItemSpacing: CGFloat = 15
        let availableWidth = width - (padding * 2) - minimumItemSpacing * 2
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + labelHeight)
        flowLayout.scrollDirection = .horizontal
        
        return flowLayout
    }
    
}
