

import SwiftUI

struct FirstDishListView: View {
    @StateObject private var firstDishViewModel: FirstDishViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    init(firstDishViewModel: FirstDishViewModel) {
        _firstDishViewModel = StateObject(wrappedValue: firstDishViewModel)
    }
    
    var body: some View {
        NavigationStack{
            
            List(firstDishViewModel.firstDishs){ firstDish in
                makeGoToDetailNavigationLink(for: firstDish)
            }
            .task {
                
                await firstDishViewModel.fetchFirstDish()
            }
            .navigationTitle("First Dish")
            .alert(isPresented: $firstDishViewModel.showErrorMessage){
                Alert(title: Text("Error"),
                      message: Text("An error has occurred. Please try again later."),
                      dismissButton: .cancel()
                )
            }
        }
    }
    func makeGoToDetailNavigationLink(for first: First) -> some View{
        NavigationLink{
            coordinator.makeFirstDishDetailView(first: first)
        } label: {
            FirstDishRowView(first: first)
        }
    }
}
#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeFirstDishView().environmentObject(coordinator)
}


