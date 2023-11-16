

import SwiftUI

struct DessertDishListView: View {
    @StateObject private var dessertDishViewModel: DessertDishViewModel
    @EnvironmentObject var coordinator: Coordinator
    init(dessertDishViewModel: DessertDishViewModel){
        _dessertDishViewModel = StateObject(wrappedValue: dessertDishViewModel)
    }
    var body: some View {
        NavigationStack{
            List(dessertDishViewModel.dessertDishs){ dessertDish in
                makeGoToDetailNavigationLink(for: dessertDish)
            }
            .task {
                await dessertDishViewModel.fetchDessertDish()
            }
            .navigationTitle("Dessert Dish")
            .alert(isPresented: $dessertDishViewModel.showErrorMessage){
                Alert(title: Text("Error"),
                      message: Text("Se ha producido un error. Por favor, inténtalo de nuevo más tarde."),
                      dismissButton: .cancel()
                )
            }
        }
    }
    func makeGoToDetailNavigationLink(for dessert: Dessert) -> some View{
        NavigationLink{
            coordinator.makeDessertDishDetailView(dessert: dessert)
        } label: {
            DessertDishRowView(dessert: dessert)
        }
    }
}
#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeDessertDishView().environmentObject(coordinator)
}
