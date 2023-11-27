//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import SwiftUI
import Combine

struct PhotoView: View {
    @ObservedObject var viewModel: PhotosViewModel
    var photo: Photo
    var onTagTapped: ((String) -> Void)?
    var onUserTapped: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            NavigationLink(destination: PhotoDetailView(photo: photo)) {
                if let url = URL(string: photo.media.m.absoluteString ) {
                    CachedAsyncImage(url: url)
                        .scaledToFit()
                        .cornerRadius(10)
                        .clipped()
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .clipped()
                }
            }
            Button(action: { onUserTapped?() }) {
                HStack(spacing: 8) {
                    AsyncImage(url: photo.userIconURL) { image in
                        image.resizable()
                    } placeholder: {
                        Image(systemName: "person.circle.fill")
                    }
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(photo.title)
                            .font(.subheadline)
                            .lineLimit(1)
                        Text(photo.author_id.extractUsername())
                            .font(.caption)
                    }
                }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(photo.tagList, id: \.self) { tag in
                        Button(action: { onTagTapped?(tag) }) {
                            Text(tag)
                                .font(.system(size: 10))
                                .padding(.all, 5)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5)
                        }
                    }
                }
            }
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
