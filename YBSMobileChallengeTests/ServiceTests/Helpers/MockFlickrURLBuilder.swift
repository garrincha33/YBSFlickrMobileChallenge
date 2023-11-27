//
//YBSMobileChallengeTests
//Created by Richy Price on 26/11/2023


import Foundation
import YBSMobileChallenge

class MockFlickrURLBuilder: FlickrURLBuilderProtocol {
    var photosURLToReturn: URL?
    var userPhotosURLToReturn: URL?
    
    func photosURL(tagQuery: String, safeSearch: Int) -> URL? {
        return photosURLToReturn
    }
    
    func userPhotosURL(userId: String, safeSearch: Int) -> URL? {
        return userPhotosURLToReturn
    }
}

