//
//YBSMobileChallenge
//Created by Richy Price on 27/11/2023


import Foundation
import SwiftUI

struct WalkthroughScreen: View {
    @StateObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        ZStack {
            switch viewModel.currentPage {
            case 1:
                OnboardingScreenView(image: "image1", title: "🌟 Hello and Welcome Aboard!🌟", detail: "You've just discovered your new photo adventure – The YBS Mobile Challenge Flickr App! 📸✨")
            case 2:
                OnboardingScreenView(image: "image2", title: "Using The App", detail: "Not sure what you're looking for? No worries! Just tap on a user and voila – a gallery of their amazing work awaits you. Or, dive into the world of tags – each a gateway to a unique category of visual delights. 🖼️🌈")
            case 3:
                OnboardingScreenView(image: "image3", title: "Enjoy", detail: "And guess what? As a special treat, we've loaded the app with mesmerising photos of lovely Yorkshire for your first journey with us. A perfect start to inspire your day! Enjoy the exploration, and let your photo journey begin! 🌳🌷")
            default:
                EmptyView()
            }
            
            OnboardingNavigationControls(viewModel: viewModel)
        }
        .background(Color(UIColor.systemBackground).edgesIgnoringSafeArea(.all))
    }
}
