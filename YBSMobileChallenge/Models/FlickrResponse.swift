//
//YBSMobileChallenge
//Created by Richy Price on 24/11/2023


import Foundation

struct FlickrResponse: Codable {
    var title: String
    var link: URL
    var description: String
    var modified: String
    var generator: String
    var items: [Photo]
}

