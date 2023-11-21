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
    func makeFavoriteDishesView() -> FavoriteDishesView{
        return FavoriteDishesView(firstDishViewModel: makeFirstDishFavoriteViewModel(),secondDishViewModel:makeSecondDishFavoriteViewModel(), dessertDishViewModel:makeDessertDishFavoriteViewModel())
    }
    
    // MARK: - SecondDishView
    func makeSecondDishView() -> SecondDishListView{
        SecondDishListView(secondDishViewModel: makeSecondDishViewViewModel())
    }
    private func makeSecondDishViewViewModel() -> SecondDishViewModel{
        .init(secondDishRepository: secondDishRepository)
    }
    //MARK: - SecondDishDetailView
    func makeSecondDishDetailView(second: Second, popHandler: (() -> Void)? = nil) -> SecondDishDetailView{
        return SecondDishDetailView(viewModel:makeSecondDishDetailViewModel(), secondDish: second, popHandler: popHandler)
    }
    
    // MARK: - DessertDishView
    func makeDessertDishView() -> DessertDishListView{
        DessertDishListView(dessertDishViewModel: makeDessertDishViewViewModel())
    }
    private func makeDessertDishViewViewModel() -> DessertDishViewModel{
        .init(dessertDishRepository: dessertDishRepository)
    }
    //MARK: - DessertDishDetailView
    func makeDessertDishDetailView(dessert: Dessert, popHandler: (() -> Void)? = nil) -> DessertDishDetailView{
        return DessertDishDetailView(viewModel:makeDessertDishDetailViewModel(), dessert: dessert, popHandler: popHandler)
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
    private func makeSecondDishFavoriteView() -> SecondDishFavoriteViewModel {
        return SecondDishFavoriteViewModel(secondDishRepository: secondDishRepository)
    }
    private func makeSecondDishDetailViewModel() -> SecondDishDetailViewModel {
        return SecondDishDetailViewModel(secondDishRepository: secondDishRepository)
    }
    private func makeSecondDishFavoriteViewModel() -> SecondDishFavoriteViewModel {
        return SecondDishFavoriteViewModel(secondDishRepository: secondDishRepository)
    }
    private func makeDessertDishFavoriteView() -> DessertDishFavoriteViewModel {
        return DessertDishFavoriteViewModel(dessertDishRepository: dessertDishRepository)
    }
    private func makeDessertDishDetailViewModel() -> DessertDishDetailViewModel {
        return DessertDishDetailViewModel(dessertDishRepository: dessertDishRepository)
    }
    private func makeDessertDishFavoriteViewModel() -> DessertDishFavoriteViewModel {
        return DessertDishFavoriteViewModel(dessertDishRepository: dessertDishRepository)
    }
}
