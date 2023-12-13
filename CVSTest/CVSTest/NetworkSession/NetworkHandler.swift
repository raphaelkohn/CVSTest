//
//  NetworkHandler.swift
//  CVSTest
//
//  Created by Raphael Kohn on 11/12/23.
//

import Foundation
import NetworkLibrary
import EasyDI
import Combine

extension NetworkLibrary: NetworkHandlerProtocol {
    
    func jsonDataTaskPublisher<T: Decodable>(url: URL) -> AnyPublisher<T, Error> {
        self.retrieveDataPublisher(url: url)
            .print()
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func jsonDataTaskWith<T>(url: URL) async throws -> Result<T, Error> where T : Decodable {
        do {
            let data = try await getDatafrom(url: url)
            let decoded = try decoder.decode(T.self, from: data)
            return .success(decoded)
        } catch let err {
            return .failure(err)
        }
    }
    
    func dataTaskWith(url: URL) async throws -> Result<Data, Error> {
        do {
            let data = try await getDatafrom(url: url)
            return .success(data)
        } catch let err {
            return .failure(err)
        }
    }
    
    private func getDatafrom(url: URL) async throws -> Data {
        do {
            let request = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad)
            return try await self.retrieveDataFrom(urlRequest: request)
        } catch let err {
            throw err
        }
    }
}
