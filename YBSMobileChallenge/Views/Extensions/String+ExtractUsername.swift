//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import Foundation

extension String {
    func extractUsername() -> String {
        let components = self.components(separatedBy: "(\"")
        if components.count > 1 {
            return components[1].replacingOccurrences(of: "\")", with: "")
        }
        return self
    }
}
