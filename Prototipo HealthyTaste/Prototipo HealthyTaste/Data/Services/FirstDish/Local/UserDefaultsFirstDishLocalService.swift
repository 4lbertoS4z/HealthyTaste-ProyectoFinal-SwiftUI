//
//  UserDefaultsFirstDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//

import Foundation
struct UserDefaultsFirstDishLocalService: FirstDishLocalService{
    private let firstDishesKey = "First"
    
    func getFirstDishes() throws -> [First] {
        guard let data = UserDefaults.standard.data(forKey: firstDishesKey) else{
            return []
        }
        return try JSONDecoder().decode([First].self, from: data)
    }
    
    func save(firstDishes: [First]) throws {
        let data = try JSONEncoder().encode(firstDishes)
        UserDefaults.standard.set(data, forKey: firstDishesKey)
    }
}
