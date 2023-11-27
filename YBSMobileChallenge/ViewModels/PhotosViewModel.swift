//
//YBSMobileChallenge
//Created by Richy Price on 24/11/2023


import Foundation
import Combine

enum SearchMode {
    case allTags, someTags
}

class PhotosViewModel: ObservableObject {
    @Published var photos: [Photo] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var searchMode: SearchMode = .someTags
    @Published var favorites: [Photo] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let flickrService: FlickrServiceProtocol
    private let searchSubject = PassthroughSubject<String, Never>()
    
    init(flickrService: FlickrServiceProtocol = FlickrService()) {
        self.flickrService = flickrService
        setupSearchSubscriber()
    }
    
    private func setupSearchSubscriber() {
        searchSubject
            .debounce(for: .seconds(3), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                self?.performSearch(query)
            }
            .store(in: &cancellables)
    }
    
    private func performSearch(_ query: String) {
        if query.isEmpty {
            fetchPhotos(tagQuery: "Yorkshire")
        } else {
            let tags = query.components(separatedBy: " ")
            let tagQuery = tags.joined(separator: searchMode == .allTags ? "+" : ",")
            fetchPhotos(tagQuery: tagQuery)
        }
    }
    
    private func handleCompletion(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .failure(let error):
            errorMessage = error.localizedDescription
        case .finished:
            break
        }
        isLoading = false
    }
    
    func searchPhotos(query: String) {
        if query.isEmpty {
            fetchPhotos(tagQuery: "Yorkshire", safeSearch: 1)
        } else {
            let tags = query.components(separatedBy: " ")
            switch searchMode {
            case .allTags:
                searchPhotosByTags(tags: tags, matchAll: true)
            case .someTags:
                searchPhotosByTags(tags: tags, matchAll: false)
            }
        }
    }
    
    
    func fetchPhotos(tagQuery: String, safeSearch: Int = 1) {
        isLoading = true
        errorMessage = nil
        
        flickrService.fetchPhotos(tagQuery: tagQuery, safeSearch: safeSearch)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.handleCompletion(completion)
            }, receiveValue: { [weak self] photos in
                self?.photos = photos
            })
            .store(in: &cancellables)
    }
    
    func handleTagSelection(_ tag: String) {
        isLoading = true
        errorMessage = nil
        flickrService.fetchPhotos(tagQuery: tag, safeSearch: 1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.handleCompletion(completion)
            }, receiveValue: { [weak self] photos in
                self?.photos = photos
            })
            .store(in: &cancellables)
    }
    
    func handleUserSelection(_ userId: String) {
        isLoading = true
        errorMessage = nil
        flickrService.fetchPhotosByUser(userId: userId, safeSearch: 1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.handleCompletion(completion)
            }, receiveValue: { [weak self] photos in
                self?.photos = photos
            })
            .store(in: &cancellables)
    }
    
    func searchPhotosByTags(tags: [String], matchAll: Bool) {
        isLoading = true
        errorMessage = nil
        
        let tagQuery = tags.joined(separator: matchAll ? "+" : ",")
        flickrService.fetchPhotos(tagQuery: tagQuery, safeSearch: 1)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.handleCompletion(completion)
            }, receiveValue: { [weak self] photos in
                self?.photos = photos
            })
            .store(in: &cancellables)
    }
}

