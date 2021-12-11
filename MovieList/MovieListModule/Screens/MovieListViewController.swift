//
//  MovieListViewController.swift
//  MovieList
//
//  Created by Dilek Eminoğlu on 10.12.2021.
//

import UIKit

final class MovieListViewController: UIViewController {
    
    // MARK: - Constant
    
    private enum Constant {
        
    }
    
    // MARK: - Properties
    
    var viewModel: MovieListViewModel!
    
    // MARK: - Layout Properties
    
    private var movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()



    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private  Methods
    
    private func setupUI() {
        
    }
    
    private func makeAutoLayout() {
        
    }
}

