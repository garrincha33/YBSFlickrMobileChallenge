//
//YBSMobileChallenge
//Created by Richy Price on 24/11/2023


import Foundation
import Combine

protocol FlickrServiceProtocol {
    func fetchPhotos(tagQuery: String, safeSearch: Int) -> AnyPublisher<[Photo], Error>
    func fetchPhotosByUser(userId: String, safeSearch: Int) -> AnyPublisher<[Photo], Error>
}

