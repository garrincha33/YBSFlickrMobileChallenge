//
//YBSMobileChallenge
//Created by Richy Price on 27/11/2023


import SwiftUI

class OnboardingViewModel: ObservableObject {
    @AppStorage("currentPage") var currentPage = 1
    let totalPages = 3
    
    func goToNextPage() {
        if currentPage < totalPages {
            currentPage += 1
        } else {
            currentPage += 1
        }
    }
    
    func goToPreviousPage() {
        if currentPage > 1 {
            currentPage -= 1
        }
    }
    func skipToEnd() {
        currentPage = totalPages + 1
    }
}
