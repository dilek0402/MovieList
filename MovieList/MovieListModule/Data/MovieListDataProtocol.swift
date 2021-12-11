//
//  MovieListDataProtocol.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 11.12.2021.
//

protocol MovieListDataProtocol {
    
    typealias completion = (Movies?, Error?) -> Void
    
    func fetchMovies(page: Int,
                     completion: @escaping completion)
    
}
