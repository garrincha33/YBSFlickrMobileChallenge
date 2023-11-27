//
//YBSMobileChallenge
//Created by Richy Price on 24/11/2023


import Foundation
import Combine

class FlickrService: FlickrServiceProtocol {
    
    private let urlBuilder: FlickrURLBuilderProtocol
    
    init(urlBuilder: FlickrURLBuilderProtocol = FlickrURLBuilder()) {
        self.urlBuilder = urlBuilder
    }
    
    func fetchPhotos(tagQuery: String, safeSearch: Int = 1) -> AnyPublisher<[Photo], Error> {
        guard let url = urlBuilder.photosURL(tagQuery: tagQuery, safeSearch: safeSearch) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FlickrResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .mapError { error in
                return FlickrError.networkError(error)
            }
            .eraseToAnyPublisher()
    }
    
    func fetchPhotosByUser(userId: String, safeSearch: Int) -> AnyPublisher<[Photo], Error> {
        guard let url = urlBuilder.userPhotosURL(userId: userId, safeSearch: safeSearch) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FlickrResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .mapError { error in
                return FlickrError.networkError(error)
            }
            .eraseToAnyPublisher()
    }
}


