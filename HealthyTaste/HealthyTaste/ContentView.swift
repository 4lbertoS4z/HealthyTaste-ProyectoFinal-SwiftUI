

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        TabView {
            coordinator.makeFirstDishView()
                .tabItem {
                    Image("firstDish")
                }
            
            coordinator.makeSecondDishView()
                .tabItem {
                    Image("secondDish")
                }
            
            coordinator.makeDessertDishView()
                .tabItem {
                    Image("dessertDish")
                }
            KcalCalculatorWebView()
                .tabItem{
                    Image("kCal")
                }
            coordinator.makeFavoriteDishesView()
                .tabItem {
                    Image("star")
                }
            
        }
        
    }
}

#Preview {
    let coordinator = Coordinator(mock: false)
    return ContentView().environmentObject(coordinator)
}
