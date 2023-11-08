

import SwiftUI

@main
struct Prototipo_HealthyTasteApp: App {
    var coordinator = Coordinator()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(coordinator)
        }
    }
}
