//
//  SecondDishRemoteService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//


protocol SecondDishRemoteService{
    func getSecondDishes() async throws ->[Second]
    func getSecondDish(id: Int) async throws -> Second
}
