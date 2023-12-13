//
//  FlickerDetailView.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import SwiftUI

struct FlickerDetailView: View {
    
    var item: FlickerItem
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: item.media.m)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(item.title)
                        .font(.system(.largeTitle))
                        .padding()
                    
                    HStack {
                        Text(Strings.authorLiteral.localize())
                            .bold()
                        Text(item.author)
                            .font(.system(.title))
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text(Strings.widthLiteral.localize())
                            .bold()
                        Text(String(format: "%.2f", Double(item.mediaSize().width)))
                            .font(.system(.title))
                        Spacer()
                        
                        Text(Strings.heightLiteral.localize())
                            .bold()
                        Text(String(format: "%.2f", Double(item.mediaSize().height)))
                            .font(.system(.title))
                    }
                    .padding()
                    
                    HStack {
                        Text(Strings.tagsLiteral.localize())
                            .bold()
                        Text(item.tags)
                        Spacer()
                    }
                    .padding()
                    
                    HStack {
                        Text(Strings.dateTakenLiteral.localize())
                            .bold()
                        Text(formatDate(item.dateTaken))
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func formatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm Z"
        return dateFormatter.string(from: date)
    }
}

struct FlickerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlickerDetailView(item: PreviewFlickerItem.previewItem)
    }
}
