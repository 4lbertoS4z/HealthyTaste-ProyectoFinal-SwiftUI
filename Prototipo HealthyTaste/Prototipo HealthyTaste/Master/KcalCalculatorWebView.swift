import SwiftUI


struct KcalCalculatorWebView: View {
   
    let url = URL(string:ApiConstants.kcalCalculatorUrl)!
    var body: some View {
        NavigationView {
            WebView(url: url)
                
        }
    }
}

