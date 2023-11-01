

import Foundation

class SecondDishViewModel: ObservableObject{
    @Published private(set) var secondDishs: [Second]?
    
    func fetchSecondDish() async{
        do{
            var urlRequest = URLRequest(url: URL(string: ApiConstants.secondDishUrl)!)
            urlRequest.httpMethod = "GET"
            let (data, response) = try await
            URLSession.shared.data(for: urlRequest)
            print("Response: \(response.description)")
            
            let decoder = JSONDecoder()
            let secondDishResponse = try
            decoder.decode([Second].self, from: data)
            
            DispatchQueue.main.async{
                self.secondDishs = secondDishResponse
            }
        } catch{
            print("Error fetChing and decoding data: \(error)")
        }
    }
}
