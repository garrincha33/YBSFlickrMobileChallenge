//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import Foundation

extension Photo {
    var tagList: [String] {
        return tags.components(separatedBy: " ").filter { !$0.isEmpty }
    }
}
