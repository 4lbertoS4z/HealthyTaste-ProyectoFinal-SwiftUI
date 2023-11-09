//
//  FirstDishDetailView.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

import SwiftUI

struct FirstDishDetailView: View {
    let firstDish: First
    var body: some View {
        VStack {
            ScrollView{
                Text(firstDish.name)
                    .font(.headline)
                AsyncImage(url: URL(string: firstDish.image)) { state in
                    switch state {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                    case .failure:
                        Text("Error al cargar la imagen")
                    @unknown default:
                        EmptyView()
                    }
                }
                Text("Ingredientes:")
                    .font(.title)
                Text(firstDish.details.ingredients.description)
                Text("Elaboración:")
                    .font(.title)
                Text(firstDish.details.elaboration)
                
            }
        }
        .navigationBarTitle("Recipe Detail", displayMode: .inline)
    }
}


