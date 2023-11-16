//
//  MockFirstDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//

class MockFirstDishLocalService: FirstDishLocalService{
    private var firstDishes = [First]()
    
    func getFirstDishes() throws -> [First] {
        firstDishes
    }
    
    func save(firstDishes: [First]) throws {
        self.firstDishes = firstDishes
    }
}
