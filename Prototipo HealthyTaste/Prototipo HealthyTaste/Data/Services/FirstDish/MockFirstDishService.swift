//
//  MockFirstDishService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

struct MockFirstDishService: FirstDishService{
    func getFirstDishes() async throws -> [First] {
       [ .init(details: Details(elaboration: "", imgAllergies: "", ingredients: [], urlVideo: ""), id: 1, image: "",
            name: "Tortilla patata")
         ]
    }
}
