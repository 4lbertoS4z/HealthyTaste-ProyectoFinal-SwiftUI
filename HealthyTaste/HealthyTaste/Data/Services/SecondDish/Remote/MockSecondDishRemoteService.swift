//
//  MockSecondDishRemoteService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

struct MockSecondDishRemoteService: SecondDishRemoteService{
    func getSecondDish(id: Int) async throws -> Second {
        return Second(details: Details(elaboration: "Una descripción de cómo se elabora",
                                       imgAllergies: "URL_imagen_alergenos",
                                       ingredients: ["Ingrediente1", "Ingrediente2"],
                                       urlVideo: "URL_video_receta"),
                      id: id,
                      image: "URL_imagen_plato",
                      name: "Nombre del plato para ID \(id)")
    }
    
    func getSecondDishes() async throws -> [Second] {
       [ .init(details: Details(elaboration: "", imgAllergies: "", ingredients: [], urlVideo: ""), id: 1, image: "",
            name: "Solomillo al vino tinto")
         ]
    }
}
