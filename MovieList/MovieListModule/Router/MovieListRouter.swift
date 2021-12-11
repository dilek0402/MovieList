//
//  MovieListRouter.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 11.12.2021.
//

import UIKit

final class MovieListRouter {
    
    // MARK: - Properties
    
    var initialViewController: UIViewController!
    
    //MARK: - Init
    
    init() {
        let controller = MovieListViewController()
        let dataController = MovieListDataController()
        let viewModel = MovieListViewModel(dataController: dataController,
                                           router: self)
        controller.viewModel = viewModel
        initialViewController = controller
    }
}

extension MovieListRouter {
    
    func proceedToMovieDetailViewController() {
        let controller = MovieDetailViewController()
        let viewModel = MovieDetailViewModel()
        initialViewController = controller
    }
}
