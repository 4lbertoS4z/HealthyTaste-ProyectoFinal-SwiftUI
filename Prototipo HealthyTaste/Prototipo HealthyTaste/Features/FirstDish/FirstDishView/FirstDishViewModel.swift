import Foundation

class FirstDishViewModel: ObservableObject {
    private let firstDishRepository: FirstDishRepository
    @Published private(set) var firstDishs = [First]()
    @Published var showErrorMessage = false
    
    init(firstDishRepository: FirstDishRepository){
        self.firstDishRepository = firstDishRepository
        
    }
    @MainActor
    func fetchFirstDish() async {
        do {
            firstDishs = try await firstDishRepository.getFirstDishes()
        } catch {
            showErrorMessage = true
        }
    }
}
