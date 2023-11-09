import Foundation

// MARK: - DishResponses
struct DishResponses: Codable {
    let first: [First]
    let seconds: [Second]
    let desserts: [Dessert]
}

// MARK: - First
struct First: Codable, Identifiable {
    let details: Details
    let id: Int
    let image: String
    let name: String
}
struct Second:Codable, Identifiable{
    let details: Details
    let id: Int
    let image: String
    let name: String
}
struct Dessert: Codable, Identifiable{
    let details: Details
    let id: Int
    let image: String
    let name: String
}

// MARK: - Details
struct Details: Codable {
    let elaboration: String
    let imgAllergies: String
    let ingredients: [String]
    let urlVideo: String
    
    enum CodingKeys: String, CodingKey {
        case elaboration
        case imgAllergies = "img_allergies"
        case ingredients
        case urlVideo = "url_video"
    }
}


