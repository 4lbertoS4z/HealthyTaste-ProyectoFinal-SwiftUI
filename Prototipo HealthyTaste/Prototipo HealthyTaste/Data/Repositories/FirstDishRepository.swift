//
//  FirstDishRepository.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 9/11/23.
//

struct FirstDishRepository{
    private let remoteService: FirstDishRemoteService
    private let localService: FirstDishLocalService
    
    init(remoteService: FirstDishRemoteService, localService: FirstDishLocalService) {
        self.remoteService = remoteService
        self.localService = localService
    }
    
    func getFirstDishes() async throws -> [First]{
        do{
            let remoteFirstDishes = try await remoteService.getFirstDishes()
            try localService.save(firstDishes: remoteFirstDishes)
            return remoteFirstDishes
        }catch{
            return try localService.getFirstDishes()
        }
    }
}
