//
//  ContentView.swift
//  GridView
//
//  Created by 蘇健豪 on 2022/2/15.
//

import SwiftUI

struct ContentView: View {
    
    private let columns = Array(repeating: GridItem(.fixed(PhotoSetViewModel.width),
                                                    spacing: PhotoSetViewModel.itemSpacing),
                                count: Int(PhotoSetViewModel.columnCount))
    @State var photoSets: [PhotoSet] = [PhotoSet(name: "波蜜果菜汁", time: Date(), previewImageURL: URL(string: "https://oexpo3dappstage.blob.core.windows.net/bc77633b-b59f-4f43-9b7d-d0dc7a1e4e4c/baked_mesh.png")),
                                        PhotoSet(name: "角落生物", time: Date(), previewImageURL: URL(string: "https://oexpo3dappstage.blob.core.windows.net/24f81db3-0b0e-4162-8668-c09b8fa29dc9/baked_mesh.png")),
                                        PhotoSet(name: "貓咪", time: Date(), previewImageURL: URL(string: "https://oexpo3dappstage.blob.core.windows.net/83fb5738-614a-469d-8ce1-c8c22567ad01/baked_mesh.png")),
                                        PhotoSet(name: "怪盜基德", time: Date(), previewImageURL: URL(string: "https://oexpo3dappstage.blob.core.windows.net/f914db5f-69ef-4073-ada4-3fdbdb11314e/baked_mesh.png"))]
    
    let width = PhotoSetViewModel.width
    let height = PhotoSetViewModel.height
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(photoSets) { photoSet in
                        PhotoSetView(width: width, height: height, photoSet: photoSet)
                    }
                }
            }
            .navigationBarTitle("我的模型庫")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
