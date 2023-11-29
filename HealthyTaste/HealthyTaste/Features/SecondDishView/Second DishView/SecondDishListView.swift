

import SwiftUI

struct SecondDishListView: View {
    @StateObject private var secondDishViewModel: SecondDishViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    init(secondDishViewModel: SecondDishViewModel){
        _secondDishViewModel = StateObject(wrappedValue: secondDishViewModel)
    }
    var body: some View {
        NavigationStack{
            List(secondDishViewModel.secondDishs){ secondDish in
                makeGoToDetailNavigationLink(for: secondDish)
            }
            .task {
                await secondDishViewModel.fetchSecondDish()
            }
            .navigationTitle("Second Dish")
            .alert(isPresented: $secondDishViewModel.showErrorMessage){
                Alert(title: Text("Error"),
                      message: Text("An error has occurred. Please try again later."),
                      dismissButton: .cancel()
                )
            }
        }
    }
    func makeGoToDetailNavigationLink(for second: Second) -> some View{
        NavigationLink{
            coordinator.makeSecondDishDetailView(second: second)
        } label: {
            SecondDishRowView(second: second)
        }
    }
}


#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeSecondDishView().environmentObject(coordinator)
}
