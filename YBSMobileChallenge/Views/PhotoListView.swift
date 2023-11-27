//
//YBSMobileChallenge
//Created by Richy Price on 24/11/2023


import SwiftUI
import Combine

struct PhotosListView: View {
    @StateObject var viewModel = PhotosViewModel()
    @State private var searchText = ""
    @State private var selectedUserId: String?
    @State private var isUserDetailViewPresented = false
    @State private var isInitialLoad = true
    
    var body: some View {
        NavigationStack {
            VStack {
                SearchModePicker(searchMode: $viewModel.searchMode)
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                } else {
                    photosGrid
                }
            }
            .navigationTitle("YBS Mobile Challenge")
            .onAppear {
                if isInitialLoad {
                    viewModel.fetchPhotos(tagQuery: "Yorkshire")
                    isInitialLoad = false
                }
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                viewModel.searchPhotos(query: searchText)
            }
            .navigationDestination(isPresented: $isUserDetailViewPresented) {
                if let userId = selectedUserId {
                    UserDetailView(userId: userId)
                }
            }
        }
    }
    
    private var photosGrid: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 12)], spacing: 18) {
                ForEach(viewModel.photos, id: \.id) { photo in
                    PhotoView(viewModel: viewModel, photo: photo,
                              onTagTapped: { tag in viewModel.handleTagSelection(tag) },
                              onUserTapped: {
                        selectedUserId = photo.author_id
                        isUserDetailViewPresented = true
                    })
                    .aspectRatio(1, contentMode: .fit)
                }
            }
            .padding(.horizontal)
        }
    }
}


struct SearchModePicker: View {
    @Binding var searchMode: SearchMode
    
    var body: some View {
        Picker("Search Mode", selection: $searchMode) {
            Text("Contains Some Tags").tag(SearchMode.someTags)
            Text("Contains All Tags").tag(SearchMode.allTags)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}
