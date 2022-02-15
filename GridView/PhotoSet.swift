//
//  PhotoSet.swift
//  ObjectCaptureCamera
//
//  Created by 蘇健豪 on 2021/11/15.
//

import Foundation

struct PhotoSet: Identifiable {
    let id = UUID()
    let name: String
    let time: Date
    var previewImageURL: URL
}
