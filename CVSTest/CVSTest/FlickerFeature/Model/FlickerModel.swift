//
//  FlickerModel.swift
//  CVSTest
//
//  Created by Raphael Kohn on 11/12/23.
//

import Foundation

struct FlickerModel: Decodable {
    let title: String
    let link: String
    let description: String
    let items: [FlickerItem]
}
