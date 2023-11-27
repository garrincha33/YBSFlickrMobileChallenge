//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023


import SwiftUI

struct TagDetailView: View {
    var tag: String
    @StateObject var viewModel = PhotosViewModel()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible())]) {
                ForEach(viewModel.photos, id: \.id) { photo in
                    PhotoView(viewModel: viewModel, photo: photo)
                }
            }
        }
        .onAppear {
            viewModel.handleTagSelection(tag)
        }
    }
}

