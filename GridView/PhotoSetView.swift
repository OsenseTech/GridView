//
//  PhotoSetView.swift
//  ObjectCaptureCamera
//
//  Created by 蘇健豪 on 2021/11/15.
//

import SwiftUI

struct PhotoSetView: View {
    
    let width: CGFloat
    let height: CGFloat
    var photoSet: PhotoSet
    
    var body: some View {
        VStack(spacing: 5) {
            ZStack {
                ImageView(width: width, photoSet: photoSet)
                    .cornerRadius(10)
            }
            .frame(height: height)

            VStack(spacing: 5) {
                Text(photoSet.name)
                    .font(.system(size: 11))
                    .foregroundColor(.black)
                DateView(date: photoSet.time)
                    .font(.system(size: 11))
            }
            .font(.custom("Roboto", size: 11, relativeTo: .caption))
            .lineLimit(1)
        }
        .frame(width: width)
    }
    
}

private struct ImageView: View {
    
    let width: CGFloat
    var photoSet: PhotoSet
    
    @State private var isRotateActive: Bool = false
    
    var body: some View {
        if let url = photoSet.previewImageURL {
            ImageView(url: url)
        } else {
            Color.white
        }
    }
    
    @ViewBuilder
    func ImageView(url: URL) -> some View {
        AsyncImage(url: photoSet.previewImageURL, content: { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width)
                .clipped()
        }, placeholder: {
            ZStack {
                Color.white
                ProgressView()
            }
        })
    }
    
}

private struct DateView: View {
    
    let date: Date
    
    var body: some View {
        Text(date
                .formatted(.dateTime
                            .year()
                            .month(.twoDigits)
                            .day(.twoDigits)
                            .hour()
                            .minute(.twoDigits)))
            .foregroundColor(Color(red: 167.0 / 255.0, green: 167.0 / 255.0, blue: 167.0 / 255.0))
    }
    
}

struct PictureSetItem_Previews: PreviewProvider {
    
    static let width = PhotoSetViewModel.width
    static let height = PhotoSetViewModel.height
    
    static var previews: some View {
        Group {
            PhotoSetView(width: width, height: height,
                         photoSet: PhotoSet(name: "Slipper", time: Date(), previewImageURL: URL(string: "https://oexpo3dappstage.blob.core.windows.net/slipper/baked_mesh.png")))
                .environment(\.locale, Locale(identifier: "zh_Hant_TW"))
                .previewDisplayName("zh_Hant_TW")
            PhotoSetView(width: width, height: height,
                         photoSet: PhotoSet(name: "Slipper", time: Date(), previewImageURL: URL(string: "https://oexpo3dappstage.blob.core.windows.net/slipper/baked_mesh.png")))
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .previewDisplayName("ja_JP")
            PhotoSetView(width: width, height: height,
                         photoSet: PhotoSet(name: "Slipper", time: Date(), previewImageURL: URL(string: "https://oexpo3dappstage.blob.core.windows.net/slipper/baked_mesh.png")))
                .environment(\.locale, Locale(identifier: "en_US"))
                .previewDisplayName("en_US")
        }
            .previewLayout(.sizeThatFits)
    }
}
