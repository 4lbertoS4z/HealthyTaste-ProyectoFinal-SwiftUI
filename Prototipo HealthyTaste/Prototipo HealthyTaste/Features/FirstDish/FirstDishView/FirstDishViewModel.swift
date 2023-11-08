import Foundation

class FirstDishViewModel: ObservableObject {
    private let fistDishService: FirstDishService
    @Published private(set) var firstDishs = [First]()
    @Published var showErrorMessage = false
    
    init(fistDishService: FirstDishService){
        self.fistDishService = fistDishService
        
    }
    @MainActor
    func fetchFirstDish() async {
        do {
            firstDishs = try await fistDishService.getFirstDishes()
        } catch {
            showErrorMessage = true
        }
    }
}
