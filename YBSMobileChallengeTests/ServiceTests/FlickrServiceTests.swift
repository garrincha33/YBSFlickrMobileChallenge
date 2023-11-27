//
//YBSMobileChallengeTests
//Created by Richy Price on 26/11/2023


import XCTest
import Combine
@testable import YBSMobileChallenge

class FlickrServiceTests: XCTestCase {
    var flickrService: FlickrService!
    var mockNetworkService: MockNetworkService!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        flickrService = FlickrService()
        cancellables = []
    }

    override func tearDown() {
        mockNetworkService = nil
        flickrService = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchPhotosSuccess() {
        let jsonString = "{\"items\": [test]}"
        mockNetworkService.mockData = jsonString.data(using: .utf8)
        
        let expectation = XCTestExpectation(description: "Fetch photos completes successfully.")

        flickrService.fetchPhotos(tagQuery: "nature", safeSearch: 1)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    XCTFail("Request failed with error: \(error)")
                case .finished:
                    break
                }
            }, receiveValue: { photos in
                XCTAssertNotNil(photos, "No photos returned")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchPhotosInvalidDataError() {
        let invalidData = "Invalid data".data(using: .utf8)!
        mockNetworkService.mockData = invalidData

        let expectation = XCTestExpectation(description: "Fetch photos fails due to invalid data.")

        flickrService.fetchPhotos(tagQuery: "nature", safeSearch: 1)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure( _ as DecodingError):
                    expectation.fulfill()
                case .failure(_):
                    XCTFail("Expected decoding error but received different error")
                case .finished:
                    XCTFail("Expected failure but fetchPhotos completed")
                }
            }, receiveValue: { _ in
                XCTFail("Expected no value but received some data")
            })
            .store(in: &cancellables)
    }
    


}
