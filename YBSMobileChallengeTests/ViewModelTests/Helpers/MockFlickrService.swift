//
//YBSMobileChallengeTests
//Created by Richy Price on 27/11/2023


import Foundation
import Combine
import XCTest
@testable import YBSMobileChallenge

class MockFlickrService: FlickrServiceProtocol {
    var photosToReturn: [Photo] = []
    var errorToReturn: Error?
    
    func fetchPhotos(tagQuery: String, safeSearch: Int) -> AnyPublisher<[Photo], Error> {
        if let error = errorToReturn {
            return Fail(error: error).eraseToAnyPublisher()
        }
        return Just(photosToReturn)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchPhotosByUser(userId: String, safeSearch: Int) -> AnyPublisher<[Photo], Error> {
        if let error = errorToReturn {
            return Fail(error: error).eraseToAnyPublisher()
        }
        return Just(photosToReturn)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

