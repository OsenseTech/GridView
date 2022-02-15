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
            ImageView(photoSet: photoSet)
                .frame(width: width, height: height)
                .cornerRadius(10)

            VStack(spacing: 5) {
                Text(photoSet.name)
                    .foregroundColor(.black)
                DateView(date: photoSet.time)
            }
            .font(.system(size: 11))
        }
        .frame(width: width)
    }
    
}

private struct ImageView: View {
    
    var photoSet: PhotoSet
    
    var body: some View {
        ImageView(url: photoSet.previewImageURL)
    }
    
    @ViewBuilder
    func ImageView(url: URL) -> some View {
        AsyncImage(url: photoSet.previewImageURL, content: { image in
            image
                .resizable()
                .scaledToFill()
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
        PhotoSetView(width: width, height: height,
                     photoSet: PhotoSet(name: "Slipper", time: Date(), previewImageURL: URL(string: "https://oexpo3dappstage.blob.core.windows.net/slipper/baked_mesh.png")!))
            .previewLayout(.sizeThatFits)
    }
}
