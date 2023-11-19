//
//  SecondDishRespository.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

import Foundation

struct SecondDishRepository{
    private let remoteService: SecondDishRemoteService
    private let localService:
    SecondDishLocalService
    
    init(remoteService: SecondDishRemoteService, localService: SecondDishLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getSecondDishes() async throws -> [Second]{
        do{
            let remoteSecondDishes = try await
            remoteService.getSecondDishes()
            try localService.save(secondDishes: remoteSecondDishes)
            return remoteSecondDishes
        }catch{
            return try localService.getSecondDishes()
        }
    }
    
}
