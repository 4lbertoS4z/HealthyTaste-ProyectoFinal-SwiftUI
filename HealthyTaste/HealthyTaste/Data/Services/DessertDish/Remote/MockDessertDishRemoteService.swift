//
//  MockDessertDishRemoteService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

struct MockDessertDishRemoteService: DessertDishRemoteService{
    func getDessertDishes() async throws -> [Dessert] {
       [ .init(details: Details(elaboration: "", imgAllergies: "", ingredients: [], urlVideo: ""), id: 1, image: "",
            name: "Profiteroles de nata")
         ]
    }
}
