//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import Foundation

extension Photo {
    var userIconURL: URL {
        if !author_id.isEmpty {
            return URL(string: "https://www.flickr.com/buddyicons/\(author_id).jpg")!
        } else {
            return URL(string: "https://www.flickr.com/images/buddyicon.gif")!
        }
    }
}
