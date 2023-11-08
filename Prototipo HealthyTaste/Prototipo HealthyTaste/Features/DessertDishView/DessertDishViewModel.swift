

import Foundation

class DessertDishViewModel: ObservableObject{
    @Published private(set) var dessertDishs:[Dessert]?
    
    func fetchDessertDish() async {
        do {
            var urlRequest = URLRequest(url: URL(string: ApiConstants.dessertDishUrl)!)
            urlRequest.httpMethod = "GET"
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("Response: \(response.description)")
            
            let decoder = JSONDecoder()
            let dessertDishResponse = try decoder.decode([Dessert].self, from: data)
            
            DispatchQueue.main.async {
                self.dessertDishs = dessertDishResponse
            }
        } catch {
            print("Error fetching and decoding data: \(error)")
        }
    }
    
}
