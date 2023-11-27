//
//YBSMobileChallengeTests
//Created by Richy Price on 27/11/2023


import XCTest
@testable import YBSMobileChallenge
import Combine

class PhotosViewModelTests: XCTestCase {
    var viewModel: PhotosViewModel!
    var mockFlickrService: MockFlickrService!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        mockFlickrService = MockFlickrService()
        viewModel = PhotosViewModel(flickrService: mockFlickrService)
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        mockFlickrService = nil
        cancellables = nil
        super.tearDown()
    }
    
    func testFetchPhotosSuccess() {
        let expectedPhotos = [Photo(id: UUID(), title: "Test Photo", link: URL(string: "http://example.com")!, media: Media(m: URL(string: "http://example.com/photo.jpg")!), tags: "test", author_id: "1", date_taken: "2023-11-26T12:00:00-05:00", description: "Test Description")]
        mockFlickrService.photosToReturn = expectedPhotos
        
        let expectation = XCTestExpectation(description: "ViewModel should load photos successfully.")
        
        viewModel.$photos
            .sink { photos in
                if photos == expectedPhotos {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchPhotos(tagQuery: "Yorkshire")
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testFetchPhotosFailure() {
        mockFlickrService.errorToReturn = URLError(.badServerResponse)
        
        let expectation = XCTestExpectation(description: "ViewModel should handle errors correctly.")
        
        viewModel.$errorMessage
            .sink { errorMessage in
                if errorMessage != nil {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchPhotos(tagQuery: "Yorkshire")
        
        wait(for: [expectation], timeout: 5.0)
    }
}

