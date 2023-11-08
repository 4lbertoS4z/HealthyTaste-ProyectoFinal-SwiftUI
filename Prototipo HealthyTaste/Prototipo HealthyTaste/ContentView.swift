

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    var body: some View {
        TabView {
            coordinator.makeFirstDishView()
                .tabItem {
                    Label("Entrantes", systemImage: "fork.knife")
                }
            
            SecondDishListView()
                .tabItem {
                    Label("Segundos", systemImage: "fork.knife")
                }
            
            DessertDishListView()
                .tabItem {
                    Label("Postres", systemImage: "fork.knife")
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
