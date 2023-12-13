//
//  MockNetworkHandler.swift
//  CVSTestTests
//
//  Created by Raphael Kohn on 11/12/23.
//

import Foundation
import Combine
@testable import CVSTest

final class MockNetworkHandler: NetworkHandlerProtocol {
    
    var jsonString = """
    {
        "title": "Recent Uploads tagged porcupine",
        "link": "https://www.flickr.com/photos/tags/porcupine/",
        "description": "",
        "modified": "2023-12-05T16:50:48Z",
        "generator": "https://www.flickr.com",
        "items": [
       {
            "title": "2023 Employee Photo Contest",
            "link": "https://www.flickr.com/photos/usfs_eastern_region/53377991860/",
            "media": {"m":"https://live.staticflickr.com/65535/53377991860_b72c03276f_m.jpg"},
            "date_taken": "2023-05-05T15:15:30-08:00",
            "description": "any description"
            "published": "2023-12-05T16:50:48Z",
            "author": "nobody@flickr.com (\"usfs_Eastern_Region\")",
            "author_id": "38880169@N03",
            "tags": "2023 ottawanationalforest wildlife nature outdoors day porcupine spring may cellphone michigan unitedstatesofamerica"
       }

    }
    """
    
    func jsonDataTaskWith<T>(url: URL) async throws -> Result<T, Error> where T : Decodable {
        guard let data = jsonString.data(using: .utf8) else {
            return .failure(FlickerError.generalError(msg: "Test Failed. Data Error"))
        }
        let decoded = try decoder.decode(T.self, from: data)
        return .success(decoded)
    }
    
    func dataTaskWith(url: URL) async throws -> Result<Data, Error> {
        guard let data = jsonString.data(using: .utf8) else {
            return .failure(FlickerError.generalError(msg: "Test Failed. Data Error"))
        }
        return .success(data)
    }
    
    func jsonDataTaskPublisher<T>(url: URL) -> AnyPublisher<T, Error> where T : Decodable {
        fatalError("not implemented")
    }
}
