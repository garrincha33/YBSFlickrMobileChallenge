//
//YBSMobileChallenge
//Created by Richy Price on 26/11/2023

enum FlickrError: Error {
    case badURL
    case parsingError
    case networkError(Error)
    case unknownError
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "The URL provided was invalid."
        case .parsingError:
            return "There was an error parsing the data."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .unknownError:
            return "An unknown error occurred."
        }
    }
}

