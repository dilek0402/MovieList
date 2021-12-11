//
//  MoviesDataModel.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 11.12.2021.
//

// MARK: - Movies Model

struct Movies: Codable {
    let page: Int
    let results: [Movie]
}

// MARK: - Movie Model

struct Movie: Codable {
    let backDropPath: String?
    let posterPath: String?
    let name: String?
    let id: Int?
    let overview: String?
    let popularity: Double?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backDropPath = "backdrop_path"
        case posterPath = "poster_path"
        case name
        case id
        case overview
        case popularity
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
}
