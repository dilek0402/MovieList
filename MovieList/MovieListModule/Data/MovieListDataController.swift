//
//  MovieListDataController.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 11.12.2021.
//

import Foundation

final class MovieListDataController: MovieListDataProtocol {
    
    // MARK: - Constant Enum
    
    private enum Constant {
        static let path = "3/movie/popular?api_key="
        static let pagingKey = "&page="
    }
    
    // MARK: - Public Methods
    
    func fetchMovies(page: Int,
                     completion: @escaping completion) {
        let urlString = NetworkConfiguration.basePath + Constant.path +
        NetworkConfiguration.apiKey + NetworkConfiguration.language +
        Constant.pagingKey + String(page)
        let url = URL(string: urlString)!
        let task = URLSession.shared.sendRequest(url: url,
                                                 completionHandler: { (result: Movies?, response, error) in
            if let error = error {
                completion(nil, error)
            }
            completion(result, nil)
        })
        task.resume()
    }
}
