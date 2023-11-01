import Foundation

class FirstDishViewModel: ObservableObject {
    @Published private(set) var firstDishs: [First]?
    
    func fetchFirstDish() async {
        do {
            var urlRequest = URLRequest(url: URL(string: ApiConstants.firstDishUrl)!)
            urlRequest.httpMethod = "GET"
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            print("Response: \(response.description)")
            
            let decoder = JSONDecoder()
            let firstDishResponse = try decoder.decode([First].self, from: data)
            
            DispatchQueue.main.async {
                self.firstDishs = firstDishResponse
            }
        } catch {
            print("Error fetching and decoding data: \(error)")
        }
    }
}
