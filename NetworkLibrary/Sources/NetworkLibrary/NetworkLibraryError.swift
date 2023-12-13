//
//  File.swift
//  
//
//  Created by Raphael Kohn on 11/12/23.
//

import Foundation

public class NetworkLibraryError: Error {
   
    public enum ErrorCase {
        case urlSessionError(URLError)
        case urlEncodingError
        case genericError
    }
    
    var error: ErrorCase
    
    public init(_ errorCase: ErrorCase = .genericError) {
        self.error = errorCase
    }
}

extension NetworkLibraryError: LocalizedError {
    public var errorDescription: String? {
        switch error {
        case .urlSessionError(let urlError):
            return urlError.localizedDescription
        case .urlEncodingError:
            return Strings.networkErrorUrlEncode.localize()
        case .genericError:
            return Strings.networkErrorGeneric.localize()
        }
    }
}
