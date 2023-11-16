//
//  MockSecondDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

class MockSecondDishLocalService: SecondDishLocalService{
    private var secondDishes = [Second]()
    
    func getSecondDishes() throws -> [Second] {
        secondDishes
    }
    
    func save(secondDishes: [Second]) throws {
        self.secondDishes = secondDishes
    }
}

