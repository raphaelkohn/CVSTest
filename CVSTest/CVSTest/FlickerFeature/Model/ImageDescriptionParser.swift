//
//  ImageDescriptionParser.swift
//  CVSTest
//
//  Created by Raphael Kohn on 11/12/23.
//

import Foundation

class ImageDescriptionParser: NSObject, XMLParserDelegate {
    
    var width: CGFloat = .zero
    var height: CGFloat = .zero
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "img" {
            attributeDict.forEach {
                if $0.key == "width" {
                    width = Double($0.value) ?? .zero
                } else if $0.key == "height" {
                    height = Double($0.value) ?? .zero
                }
            }
        }
    }
}
