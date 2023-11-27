//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import Foundation

public protocol FlickrURLBuilderProtocol {
    func photosURL(tagQuery: String, safeSearch: Int) -> URL?
    func userPhotosURL(userId: String, safeSearch: Int) -> URL?
}

class FlickrURLBuilder: FlickrURLBuilderProtocol {
    private let baseURLString = "https://api.flickr.com/services/feeds/photos_public.gne"
    
    func photosURL(tagQuery: String, safeSearch: Int = 1) -> URL? {
        var components = URLComponents(string: baseURLString)
        components?.queryItems = [
            URLQueryItem(name: "tags", value: tagQuery),
            URLQueryItem(name: "tagmode", value: "any"),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1"),
            URLQueryItem(name: "safe_search", value: String(safeSearch))
        ]
        return components?.url
    }
    
    func userPhotosURL(userId: String, safeSearch: Int = 1) -> URL? {
        var components = URLComponents(string: baseURLString)
        components?.queryItems = [
            URLQueryItem(name: "id", value: userId),
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1"),
            URLQueryItem(name: "safe_search", value: String(safeSearch))
        ]
        return components?.url
    }
}

