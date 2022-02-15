//
//  PhotoSetViewModel.swift
//  GridView
//
//  Created by 蘇健豪 on 2022/2/15.
//

import Foundation
import UIKit

class PhotoSetViewModel {
    static let width: CGFloat = {
        let padding: CGFloat = 10
        let screenWidth = UIScreen.main.bounds.width - (padding * 2)
        let space = itemSpacing * (columnCount - 1)
        let width = (screenWidth - space) / columnCount
        
        return width
    }()
    static let height = width * (144 / 115)
    static let columnCount: CGFloat = 3
    static let itemSpacing: CGFloat = 5
}
