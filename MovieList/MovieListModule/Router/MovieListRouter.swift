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
        initialViewController = controller
    }
}

extension MovieListRouter {
    
    func proceedToMovieDetailViewController() {
        let controller = MovieDetailViewController()
        initialViewController = controller
    }
}
