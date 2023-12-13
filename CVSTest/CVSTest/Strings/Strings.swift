//
//  Strings.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import Foundation

enum Strings: String {
    
    case malformedUrlError
    case dataRetrievalError
    
    //View Texts
    case navigationTitle
    case widthLiteral
    case heightLiteral
    case authorLiteral
    case tagsLiteral
    case dateTakenLiteral
    
    private var key: String {
        guard let key = self.rawValue.snakeCased() else {
            return ""
        }
        
        return key
    }
    
    func localize() -> String {
        return NSLocalizedString(self.key, comment: "")
    }
    
    func localizedStringWithVariables(vars: CVarArg...) -> String {
        return String(format: NSLocalizedString(self.key, tableName: nil, bundle: Bundle.main, value: "", comment: ""), arguments: vars)
    }
}

extension String {
    func snakeCased() -> String? {
        let pattern = "([a-z0-9])([A-Z])"
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: count)
        return regex?.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: "$1_$2").lowercased()
    }
}
