

import SwiftUI

struct DessertDishListView: View {
    @StateObject private var dessertDishViewModel = DessertDishViewModel()
    var body: some View {
            NavigationView{
                List(dessertDishViewModel.dessertDishs ?? []){ dessertDish in
                    NavigationLink(
                        destination: DessertDishDetailView(dessert: dessertDish),
                        label: {
                            HStack{
                                AsyncImage(url: URL(string: dessertDish.image)){state in
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
                                Text(dessertDish.name)
                            }
                        }
                        )
                }
                .navigationBarTitle("Dessert Dish")
            }
            .onAppear {
                Task {
                    do {
                        try await dessertDishViewModel.fetchDessertDish()
                    } catch(let error) {
                        print("Error: \(error)")
                    }
                }
            }
        }
    }


#Preview {
    DessertDishListView()
}
