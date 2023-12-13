//
//  FlickerImageView.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import SwiftUI

struct FlickerImageView: View {
    
    var item: FlickerItem
    var size: CGFloat
    
    var body: some View {
        NavigationLink {
            FlickerDetailView(item: item)
        } label: {
            AsyncImage(url: URL(string: item.media.m)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: size, height: size)
                        .scaledToFit()
                case .failure:
                    Image(systemName: "exclamationmark.triangle")
                        .resizable()
                        .frame(width: size, height: size)
                        .scaledToFit()
                case .empty:
                    ProgressView()
                        .frame(width: size, height: size)
                @unknown default:
                    ProgressView()
                        .frame(width: size, height: size)
                }
            }
            .cornerRadius(15)
        }
    }
}

struct FlickerImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlickerImageView(item: PreviewFlickerItem.previewItem , size: 250)
            FlickerImageView(item: PreviewFlickerItem.emptyItem, size: 250)
        }
    }
}
