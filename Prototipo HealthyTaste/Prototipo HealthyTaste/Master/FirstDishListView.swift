

import SwiftUI

struct FirstDishListView: View {
    @StateObject private var firstDishViewModel = FirstDishViewModel()
    
    var body: some View {
        NavigationStack{
            List(firstDishViewModel.firstDishs ?? []){ firstDish in
                NavigationLink(
                    destination: FirstDishDetailView(first: firstDish),
                    label: {
                        HStack{
                            AsyncImage(url: URL(string: firstDish.image)){state in
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
                            Text(firstDish.name)
                        }
                    }
                    )
            }
            .navigationBarTitle("First Dish")
        }
        .onAppear {
            Task {
                do {
                    try await firstDishViewModel.fetchFirstDish()
                } catch(let error) {
                    print("Error: \(error)")
                }
            }
        }
    }
}


#Preview {
    FirstDishListView()
}


