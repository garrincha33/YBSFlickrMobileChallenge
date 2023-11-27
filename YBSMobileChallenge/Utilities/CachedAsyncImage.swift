//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import Foundation
import UIKit
import SwiftUI


struct CachedAsyncImage: View {
    let url: URL
    @State private var uiImage: UIImage?
    
    var body: some View {
        Group {
            if let uiImage = uiImage {
                Image(uiImage: uiImage).resizable()
            } else {
                ProgressView()
                    .onAppear {
                        loadImage()
                    }
            }
        }
    }
    
    private func loadImage() {
        if let cachedImage = ImageCache.shared.getImage(forKey: url.absoluteString) {
            uiImage = cachedImage
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        ImageCache.shared.setImage(image, forKey: url.absoluteString)
                        uiImage = image
                    }
                }
            }.resume()
        }
    }
}

