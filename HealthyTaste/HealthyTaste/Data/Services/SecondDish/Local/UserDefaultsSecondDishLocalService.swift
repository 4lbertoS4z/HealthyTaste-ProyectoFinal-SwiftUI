//
//  UserDefaultsSecondDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation
struct UserDefaultsSecondDishLocalService: SecondDishLocalService{
    private let secondDishesKey = "Second"
    
    func getSecondDishes() throws -> [Second] {
        guard let data = UserDefaults.standard.data(forKey: secondDishesKey) else{
            return []
        }
        return try JSONDecoder().decode([Second].self, from: data)
    }
    
    func save(secondDishes: [Second]) throws {
        let data = try JSONEncoder().encode(secondDishes)
        UserDefaults.standard.set(data, forKey: secondDishesKey)
    }
}
