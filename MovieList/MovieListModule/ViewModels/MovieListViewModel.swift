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
    private var mv: Movies?
    
    // MARK: - Init
    
    init(dataController: MovieListDataController,
         router: MovieListRouter) {
        self.dataController = dataController
        self.router = router
    }
    
    
    // MARK: - Public Methods
    
    func fetchMovie(page: Int) {
        dataController.fetchMovies(page: page) { [weak self] resultModel, error in
            if error != nil {
                return
            }
            guard let model = resultModel else {
                return
            }
            self?.mv = model
        }
    }
}
