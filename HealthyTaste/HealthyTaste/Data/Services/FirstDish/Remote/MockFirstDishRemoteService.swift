//
//  MockFirstDishService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

import Foundation

struct MockFirstDishRemoteService: FirstDishRemoteService{
    func getFirstDish(id: Int) async throws -> First {
        return First(details: Details(elaboration: "Una descripción de cómo se elabora",
                                              imgAllergies: "URL_imagen_alergenos",
                                              ingredients: ["Ingrediente1", "Ingrediente2"],
                                              urlVideo: "URL_video_receta"),
                             id: id,
                             image: "URL_imagen_plato",
                             name: "Nombre del plato para ID \(id)")
    }
    
    func getFirstDishes() async throws -> [First] {
       [ .init(details: Details(elaboration: "", imgAllergies: "", ingredients: [], urlVideo: ""), id: 1, image: "",
            name: "Tortilla patata")
         ]
    }
}
