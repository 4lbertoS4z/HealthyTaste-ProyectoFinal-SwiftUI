//
//  UserDefaultsDessertDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation
struct UserDefaultsDessertDishLocalService: DessertDishLocalService{
    private let dessertDishesKey = "Dessert"
    
    func getDessertDishes() throws -> [Dessert] {
        guard let data = UserDefaults.standard.data(forKey: dessertDishesKey) else{
            return []
        }
        return try JSONDecoder().decode([Dessert].self, from: data)
    }
    
    func save(dessertDishes: [Dessert]) throws {
        let data = try JSONEncoder().encode(dessertDishes)
        UserDefaults.standard.set(data, forKey: dessertDishesKey)
    }
}
