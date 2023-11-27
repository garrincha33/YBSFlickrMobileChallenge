//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import Foundation
import SwiftUI

struct PhotoRow: View {
    var photo: Photo
    
    var body: some View {
        HStack {
            CachedAsyncImage(url: photo.userIconURL)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(photo.title)
                    .font(.headline)
                Text(photo.author_id.extractUsername())
                    .font(.subheadline)
            }
            Spacer()
            AsyncImage(url: URL(string: photo.media.m.absoluteString)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .cornerRadius(8)
        }
    }
}
