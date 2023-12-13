//
//  NetworkHandler.swift
//  CVSTest
//
//  Created by Raphael Kohn on 11/12/23.
//

import Foundation
import Combine
import EasyDI

protocol NetworkHandlerProtocol {
    var decoder: JSONDecoder { get }
    func jsonDataTaskWith<T: Decodable>(url: URL) async throws -> Result<T, Error>
    func dataTaskWith(url: URL) async throws -> Result<Data, Error>
    func jsonDataTaskPublisher<T: Decodable>(url: URL) -> AnyPublisher<T, Error>
}

extension NetworkHandlerProtocol {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
   
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        decoder.dateDecodingStrategy = .formatted(formatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return decoder
    }
}
