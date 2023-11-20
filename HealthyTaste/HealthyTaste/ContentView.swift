

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        TabView {
            coordinator.makeFirstDishView()
                .tabItem {
                    Label("First Dish", systemImage: "fork.knife")
                }
            
            coordinator.makeSecondDishView()
                .tabItem {
                    Label("Second Dish", systemImage: "fork.knife")
                }
            
            coordinator.makeDessertDishView()
                .tabItem {
                    Label("Desserts", systemImage: "fork.knife")
                }
            KcalCalculatorWebView()
                .tabItem{
                    Label("Kcal",systemImage: "fork.knife")
                }
            coordinator.makeFirstDishFavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            coordinator.makeSecondDishFavoriteView()
                .tabItem {
                    Label("Favorites 2", systemImage: "star")
                }
            coordinator.makeDessertDishFavoriteView()
                .tabItem {
                    Label("Favorites 3", systemImage: "star")
                }
        }
        
    }
}

#Preview {
    let coordinator = Coordinator(mock: false)
    return ContentView().environmentObject(coordinator)
}
