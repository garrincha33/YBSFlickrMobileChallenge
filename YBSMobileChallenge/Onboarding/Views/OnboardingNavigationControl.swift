//
//YBSMobileChallenge
//Created by Richy Price on 27/11/2023


import SwiftUI

struct OnboardingNavigationControls: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                if viewModel.currentPage > 1 {
                    Button(action: viewModel.goToPreviousPage) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .clipShape(Circle())
                    }
                }
                
                Spacer()
                Button(action: {
                    if viewModel.currentPage == viewModel.totalPages {
                        viewModel.skipToEnd()
                    } else {
                        viewModel.goToNextPage()
                    }
                }) {
                    Text(viewModel.currentPage == viewModel.totalPages ? "Get Started" : "Next")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            }
            .padding()
        }
    }
}
