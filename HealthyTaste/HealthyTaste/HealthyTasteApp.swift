

import SwiftUI

@main
struct HealthyTasteApp: App {
    var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
          //  ContentView().environmentObject(coordinator)
            SplashScreenView()
        }
    }
}
