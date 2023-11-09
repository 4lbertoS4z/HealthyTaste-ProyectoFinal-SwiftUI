

import SwiftUI

struct FirstDishRowView: View {
    let first: First
    
    var body: some View {
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

