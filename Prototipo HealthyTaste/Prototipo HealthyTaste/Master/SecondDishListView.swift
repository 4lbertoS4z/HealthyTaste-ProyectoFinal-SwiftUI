

import SwiftUI

struct SecondDishListView: View {
    @StateObject private var
    secondDishViewModel = SecondDishViewModel()
    
    var body: some View {
        NavigationView{
            List(secondDishViewModel.secondDishs ?? []){ secondDish in
                NavigationLink(
                    destination: SecondDishDetailView(second: secondDish),
                    label: {
                        HStack{
                            AsyncImage(url: URL(string: secondDish.image)){state in
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
                            Text(secondDish.name)
                        }
                    }
                )
            }
            .navigationBarTitle("Second Dish")
        }
        .onAppear {
            Task {
                do {
                    try await secondDishViewModel.fetchSecondDish()
                } catch(let error) {
                    print("Error: \(error)")
                }
            }
        }

        
    }
}


#Preview {
    SecondDishListView()
}
