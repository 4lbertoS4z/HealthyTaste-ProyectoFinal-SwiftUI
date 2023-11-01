import Foundation

// MARK: - DishResponses
struct DishResponses: Decodable {
    let first: [First]
    let seconds: [Second]
    let desserts: [Dessert]
}

// MARK: - First
struct First: Decodable, Identifiable {
    let details: Details
    let id: Int
    let image: String
    let name: String
}
struct Second:Decodable, Identifiable{
    let details: Details
    let id: Int
    let image: String
    let name: String
}
struct Dessert: Decodable, Identifiable{
    let details: Details
    let id: Int
    let image: String
    let name: String
}

// MARK: - Details
struct Details: Decodable {
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


