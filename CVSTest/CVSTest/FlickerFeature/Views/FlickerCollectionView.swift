//
//  FlickerCollectionView.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import SwiftUI
import EasyDI

struct FlickerCollectionView<ViewModel>: View where ViewModel: FlickerViewModelProtocol {
    
    @ObservedObject var viewModel: ViewModel
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    private let spacing = 20.0
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    LazyVGrid(columns: columns, spacing: spacing) {
                        ForEach(viewModel.flickerItems, id: \.self) { item in
                            NavigationLink {
                                FlickerDetailView(item: item)
                            } label: {
                                FlickerImageView(item: item, size: sizeImage(side: proxy.size.width))
                            }
                        }
                    }
                    .padding(spacing)
                }
            }
            .navigationTitle(Strings.navigationTitle.localize())
        }
        .searchable(text: $viewModel.tagSearch, prompt: "Flicker Search")
    }
    
    private func sizeImage(side: CGFloat) -> CGFloat {
        return (side - (3 * spacing)) / 2
    }
}

struct FlickerCollectionView_Previews: PreviewProvider {
    init() {
        Resolver.shared.add(PreviewFlickerViewModel(), keyReplace: String(describing:(any FlickerViewModelProtocol).self))
    }
    static var previews: some View {
        FlickerCollectionView(viewModel: PreviewFlickerViewModel())
    }
}
