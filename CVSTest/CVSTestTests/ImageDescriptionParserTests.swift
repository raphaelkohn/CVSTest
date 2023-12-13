//
//  ImageDescriptionParserTests.swift
//  CVSTestTests
//
//  Created by Raphael Kohn on 11/12/23.
//

import XCTest
@testable import CVSTest

final class ImageDescriptionParserTests: XCTestCase {
    
    let parserDelegate = ImageDescriptionParser()
    var parser: XMLParser!
    let xmlString = "<root><p><a href=\"https://www.flickr.com/people/10916465@N05/\">starc283</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/10916465@N05/53391657572/\" title=\"1V1A3082 whitetail buck\"><img src=\"https://live.staticflickr.com/65535/53391657572_46b435ea9e_m.jpg\" width=\"240\" height=\"160\" alt=\"1V1A3082 whitetail buck\" /></a></p><p>all decked out in camo on a cold snowy morning with a light breeze pushing my scent away.....\'what\' is that thing ?</p></root>"
    
    override func setUp() async throws {
        parser = XMLParser(data: Data(xmlString.utf8))
        parser.delegate = parserDelegate
    }
    
    func testParseXml() {
        parser.parse()
        XCTAssert(parserDelegate.width == 240)
        XCTAssert(parserDelegate.height == 160)
    }
}
