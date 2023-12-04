//
//  DessertDishRemoteService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//


protocol DessertDishRemoteService{
    func getDessertDishes() async throws ->[Dessert]
    func getDessertDish(id: Int) async throws -> Dessert
}
