

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        TabView {
            coordinator.makeFirstDishView()
                .tabItem {
                    Label("First Dish", systemImage: "fork.knife")
                }
            
            SecondDishListView()
                .tabItem {
                    Label("Second Dish", systemImage: "fork.knife")
                }
            
            DessertDishListView()
                .tabItem {
                    Label("Desserts", systemImage: "fork.knife")
                }
            KcalCalculatorWebView()
                .tabItem{
                    Label("Kcal",systemImage: "fork.knife")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
