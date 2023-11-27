//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import Foundation

extension Optional where Wrapped == String {
    var isNotNil: Bool {
        self != nil
    }
}
