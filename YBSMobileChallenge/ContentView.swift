//
//YBSMobileChallenge
//Created by Richy Price on 24/11/2023


import SwiftUI

struct ContentView: View {
    @StateObject var onboardingViewModel = OnboardingViewModel()
    
    var body: some View {
        if onboardingViewModel.currentPage > onboardingViewModel.totalPages {
            Home()
        } else {
            WalkthroughScreen(viewModel: onboardingViewModel)
        }
    }
}

struct Home: View {
    var body: some View {
        ProgressView()
    }
}
