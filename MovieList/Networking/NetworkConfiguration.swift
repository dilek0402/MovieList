//
//  NetworkConfiguration.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 11.12.2021.
//

struct NetworkConfiguration {
    
    // MARK: - Properties
    
    static var basePath: String {
        return "https://api.themoviedb.org/"
    }
    
    static  var apiKey: String {
        return "16b57169954864f01854a6d42dbd2234"
    }
    
    static  var language: String {
        return "&language=en-US"
    }
}
