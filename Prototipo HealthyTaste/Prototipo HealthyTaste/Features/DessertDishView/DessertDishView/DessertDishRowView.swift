//
//  DessertDishRowView.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import SwiftUI

struct DessertDishRowView: View {
    let dessert: Dessert
    var body: some View {
        HStack {
            RemoteImage(url: dessert.image)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .shadow(color: .gray, radius: 2, x: 4, y: 10)
            Spacer()
                        Text(dessert.name)
            Spacer()
        }
    }
}

