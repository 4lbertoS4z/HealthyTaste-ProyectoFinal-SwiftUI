

import Foundation

class DessertDishViewModel: ObservableObject{
    private let dessertDishRepository: DessertDishRepository
    
    @Published private(set) var dessertDishs = [Dessert]()
    @Published var showErrorMessage = false
    
    init(dessertDishRepository: DessertDishRepository) {
        self.dessertDishRepository = dessertDishRepository
       }
    @MainActor
    func fetchDessertDish() async {
        do {
            dessertDishs = try await
            dessertDishRepository.getDessertDishes()
        } catch {
            showErrorMessage = true
        }
    }
    
}
