//
//  FirstDishService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

protocol FirstDishRemoteService{
    func getFirstDishes() async throws ->[First]
}
