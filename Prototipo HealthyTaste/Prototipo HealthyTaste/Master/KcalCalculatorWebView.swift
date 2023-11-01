import SwiftUI


struct KcalCalculatorWebView: View {
   
    let url = URL(string:ApiConstants.kcalCalculatorUrl)!
    var body: some View {
        
            VStack{
                WebView(url: url)
                    .padding()
            }
        
    }
}

