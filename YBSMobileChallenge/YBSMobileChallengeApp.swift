//
//YBSMobileChallenge
//Created by Richy Price on 24/11/2023


import SwiftUI

@main
struct YBSMobileChallengeApp: App {
    @AppStorage("currentPage") var currentPage = 1
    let totalPages = 3
    
    var body: some Scene {
        WindowGroup {
            if currentPage > totalPages {
                PhotosListView()
            } else {
                ContentView()
            }
        }
    }
}
