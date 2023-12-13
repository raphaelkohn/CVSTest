//
//  FlickerError.swift
//  CVSTest
//
//  Created by Raphael Kohn on 12/12/23.
//

import Foundation

enum FlickerError: Error {
    case malformedUrl
    case dataRetrievalError(msg: String)
    case generalError(msg: String)
}

extension FlickerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .malformedUrl:
            return Strings.malformedUrlError.localize()
        case .dataRetrievalError(msg: let msg):
            return "\(Strings.dataRetrievalError.localize()) - \(msg)"
        case .generalError(msg: let msg):
            return msg
        }
    }
}
