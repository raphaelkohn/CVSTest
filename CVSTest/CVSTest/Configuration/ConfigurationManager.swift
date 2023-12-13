//
//  ConfigurationManager.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import Foundation

class ConfigurationManager {
    static let baseUrl = Bundle.main.object(forInfoDictionaryKey: "baseUrl") as? String ?? ""
}
