import Foundation
import Combine

public class NetworkLibrary {

    private var session: URLSession
    private var downloadSession: URLSession
    
    public init() {
        self.session = URLSession.shared
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        config.networkServiceType = .default
        self.downloadSession = URLSession(configuration: config)
    }
    
    public func retrieveDataPublisher(url: URL) -> AnyPublisher<Data, NetworkLibraryError> {
        session.dataTaskPublisher(for: url)
            .tryMap { element -> Data in
                guard let response = element.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return element.data
            }
            .mapError({ error -> NetworkLibraryError in
                if let urlError = error as? URLError {
                    return NetworkLibraryError(.urlSessionError(urlError))
                } else {
                    return NetworkLibraryError()
                }
            })
            .print()
            .eraseToAnyPublisher()
    }
    
    public func retrieveDataFrom(urlRequest: URLRequest) async throws -> Data {
        do {
            let response = try await session.data(for: urlRequest)
            return response.0
        } catch let err {
            throw err
        }
    }
}


