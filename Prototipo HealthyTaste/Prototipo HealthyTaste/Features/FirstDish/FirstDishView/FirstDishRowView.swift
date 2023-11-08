

import SwiftUI

struct FirstDishRowView: View {
    let first: First
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: first.image)) { state in
                switch state {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.horizontal, 4)
                        .shadow(color: .gray, radius: 2, x: 4, y: 10)
                case .failure:
                    Text("Error al cargar la imagen")
                @unknown default:
                    EmptyView()
                }
            }
            Text(first.name)
        }
        
    }
}

