//
//  PreviewFlickerViewModel.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import Foundation

class PreviewFlickerViewModel: FlickerViewModelProtocol {
    var flickerItems: [FlickerItem] = [
        FlickerItem(title: "TestItem", link: "", media: FlickerMedia(m: "https://live.staticflickr.com/65535/53377991860_b72c03276f_m.jpg"), dateTaken: Date(), description: "", tags: "", author: "TestAuthor"),
        FlickerItem(title: "TestItem", link: "", media: FlickerMedia(m: "https://live.staticflickr.com/65535/53377991860_b72c03276f_m.jpg"), dateTaken: Date(), description: "", tags: "", author: "TestAuthor"),
        FlickerItem(title: "TestItem", link: "", media: FlickerMedia(m: "https://live.staticflickr.com/65535/53377991860_b72c03276f_m.jpg"), dateTaken: Date(), description: "", tags: "", author: "TestAuthor")
    ]
    
    var tagSearch: String = "porcupine"
    
    var errorMessage: String = ""
}
