//
//  LiveFirstDishService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

import Foundation

struct LiveFirstDishRemoteService: FirstDishRemoteService{
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getFirstDishes() async throws -> [First] {
        return try await networkClient.get(url: ApiConstants.firstDishUrl)
    }
    
}
