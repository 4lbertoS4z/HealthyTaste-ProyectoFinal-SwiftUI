//
//  DessertDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

protocol DessertDishLocalService{
    func getDessertDishes() throws ->[Dessert]
    func save(dessertDishes:[Dessert]) throws
}
