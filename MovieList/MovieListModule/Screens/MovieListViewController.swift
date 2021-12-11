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
        static let cellId = "reuseIdentifier"
    }
    
    // MARK: - Properties
    
    var viewModel: MovieListViewModel!
    var pageCount: Int = 1
    
    // MARK: - Layout Properties
    
    private var movieTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = Theme.Palette.backgroundColor
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieListTableViewCell.self, forCellReuseIdentifier: Constant.cellId)
        return tableView
    }()
    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        viewModel.delegate = self
        viewModel.fetchMovie(page: pageCount)
    }
    
    // MARK: - Private  Methods
    
    private func setupUI() {
        self.view.addSubview(movieTableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.view.addConstraints([movieTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                  movieTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                  movieTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                  movieTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)])
        self.view.layoutIfNeeded()
    }
    
    private func setupTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfServices
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellId,
                                                    for: indexPath) as? MovieListTableViewCell {
            cell.configureCell(item: viewModel.items[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - ViewModel Delegate
extension MovieListViewController: MovieListViewModelDelegate {
    func moviesLoaded() {
        DispatchQueue.main.async {
            self.movieTableView.reloadData()
        }
    }
    
    func loadingActive(state: Bool) {
        
    }
    
    
}

