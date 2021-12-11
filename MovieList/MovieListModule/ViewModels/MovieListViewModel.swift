//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 11.12.2021.
//

final class MovieListViewModel {
    
    // MARK: - Private Properties
    
    private var dataController:MovieListDataController
    private var router: MovieListRouter
    
    // MARK: - Init
    
    init(dataController: MovieListDataController,
         router: MovieListRouter) {
        self.dataController = dataController
        self.router = router
    }
    
    // MARK: - Public Methods

    
}
