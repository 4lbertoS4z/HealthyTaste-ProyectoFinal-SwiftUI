//
//  MockSecondDishRemoteService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

struct MockSecondDishRemoteService: SecondDishRemoteService{
    func getSecondDishes() async throws -> [Second] {
       [ .init(details: Details(elaboration: "", imgAllergies: "", ingredients: [], urlVideo: ""), id: 1, image: "",
            name: "Solomillo al vino tinto")
         ]
    }
}
