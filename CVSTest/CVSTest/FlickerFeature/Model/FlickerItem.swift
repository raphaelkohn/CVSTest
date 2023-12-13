//
//  FlickerItem.swift
//  CVSTest
//
//  Created by Raphael Kohn on 11/12/23.
//

import Foundation

struct FlickerItem: Decodable {
    let title: String
    let link: String
    let media: FlickerMedia
    let dateTaken: Date
    var description: String
    let tags: String
    let author: String
    
    func mediaSize() -> CGSize {
        let rootedXml = "<root>\(description)</root>"
        let xmlParser = XMLParser(data: Data(rootedXml.utf8))
        let parserDelegate = ImageDescriptionParser()
        xmlParser.delegate = parserDelegate
        xmlParser.parse()
        return CGSize(width: parserDelegate.width, height: parserDelegate.height)
    }
}

extension FlickerItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + link)
    }
}

struct FlickerMedia: Decodable {
    let m: String
}

extension FlickerMedia: Hashable {}
