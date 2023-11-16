//
//  MockFirstDessertLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

class MockDessertLocalService: DessertDishLocalService{
    private var dessertDishes = [Dessert]()
    
    func getDessertDishes() throws -> [Dessert] {
        dessertDishes
    }
    
    func save(dessertDishes: [Dessert]) throws {
        self.dessertDishes = dessertDishes
    }
}

