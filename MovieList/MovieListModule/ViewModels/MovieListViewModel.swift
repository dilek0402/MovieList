//
//  MovieListViewModel.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 11.12.2021.
//

import Foundation

final class MovieListViewModel {
    
    // MARK: - Private Properties
    
    private var dataController:MovieListDataController
    private var router: MovieListRouter
    
    
    // MARK: - Public Properties
    
    weak var delegate: MovieListViewModelDelegate?
    
    var items: [Movie] = [] {
        didSet {
            delegate?.moviesLoaded()
        }
    }
    
    var numberOfServices: Int {
        items.count
    }
    
    var totalPage: Int = 1
    
    
    // MARK: - Init
    
    init(dataController: MovieListDataController,
         router: MovieListRouter) {
        self.dataController = dataController
        self.router = router
    }
    
    
    // MARK: - Public Methods
    
    func fetchMovie(page: Int) {
        delegate?.loadingActive(state: true)
        dataController.fetchMovies(page: page) { [weak self] resultModel, error in
            if error != nil {
                return
            }
            guard let model = resultModel else {
                return
            }
            self?.delegate?.loadingActive(state: false)
            self?.totalPage = model.totalPages
            self?.items.append(contentsOf: model.results)
        }
    }
    
    func proceedToMovieDetailViewController(movie: Movie) {
        router.proceedToMovieDetailViewController(movie: movie)
    }
}

// MARK: - Delegate

protocol MovieListViewModelDelegate: NSObject {
    func moviesLoaded()
    func loadingActive(state: Bool)
}
