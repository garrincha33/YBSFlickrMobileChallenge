//
//YBSMobileChallengeTests
//Created by Richy Price on 26/11/2023


import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetchData(from url: URL) -> AnyPublisher<Data, URLError>
}

class NetworkService: NetworkServiceProtocol {
    func fetchData(from url: URL) -> AnyPublisher<Data, URLError> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}

class MockNetworkService: NetworkServiceProtocol {
    var mockData: Data?
    var mockError: URLError?

    func fetchData(from url: URL) -> AnyPublisher<Data, URLError> {
        if let error = mockError {
            return Fail(error: error).eraseToAnyPublisher()
        } else {
            return Just(mockData ?? Data())
                .setFailureType(to: URLError.self)
                .eraseToAnyPublisher()
        }
    }
}
