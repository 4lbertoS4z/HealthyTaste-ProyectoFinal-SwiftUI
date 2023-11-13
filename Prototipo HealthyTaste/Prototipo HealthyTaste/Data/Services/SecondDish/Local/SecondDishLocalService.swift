//
//  SecondDishLocalService.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 13/11/23.
//

protocol SecondDishLocalService{
    func getSecondDishes() throws ->[Second]
    func save(secondDishes:[Second]) throws
}
