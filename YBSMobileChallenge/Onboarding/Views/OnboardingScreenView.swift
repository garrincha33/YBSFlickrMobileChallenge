//
//YBSMobileChallenge
//Created by Richy Price on 27/11/2023


import SwiftUI

struct OnboardingScreenView: View {
    var image: String
    var title: String
    var detail: String
    
    var body: some View {
        VStack(spacing: 20){
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top)
            
            Text(detail)
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
                .foregroundColor(.primary)
            
            Spacer(minLength: 120)
        }
        .padding()
    }
}

