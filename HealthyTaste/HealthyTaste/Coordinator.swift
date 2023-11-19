//
//  Coordinator.swift
//  Prototipo HealthyTaste
//
//  Created by alberto saz on 8/11/23.
//

import Foundation


class Coordinator: ObservableObject{
    private let firstDishRepository: FirstDishRepository
    private let secondDishRepository: SecondDishRepository
    private let dessertDishRepository: DessertDishRepository
    
    init(mock: Bool = false) {
        let netWorkClient = URLSessionNetworkClient()
        let firstDishRemoteService: FirstDishRemoteService = mock ? MockFirstDishRemoteService(): LiveFirstDishRemoteService(networkClient: netWorkClient)
        let firstDishLocalService: FirstDishLocalService = mock ? MockFirstDishLocalService(): UserDefaultsFirstDishLocalService()
        let secondDishRemoteService:SecondDishRemoteService = mock ?
        MockSecondDishRemoteService(): LiveSecondDishRemoteService(networkClient: netWorkClient)
        let secondDishLocalService: SecondDishLocalService = mock ? MockSecondDishLocalService(): UserDefaultsSecondDishLocalService()
        let dessertDishRemoteService:DessertDishRemoteService = mock ?
        MockDessertDishRemoteService(): LiveDessertDishRemoteService(networkClient: netWorkClient)
        let dessertDishLocalService: DessertDishLocalService = mock ? MockDessertLocalService(): UserDefaultsDessertDishLocalService()
        
        firstDishRepository = FirstDishRepository(remoteService: firstDishRemoteService, localService: firstDishLocalService)
        
        secondDishRepository = SecondDishRepository(remoteService: secondDishRemoteService, localService: secondDishLocalService)
        
        dessertDishRepository = DessertDishRepository(remoteService: dessertDishRemoteService, localService: dessertDishLocalService)
        
        
    }
    // MARK: - FirstDishView
    func makeFirstDishView() -> FirstDishListView{
        FirstDishListView(firstDishViewModel: makeFirstDishViewViewModel())
    }
    private func makeFirstDishViewViewModel() -> FirstDishViewModel{
        .init(firstDishRepository: firstDishRepository)
    }
    //MARK: - FirstDishDetailView
    func makeFirstDishDetailView(first: First, popHandler: (() -> Void)? = nil) -> FirstDishDetailView{
        return FirstDishDetailView(viewModel: makeFirstDishDetailViewModel(), firstDish: first, popHandler: popHandler)
    }
    func makeFirstDishFavoriteView() -> FirstDishFavoriteView{
        return FirstDishFavoriteView(firstDishViewModel: makeFirstDishFavoriteViewModel())
    }
    
    // MARK: - SecondDishView
    func makeSecondDishView() -> SecondDishListView{
        SecondDishListView(secondDishViewModel: makeSecondDishViewViewModel())
    }
    private func makeSecondDishViewViewModel() -> SecondDishViewModel{
        .init(secondDishRepository: secondDishRepository)
    }
    //MARK: - SecondDishDetailView
    func makeSecondDishDetailView(second: Second) -> SecondDishDetailView{
        .init(second: second)
    }
    // MARK: - DessertDishView
    func makeDessertDishView() -> DessertDishListView{
        DessertDishListView(dessertDishViewModel: makeDessertDishViewViewModel())
    }
    private func makeDessertDishViewViewModel() -> DessertDishViewModel{
        .init(dessertDishRepository: dessertDishRepository)
    }
    //MARK: - DessertDishDetailView
    func makeDessertDishDetailView(dessert: Dessert) -> DessertDishDetailView{
        .init(dessert: dessert)
    }
    private func makeFirstDishFavoriteView() -> FirstDishFavoriteViewModel {
        return FirstDishFavoriteViewModel(firstDishRepository: firstDishRepository)
    }
    private func makeFirstDishDetailViewModel() -> FirstDishDetailViewModel {
        return FirstDishDetailViewModel(firsDishRepository: firstDishRepository)
    }
    private func makeFirstDishFavoriteViewModel() -> FirstDishFavoriteViewModel {
        return FirstDishFavoriteViewModel(firstDishRepository: firstDishRepository)
    }
}
