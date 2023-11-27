//
//YBSMobileChallenge
//Created by Richy Price on 24/11/2023
import Foundation

struct Photo: Codable, Identifiable, Equatable {
    static func == (lhs: Photo, rhs: Photo) -> Bool {
        lhs.id == rhs.id && lhs.title == rhs.title && lhs.link == rhs.link && lhs.tags == rhs.tags && lhs.description == rhs.description
    }
    
    var id = UUID()
    var title: String
    var link: URL
    var media: Media
    var tags: String
    var author_id: String
    var date_taken: String
    var description: String?

    enum CodingKeys: String, CodingKey {
        case title
        case link
        case media = "media"
        case tags
        case author_id
        case date_taken
        case description
    }
    
    var dateTaken: Date? {
            let dateFormatter = ISO8601DateFormatter()
            return dateFormatter.date(from: date_taken)
        }
}

