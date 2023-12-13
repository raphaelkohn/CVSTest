//
//  PreviewFlickerItem.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import Foundation

class PreviewFlickerItem {
    static let previewItem = FlickerItem(title: "TestItem", link: "", media: FlickerMedia(m: "https://live.staticflickr.com/65535/53377991860_b72c03276f_m.jpg"), dateTaken: Date(), description: "", tags: "", author: "TestAuthor")
    static let emptyItem = FlickerItem(title: "", link: "", media: FlickerMedia(m: ""), dateTaken: Date(), description: "", tags: "", author: "")
}
