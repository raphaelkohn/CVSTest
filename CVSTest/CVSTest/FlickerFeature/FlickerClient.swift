//
//  FlickerClient.swift
//  CVSTest
//
//  Created by Raphael Kohn on 11/12/23.
//

import Foundation
import EasyDI
import Combine

protocol FlickerClientProtocol {
    func retrieveTagPublisher(tag: String) -> AnyPublisher<FlickerModel, FlickerError>
    func retrieveFrom(tag: String) async throws -> FlickerModel
    func downloadImage(imageUrl: String) async throws -> Data
}

class FlickerClient: FlickerClientProtocol {
    
    @Inject
    var networkHandler: any NetworkHandlerProtocol
    
    private let baseUrl = ConfigurationManager.baseUrl
    
    func retrieveTagPublisher(tag: String) -> AnyPublisher<FlickerModel, FlickerError> {
        do {
            let url = try urlBuilder(tag: tag)
            return networkHandler.jsonDataTaskPublisher(url: url)
                .mapError { FlickerError.dataRetrievalError(msg: $0.localizedDescription) }
                .eraseToAnyPublisher()
        } catch {
            return Just(FlickerModel(title: "", link: "", description: "", items: []))
                .setFailureType(to: FlickerError.self)
                .mapError({ _ in FlickerError.malformedUrl })
                .eraseToAnyPublisher()
        }
    }
    
    func retrieveFrom(tag: String) async throws -> FlickerModel {
        
        let url = try urlBuilder(tag: tag)
        
        let result: Result<FlickerModel, Error> = try await networkHandler.jsonDataTaskWith(url: url)
        
        switch result {
        case .success(let model):
            return model
        case .failure(let err):
            throw FlickerError.dataRetrievalError(msg: err.localizedDescription)
        }
    }

    func downloadImage(imageUrl: String) async throws -> Data {
        fatalError("Not Implemented")
    }
    
    private func urlBuilder(tag: String) throws -> URL {
        let urlString = baseUrl + tag
        guard let url = URL(string: urlString) else {
            throw FlickerError.malformedUrl
        }
        return url
    }
}
