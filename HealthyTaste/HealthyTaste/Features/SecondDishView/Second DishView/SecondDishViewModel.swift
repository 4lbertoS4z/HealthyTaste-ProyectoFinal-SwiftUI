

import Foundation

class SecondDishViewModel: ObservableObject{
    private let secondDishRepository:
    SecondDishRepository
    
    @Published private(set) var secondDishs = [Second]()
    @Published var showErrorMessage = false
    
    init(secondDishRepository: SecondDishRepository) {
        self.secondDishRepository = secondDishRepository
        }
    @MainActor
    func fetchSecondDish() async{
        do{
            secondDishs = try await
            secondDishRepository.getSecondDishes()
        } catch{
           showErrorMessage = true
        }
    }
}
