

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
                      message: Text("Se ha producido un error. Por favor, inténtalo de nuevo más tarde."),
                      dismissButton: .cancel()
                )
            }
        }
    }
    func makeGoToDetailNavigationLink(for first: First) -> some View{
        NavigationLink{
            coordinator.makeFirstDishDetailView(first: first)
        } label: {
            HStack {
                RemoteImage(url: first.image)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .shadow(color: .gray, radius: 2, x: 4, y: 10)
                Spacer()
                            Text(first.name)
                Spacer()
            }
        }
    }
}
#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeFirstDishView().environmentObject(coordinator)
}


