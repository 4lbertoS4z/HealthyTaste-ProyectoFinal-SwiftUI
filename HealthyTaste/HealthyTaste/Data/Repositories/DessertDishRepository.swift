//
//  DessertDishRepository.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation

struct DessertDishRepository{
    private let remoteService: DessertDishRemoteService
    private let localService:
    DessertDishLocalService
    
    init(remoteService: DessertDishRemoteService, localService: DessertDishLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getDessertDishes() async throws -> [Dessert]{
        do{
            let remoteDessertDishes = try await
            remoteService.getDessertDishes()
            try localService.save(dessertDishes: remoteDessertDishes)
            return remoteDessertDishes
        }catch{
            return try localService.getDessertDishes()
        }
    }
    
}


